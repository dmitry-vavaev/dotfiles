-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Character cycling inside brackets
lvim.keys.normal_mode["<Leader>m"] = function()
  local c, l = vim.fn.col('.'), vim.fn.getline('.')
  if c > #l then return end
  if not l:sub(1,c-1):match('%[.*$') or not l:sub(c):match('^.*%]') then return end
  local chars, curr = {' ', '.', 'x', '=','_'}, l:sub(c,c)
  vim.fn.setline('.', l:sub(1,c-1) .. chars[(({[' ']=1,['.']=2,['x']=3,['=']=4,['_']=5})[curr] or 1)%5+1] .. l:sub(c+1))
end

--lvim.keys.normal_mode["w"] = nil

lvim.builtin.which_key.mappings["w"] = {
    name = "+wiki",  -- This creates a group called "wiki"
    w = { "<cmd>VimwikiIndex<CR>", "Open Wiki Index" },
    -- d = { "<cmd>VimwikiDiaryIndex<CR>", "Open Diary" },
}

lvim.builtin.which_key.mappings["S"] = {
  name = "+split",
  v = {":vsplit<CR>","Vsplit"},
  h = {":split<CR>","Hsplit"},
}

lvim.builtin.which_key.mappings["R"] = {
  name = "+ARSync",
  U = {":ARSyncUp<CR>","SyncUp"},
  D = {":ARSyncDown<CR>","SyncDown"},
}


lvim.plugins = {
  {"vimwiki/vimwiki"},
  {"kenn7/vim-arsync"},
  {"prabirshrestha/async.vim"},
}
