return{
    "nvim-tree/nvim-tree.lua",
    opts = {
        hijack_cursor = true,
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        view = {
            adaptive_size = true,
            number = true,
            relativenumber = true,
            signcolumn = 'yes',
            side = "right",
            centralize_selection = true,
        },
        renderer = {
            decorators = { "Git", "Open", "Hidden", "Modified", "Bookmark", "Diagnostics", "Copied", "Cut", },
            indent_markers = {
                enable = true,
                inline_arrows = true,
                icons = {
                    corner = "└",
                    edge = "│",
                    item = "├",
                    none = " ",
                },
            },
        indent_width = 4,
        icons = {
            webdev_colors = true,
            git_placement = 'before',
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true
            }
        }
    },
    filters = {
        custom = { '^\\.git$', '^\\.venv$' }
    },
    update_focused_file = {
        enable = true,
        update_root = true
    },

    actions = {
        open_file = {
            quit_on_open = true,
            window_picker = {
                enable = true,
            }
        }
    },
    on_attach = my_on_attach,
}
}
