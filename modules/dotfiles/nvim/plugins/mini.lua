require("mini.icons").setup()
require("mini.pairs").setup()
-- require("mini.statusline").setup()
require("mini.files").setup()

vim.keymap.set("n", "<leader>e", ":lua MiniFiles.open()<CR>", { desc = "File Explorer" })
