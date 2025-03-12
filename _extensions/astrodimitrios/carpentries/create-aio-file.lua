local title
local site_url
local cp_icon

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
      if key == "  title" then
        title = value
      end
      if key == "  site-url" then
        site_url = value
      end
      if key == "  carpentry_icon" then
        cp_icon = value
      end
    end
  end

  file:close()
  return data
end

function write_aio_file(episodes)
  print("Writing AIO File")
  local dir = os.getenv("PWD")
  local filename = dir .. "/episodes/aio.qmd"
  local aio_file = io.open(filename, "w")
  local aio_content = ""
  if aio_file then
    for i, episode in ipairs(episodes) do
      aio_content = aio_content .. "{{< include " .. episode .. " >}}\n"
    end
    -- The document yaml goes at the end to overwrite all the
    -- yaml metadata from the included files
    aio_content = aio_content .. "---\ntitle: 'All in One Page'\ninput_file: 'aio'\n---\n"
    -- print(aio_content)
    aio_file:write(aio_content)
    aio_file:close()
  else
    error("Couldn't create AIO file", 2)
  end
end

local center_slide_contents_style = [[
    include-in-header: 
      text: |
        <style>
        .reveal img.center-xy, svg.center-xy {
          display:block;
          margin-left:auto;
          margin-right:auto;
        }
        div.center-xy img,svg {
          display:block;
          margin-left:auto;
          margin-right:auto;
        }
        .reveal img[src$=".svg"]:not(.slide-logo),svg:not(.slide-logo) {
          object-fit: contain;
          /* max-width: inherit !important; */
          max-height: 80% !important;
        }
        div.center-xy img[src$=".svg"]:not(.slide-logo),svg:not(.slide-logo) {
          object-fit: contain;
          /* max-width: inherit !important; */
          max-height: 80% !important;
        }
        </style>
]]

function write_all_images_file(episodes)
  print("Writing All Images Presentation")
  local dir = os.getenv("PWD")
  local filename = dir .. "/episodes/extract_all_images.qmd"
  local key_points_filename = dir .. "/episodes/key-points.qmd"
  local key_points_content = ""
  local aio_file = io.open(filename, "w")
  if aio_file then
    local aio_content = ""
    for i, episode in ipairs(episodes) do
      local episode_filename = dir.."/episodes/"..episode
      local episode_file = io.open(episode_filename, "r")
      if episode_file then
        for line in episode_file:lines() do
          local key, value = line:match("(.[^:]+): (.*)")
          if key == "title" then
            value = value:gsub("\"", "")
            aio_content = aio_content.."\n\n# "..value.."\n\n"
            key_points_content = key_points_content.."\n\n# ["..value.."]("..episode..")\n\n"
            break
          end
        end
        episode_file:close()
        aio_content = aio_content.."{{< include "..episode.." >}}\n"
        key_points_content = key_points_content.."{{< include "..episode.." >}}\n"
      else
        error("Couldn't open the episode file: "..episode_filename)
      end
    end
    -- The document yaml goes at the end to overwrite all the
    -- yaml metadata from the included files
    title = remove_prefix(title, ' ')
    title = remove_prefix(title, '"')
    title = remove_prefix(title, "'")
    title = remove_suffix(title, '"')
    title = remove_suffix(title, "'")
    cp_icon = remove_prefix(cp_icon, ' ')
    -- print(title)
    aio_content = aio_content.."---\ntitle: "..title.."\n"
    aio_content = aio_content.."subtitle: 'Extract All Images'\n"
    aio_content = aio_content.."format: \n  revealjs:\n"
    aio_content = aio_content.."    slide-level: 2\n    navigation-mode: vertical\n"
    aio_content = aio_content.."    logo: ../site_libs/quarto-contrib/carpentries-images-1.0.0/images/"..cp_icon.."-logo-sm.svg\n"
    aio_content = aio_content.."    footer: '"..title..": Extract All Images'\n"
    aio_content = aio_content.."    scrollable: true\n"
    aio_content = aio_content.."    auto-stretch: false\n"
    aio_content = aio_content.."    mermaid-format: svg\n"
    aio_content = aio_content..center_slide_contents_style
    aio_content = aio_content.."filters:\n  - "..dir.."/_extensions/astrodimitrios/carpentries/images-filter.lua\n"
    aio_content = aio_content.."---\n"
    aio_file:write(aio_content)
    aio_file:close()
  else
    error("Couldn't create All Images presentation file", 2)
  end
  local key_points_file = io.open(key_points_filename, "w")
  if key_points_file then
    print("Writing Key Points File")
    key_points_content = key_points_content.."---\ntitle: Key Points\n"
    key_points_content = key_points_content.."filters:\n  - "..dir.."/_extensions/astrodimitrios/carpentries/key-points-filter.lua\n"
    key_points_content = key_points_content.."---\n"
    key_points_file:write(key_points_content)
    key_points_file:close()
  else
    error("Couldn't create Key Points file", 2)
  end
end

episodes = read_quarto_yaml_files_episodes("_quarto.yml")
write_aio_file(episodes)
write_all_images_file(episodes)
