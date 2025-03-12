PANDOC_VERSION:must_be_at_least '2.11'

local system = require 'pandoc.system'

function set_asset_paths(meta)

    if meta.carpentries.instructor ~= nil then
      meta.image_path = pandoc.MetaString("../site_libs/quarto-contrib/carpentries-images-1.0.0/images/")
      meta.favicon_path = pandoc.MetaString("../site_libs/quarto-contrib/carpentries-favicons-1.0.0/favicons/")
      meta.webmanifest_path = pandoc.MetaString("../site_libs/quarto-contrib/carpentries-manifest-1.0.0/")
      -- meta.quarto_assets = pandoc.MetaString("../site_libs/quarto-contrib/quarto-1.5.57/")
    else 
      meta.image_path = pandoc.MetaString("site_libs/quarto-contrib/carpentries-images-1.0.0/images/")
      meta.favicon_path = pandoc.MetaString("site_libs/quarto-contrib/carpentries-favicons-1.0.0/favicons/")
      meta.webmanifest_path = pandoc.MetaString("site_libs/quarto-contrib/carpentries-manifest-1.0.0/")
      -- meta.quarto_assets = pandoc.MetaString("site_libs/quarto-contrib/quarto-1.5.57/")
    end
      
    quarto.doc.add_html_dependency({
      name = "carpentries-theme-toggle",
      version = "1.0.0",
      scripts = { "javascripts/themetoggle.js", "javascripts/scripts.js" }
    })

    quarto.doc.add_html_dependency({
      name = "carpentries-css",
      version = "1.0.0",
      stylesheets = { "stylesheets/styles.css.map", "stylesheets/styles.css" }
    })

    quarto.doc.add_html_dependency({
      name = "carpentries-images",
      version = "1.0.0",
      resources = { "images" }
    })

    quarto.doc.add_html_dependency({
      name = "carpentries-favicons",
      version = "1.0.0",
      resources = { "favicons" }
    })

    quarto.doc.add_html_dependency({
      name = "carpentries-manifest",
      version = "1.0.0",
      resources = { "site.webmanifest" }
    })

    -- quarto.doc.add_html_dependency({
    --   name = "quarto",
    --   version = "1.5.57",
    --   resources = { "quarto/clipboard", "quarto/quarto-html", "quarto/quarto-nav", "quarto/quarto-search" }
    -- })
    -- end

    -- current working directory
    local working_dir = pandoc.utils.stringify(system.get_working_directory())
    -- extract repository name
    local repository_source = pandoc.utils.stringify(meta.carpentries.source)
    local _, repository_name = repository_source:match'(.*/)(.*)'
    -- find the repo name in the working dir to extract the fullpath
    -- to the file being rendered
    local _, j = string.find(working_dir, repository_name, 1, true)
    local fullpath = string.sub(working_dir, j+1)
    -- get the path back up to the quarto site root
    local backpath, _ = string.gsub(fullpath, "/.[^/]*", "../")
    -- for Windows paths
    local backpath, _ = string.gsub(backpath, "\\.[^\\]*", "../")
    meta.fullpath = pandoc.MetaString(fullpath)
    meta.backpath = pandoc.MetaString(backpath)

    return meta
end

return { { Meta = set_asset_paths } }