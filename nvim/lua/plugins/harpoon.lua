return
	{
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }

        local mark = require("harpoon.mark")
        locarl ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
        vim.keymap.set("n", "<C-h>", funtion() ui.nav_file(1)end)
        vim.keymap.set("n", "<C-t>", funtion() ui.nav_file(2)end)
        vim.keymap.set("n", "<C-n>", funtion() ui.nav_file(3)end)
        vim.keymap.set("n", "<C-s>", funtion() ui.nav_file(4)end)


    }
