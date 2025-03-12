PANDOC_VERSION:must_be_at_least '2.11'

function set_aio_files(meta)
  if meta.title ~= nil then
    aio_episodes = {}
    if pandoc.utils.stringify(meta.title) == "All in One Page" then
      for i, episode in ipairs(meta.carpentries.episodes) do
        aio_episodes[i] = "{{< include "..pandoc.utils.stringify(episode).." >}}"
        -- aio_episodes[i] = pandoc.utils.stringify(episode)
      end
      -- meta.aio_episodes =aio_episodes
      meta.aio_episodes = pandoc.MetaBlocks(aio_episodes)
      print(meta.aio_episodes)
    end
  end
  return meta
end

return { { Meta = set_aio_files } }
