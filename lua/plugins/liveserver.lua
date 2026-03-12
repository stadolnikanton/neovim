return {
    "ngtuonghy/live-server-nvim",
    lazy = true,
    cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
    build = ":LiveServerInstall",
    config = function()
        require("live-server-nvim").setup({
            custom = {
                "--port=8080",
            },
            open = "folder",
        })
    end,
    keys = {
        { "<leader>ls", "<cmd>LiveServerStart<cr>", desc = "LiveServer Start" },
        { "<leader>lS", "<cmd>LiveServerStop<cr>", desc = "LiveServer Stop" },
        { "<leader>lt", "<cmd>LiveServerToggle<cr>", desc = "LiveServer Toggle" },
    },
}
