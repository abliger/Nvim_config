local lib = require('nvim-tree.lib')
local M = {}

function M.launch_live_grep()
  return vim.api.nvim_command('Telescope live_grep')
end

function M.launch_find_files()
  return vim.api.nvim_command('Telescope find_files')
end

function M.launch_telescope(func_name, opts)
  local telescope_status_ok, _ = pcall(require, 'telescope')
  if not telescope_status_ok then
    return
  end
  local lib_status_ok, lib = pcall(require, 'nvim-tree.lib')
  if not lib_status_ok then
    return
  end
  local node = lib.get_node_at_cursor()
  local is_folder = node.fs_stat and node.fs_stat.type == 'directory' or false
  local basedir = is_folder and node.absolute_path or vim.fn.fnamemodify(node.absolute_path, ':h')
  if node.name == '..' and TreeExplorer ~= nil then
    basedir = TreeExplorer.cwd
  end
  opts = opts or {}
  opts.cwd = basedir
  opts.search_dirs = { basedir }
  return require('telescope.builtin.files')[func_name](opts)
end

function M.gitAdd()
  local node = lib.get_node_at_cursor()
  local gs = node.git_status

  -- If the file is untracked, unstaged or partially staged, we stage it
  if gs == '??' or gs == 'MM' or gs == 'AM' or gs == ' M' then
    vim.cmd('silent !git add ' .. node.absolute_path)

    -- If the file is staged, we unstage
  elseif gs == 'M ' or gs == 'A ' then
    vim.cmd('silent !git restore --staged ' .. node.absolute_path)
  end

  lib.refresh_tree()
end

function M.gitStatus()
  vim.cmd('!git status')
end

function M.gitDiff()
  vim.cmd('!git diff ')
end

function M.gitRm()
  vim.ui.input({ prompt = 'Enter filename for git rm: ' }, function(name)
    if name then
      vim.cmd("silent !git rm -f '" .. name .. "'")
    end
  end)
end

function M.gitCommit()
  vim.ui.input({ prompt = 'Enter message for git commit: ' }, function(message)
    if message then
      vim.cmd("silent !git commit -m '" .. message .. "'")
    end
  end)
end

function M.gitLog()
  vim.cmd('!git log')
end

function M.gitPush()
  vim.cmd('!git push origin master')
end

function M.collapse_all()
  require('nvim-tree.actions.collapse-all').fn()
end

function M.edit_or_open()
  -- open as vsplit on current node
  local action = 'edit'
  local node = lib.get_node_at_cursor()

  -- Just copy what's done normally with vsplit
  if node.link_to and not node.nodes then
    require('nvim-tree.actions.open-file').fn(action, node.link_to)
  elseif node.nodes ~= nil then
    lib.expand_or_collapse(node)
  else
    require('nvim-tree.actions.open-file').fn(action, node.absolute_path)
  end
end

function M.vsplit_preview()
  -- open as vsplit on current node
  local action = 'vsplit'
  local node = lib.get_node_at_cursor()

  -- Just copy what's done normally with vsplit
  if node.link_to and not node.nodes then
    require('nvim-tree.actions.open-file').fn(action, node.link_to)
  elseif node.nodes ~= nil then
    lib.expand_or_collapse(node)
  else
    require('nvim-tree.actions.open-file').fn(action, node.absolute_path)
  end
end

return M
