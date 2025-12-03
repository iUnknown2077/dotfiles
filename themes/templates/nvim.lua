local function enable_transparency()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end
return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies =  {
      'nvim-tree/nvim-web-devicons'
    },
    opts = {
      options = {
        theme = 'auto'
      }
    },
    config = function(_, opts)
      require("lualine").setup(opts)
      enable_transparency()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = enable_transparency
      })
    end
  }
}
