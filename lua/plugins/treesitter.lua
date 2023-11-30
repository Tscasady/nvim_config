return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      "folke/which-key.nvim",
    },
    build = ':TSUpdate',
}
