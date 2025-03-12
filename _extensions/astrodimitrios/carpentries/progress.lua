PANDOC_VERSION:must_be_at_least '2.11'

function set_progress(meta)
  local progress = 0
  if meta.episode ~= nil then
    progress = math.floor(pandoc.utils.stringify(meta.episode) / #meta.carpentries.episodes * 100 + 0.5)
  end
  meta.progress = pandoc.MetaString(progress)
  print(meta.translate.Episodes)
  return meta
end

return { { Meta = set_progress } }
