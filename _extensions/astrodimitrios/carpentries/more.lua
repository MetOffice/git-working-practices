PANDOC_VERSION:must_be_at_least '2.11'

function remove_prefix(str, prefix)
    if str:sub(1, #prefix) == prefix then
        return str:sub(#prefix + 1)
    else
        return str
    end
end

function remove_suffix(str, suffix)
    if str:sub(#str - (#suffix - 1), #str) == suffix then
        return str:sub(1, #str - #suffix)
    else
        return str
    end
end

function read_quarto_yaml_file_resources(filename)
  -- Open the _quarto.yml file
  local file = io.open(filename, "r")
  if not file then
    return nil, "Failed to open file: " .. filename
  end

  local data = {}
  local found_resources = false

  -- Loop over each line
  for line in file:lines() do
    if found_resources then
      -- This line is below the resources key
      -- and needs including in the AIO file
      local key, value = line:match("(.[^-]+)- (.+)")
      table.insert(data, value)
      if value == nil then
        -- Stop when you reach the next key
        found_resources = false
      end
    else
      local key, value = line:match("(.[^:]+):(.*)")
      if key == "  learners" then
        found_resources = true
      end
    end
  end

  file:close()
  return data
end

local function get_resource_title(resource)
  local dir = os.getenv("PWD")
  local resource_filename = dir.."/learners/"..resource
  local resource_file = io.open(resource_filename, "r")
  local key, value
  if resource_file then
    for line in resource_file:lines() do
      key, value = line:match("(.[^:]+): (.*)")
      if key == "title" then
        value = value:gsub("\"", "")
        break
      end
    end
    resource_file:close()
    return value
  else
    error("Couldn't open the resource file: "..resource_filename)
  end
end

local more_dropdown_html = "\n"

local list_html = "<li><a class='dropdown-item' href='{{resource_href}}'>{{resource_title}}</a></li>"

function write_more_dropdown_html_file(resources)
  local dir = os.getenv("PWD")
  for i, resource in ipairs(resources) do
    -- Remove extension
    if resource ~= "setup.md" then
        local input_file_name = resource:match("(.+)%..+$")
        local resource_href = input_file_name..".html"
        local resource_list_html = list_html:gsub("{{resource_href}}", resource_href)
        local resource_title
        resource_title = get_resource_title(resource)
        resource_title = remove_prefix(resource_title, "'")
        resource_title = remove_prefix(resource_title, '"')
        resource_title = remove_suffix(resource_title, "'")
        resource_title = remove_suffix(resource_title, '"')
        resource_list_html = resource_list_html:gsub("{{resource_title}}", resource_title)
        more_dropdown_html = more_dropdown_html.."\n"..resource_list_html
    end
  end

  local more_dropdown_template_filename = dir .. "/_extensions/astrodimitrios/carpentries/templates/more-dropdown.html"
  local more_dropdown_template_file = io.open(more_dropdown_template_filename, "w")
  more_dropdown_template_file:write(more_dropdown_html.."\n")
  more_dropdown_template_file:close()
end

resources = read_quarto_yaml_file_resources("_quarto.yml")
write_more_dropdown_html_file(resources)
