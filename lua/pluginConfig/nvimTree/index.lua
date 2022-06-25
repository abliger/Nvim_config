local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("没有找到 nvim-tree")
  return
end

local function custom_callback(callback_name)
    return string.format(":lua require'pluginConfig/nvimTree/treeUtil'.%s()<CR>", callback_name)
end

nvim_tree.setup({
    -- 不显示 git 状态图标
    git = {
        enable = true,
    },
    -- project plugin 需要这样设置
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- 隐藏 .文件 和 node_modules 文件夹
    filters = {
        dotfiles = true,
        -- custom = { 'node_modules' },
    },
    view = {
        -- 宽度
        width = 34,
        -- 也可以 'right'
        side = 'left',
        -- 隐藏根目录
        hide_root_folder = false,
        -- 自定义列表中快捷键
        mappings = {
            custom_only = false, 
	    list = {
              { key = "<c-f>", cb = custom_callback "launch_find_files" },
              { key = "<c-g>", cb = custom_callback "launch_live_grep" },
              { key = "ga", cb = custom_callback "gitAdd" },                
              { key = "gc", cb = custom_callback "gitCommit" },                
              { key = "gp", cb = custom_callback "gitPush" },                
              { key = "gs", cb = custom_callback "gitStatus" },                
              { key = "gl", cb = custom_callback "gitLog" },                
              { key = "gr", cb = custom_callback "gitRm" },                
	      { key = "l", action = "edit", action_cb = edit_or_open }, 
	      { key = "L", action = "vsplit_preview", action_cb = vsplit_preview }, 
	      { key = "H", action = "collapse_all", action_cb = collapse_all }, 
	      { key = "v", action = "vsplit" }, 
	      { key = "h", action = "split" }, 
	      -- 显示隐藏文件 
	      { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
	      { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	      -- 文件操作
	      { key = "<F5>", action = "refresh" },
	      { key = "a", action = "create" },
	      { key = "d", action = "remove" }, 
	      { key = "r", action = "rename" },
	      { key = "x", action = "cut" }, 
	      { key = "c", action = "copy" },
	      { key = "p", action = "paste" },
	      { key = "s", action = "system_open" },
            }
            -- list = list_keys,
        },
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭
            quit_on_open = false,
        },
    },
    -- wsl install -g wsl-open
    -- https://github.com/4U6U57/wsl-open/
    system_open = {
        cmd = 'open', -- mac 直接设置为 open
    },
})
