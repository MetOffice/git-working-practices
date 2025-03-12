function read_quarto_yaml_files_profiles(filename)
  -- Open the _quarto.yml file
  local file = io.open(filename, "r")
  if not file then
    return nil, "Failed to open file: " .. filename
  end

  local data = {}
  local found_profiles = false

  -- Loop over each line
  for line in file:lines() do
    if found_profiles then
      -- This line is below the profiles key
      -- and needs including in the AIO file
      local key, value = line:match("(.[^-]+)- (.+)")
      table.insert(data, value)
      if value == nil then
        -- Stop when you reach the next key
        found_profiles = false
      end
    else
      local key, value = line:match("(.[^:]+):(.*)")
      if key == "  profiles" then
        found_profiles = true
      end
    end
  end

  file:close()
  return data
end

function write_aio_file(profiles)
  print("Writing Profiles File")
  local dir = os.getenv("PWD")
  local filename = dir .. "/profiles/profiles.qmd"
  local aio_file = io.open(filename, "w")
  local aio_content = "# Learner Profiles"
  if aio_file then
    for i, profile in ipairs(profiles) do
      aio_content = aio_content .. "{{< include " .. profile .. " >}}\n"
    end
    -- The document yaml goes at the end to overwrite all the
    -- yaml metadata from the included files
    aio_content = aio_content .. "---\ntitle: 'Learner Profiles'\n"
    -- aio_content = aio_content.."filters:\n  - "..dir.."/_extensions/astrodimitrios/carpentries/profiles-filter.lua\n"
    aio_content = aio_content .. "---\n"
    -- print(aio_content)
    aio_file:write(aio_content)
    aio_file:close()
  else
    error("Couldn't create Profiles file", 2)
  end
end

profiles = read_quarto_yaml_files_profiles("_quarto.yml")
write_aio_file(profiles)
