require("blink.cmp").setup({
	completion = {
		menu = {
			border = "single",
		},
		-- Show documentation when selecting a completion item
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
			window = {
				border = "single",
			},
		},
	},

	-- experimental signature help support
	signature = { enabled = true },
})
