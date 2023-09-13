require('rose-pine').setup({
  disable_background = true,
  disable_italics = true,
  highlight_groups = {
    Comment = { italic = true },
    Type = { italic = true },
  }
})

require('gruvbox').setup({
  disable_background = true,
  bold = false,
  italic = {
    strings = false,
    comments = true,
    operators = false,
    folds = false,
  },
})

function ColorMyPencils(color) 
color = color or "rose-pine"
-- color = color or "gruvbox"
vim.cmd.colorscheme(color)

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
