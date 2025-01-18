require("tokyonight").setup({
    transparent = true,
    dim_inactive = true,
    lualine_bold = true,
    styles = {
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
    },
    on_colors = function(colors)
        colors.bg_statusline = "black"
    end,
})

vim.cmd([[colorscheme tokyonight]])
