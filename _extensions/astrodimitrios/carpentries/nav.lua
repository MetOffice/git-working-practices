PANDOC_VERSION:must_be_at_least '2.11'

-- local headers = {}

-- function find_headers(header)
--   if header.level == 2 then
--     -- print(pandoc.utils.stringify(header.content))
--     -- print(header.t)
--     -- print(header.identifier)
--     table.insert(headers, header)
--   end
--   return header
-- end

function read_quarto_yaml_files_episodes(filename)
  -- Open the _quarto.yml file
  local file = io.open(filename, "r")
  if not file then
    return nil, "Failed to open file: " .. filename
  end

  local data = {}
  local found_episodes = false

  -- Loop over each line
  for line in file:lines() do
    if found_episodes then
      -- This line is below the episodes key
      -- and needs including in the AIO file
      local key, value = line:match("(.[^-]+)- (.+)")
      table.insert(data, value)
      if value == nil then
        -- Stop when you reach the next key
        found_episodes = false
      end
    else
      local key, value = line:match("(.[^:]+):(.*)")
      if key == "  episodes" then
        found_episodes = true
      end
    end
  end

  file:close()
  return data
end

local function get_episode_title(episode)
  local dir = os.getenv("PWD")
  local episode_filename = dir.."/episodes/"..episode
  local episode_file = io.open(episode_filename, "r")
  local key, value
  if episode_file then
    for line in episode_file:lines() do
      key, value = line:match("(.[^:]+): (.*)")
      if key == "title" then
        value = value:gsub("\"", "")
        break
      end
    end
    episode_file:close()
    return value
  else
    error("Couldn't open the episode file: "..episode_filename)
  end
end

-- not used atm will be provided by the TOC QUARTO
local current_accordion_html = [[
        <div class="accordion accordion-flush" id="accordionFlushcurrent">
          <div class="accordion-item">
            <div class="accordion-header" id="flush-headingcurrent">
              <button class="accordion-button" type="button" data-bs-toggle="collapse"
                data-bs-target="#flush-collapsecurrent" aria-expanded="true" aria-controls="flush-collapsecurrent">
                <span class="visually-hidden">Current Chapter</span>
                <span class="current-chapter">
                  {{episode_title}}
                </span>
              </button>
            </div><!--/div.accordion-header-->

            <div id="flush-collapsecurrent" class="accordion-collapse collapse show"
              aria-labelledby="flush-headingcurrent" data-bs-parent="#accordionFlushcurrent">
              <div class="accordion-body">
                <ul>
                  {{header_list}}
                </ul>
              </div><!--/div.accordion-body-->
            </div><!--/div.accordion-collapse-->
          </div><!--/div.accordion-item-->
        </div><!--/div.accordion-flush-->
]]

local accordion_html = [[
        <div class="accordion accordion-flush" id="accordionFlush{{nav_number}}">
          <div class="accordion-item">
            <div class="accordion-header" id="flush-heading{{nav_number}}">
              <a href="{{episode_href}}">{{episode_title}}</a>
            </div><!--/div.accordion-header-->
          </div><!--/div.accordion-item-->
        </div><!--/div.accordion-flush-->
]]

local nav_number = 1

local nav_html = ""

function write_nav_html_file(episodes)
  local dir = os.getenv("PWD")
  local episode_accordion_html = accordion_html:gsub("{{episode_href}}", "index.html")
  episode_accordion_html = episode_accordion_html:gsub("{{nav_number}}", nav_number)
  nav_number = nav_number + 1
  episode_accordion_html = episode_accordion_html:gsub("{{episode_title}}", "Summary and Setup")
  nav_html = nav_html.."\n\n"..episode_accordion_html
  for i, episode in ipairs(episodes) do
    -- Remove extension
    local input_file_name = episode:match("(.+)%..+$")
    local episode_href = input_file_name..".html"
    local episode_accordion_html = accordion_html:gsub("{{episode_href}}", episode_href)
    episode_accordion_html = episode_accordion_html:gsub("{{nav_number}}", nav_number)
    nav_number = nav_number + 1
    local episode_title
    episode_title = get_episode_title(episode)
    episode_accordion_html = episode_accordion_html:gsub("{{episode_title}}", pandoc.utils.stringify(i)..". "..episode_title)
    nav_html = nav_html.."\n\n"..episode_accordion_html
  end

  local nav_template_filename = dir .. "/_extensions/astrodimitrios/carpentries/templates/nav.html"
  local nav_template_file = io.open(nav_template_filename, "w")
  nav_template_file:write(nav_html)
  nav_template_file:close()
end

episodes = read_quarto_yaml_files_episodes("_quarto.yml")
write_nav_html_file(episodes)
