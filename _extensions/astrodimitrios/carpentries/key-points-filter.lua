PANDOC_VERSION:must_be_at_least '2.11'

local hblocks = {}

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local key_points_filter = {
  traverse = 'topdown',
  BulletList = function(el)
    table.insert(hblocks, el)
    return el, false
  end
}

function Pandoc(doc)
  for i, el in pairs(doc.blocks) do
    -- print("--------------")
    -- print(el)
    -- print(el.classes)
    if (el.t == "Div" and has_value(el.classes, "keypoints")) then
      _ = el:walk(key_points_filter)
    end
    if el.t == "Header" then
      if el.level == 1 then
        el.level = 2
        table.insert(hblocks, el)
        -- previous_header = current_header
        -- current_header = el
      end
    end
    if (el.t == "Div" and el.classes[1] == "hidden") or 
       (el.t == "Div" and el.classes[1] == "quarto-auto-generated-content") then
      table.insert(hblocks, el)
    end
  end
  return pandoc.Pandoc(hblocks, doc.meta)
end
