return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- disable the keymap
    { "<leader>sG", false },
    { "<leader>sg", false },
    { "<leader>fF", false },
    { "<leader>ff", false },
    { "<leader><space>", false },

    -- change keymaps
    { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Find with Grep (cwr)" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files (cwr)" },
  },
}
