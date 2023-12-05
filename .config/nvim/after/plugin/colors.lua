local schemes = {
    ["rose-pine"] = function()
        require('rose-pine').setup({
          --- @usage 'main'|'moon'|'dawn'
          dark_variant = 'main',
          disable_italics = true,
        })
    end,
    ["catppuccin"] = function()
        require('catppuccin').setup({
          flavour = "mocha", -- latte, frappe, macchiato, mocha
          no_italic = false
      })
    end,
    ["gruvbox-material"] = function()
      vim.g.gruvbox_material_background = 'soft'
      vim.g.gruvbox_material_foreground = 'mix'
      vim.g.gruvbox_material_ui_contrast = 'high'
      vim.g.gruvbox_material_float_style = 'dim'
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
      vim.g.gruvbox_material_enable_italic = 1
    end,
    ["gruvbuddy"] = function()
        require('colorbuddy').colorscheme('gruvbuddy')

        local Color = require('colorbuddy.init').Color
        local c = require('colorbuddy.init').colors
        local Group = require('colorbuddy.init').Group
        local g = require('colorbuddy.init').groups
        local s = require('colorbuddy.init').styles

        Group.new("@variable", c.superwhite, nil)

        Group.new("TSPunctBracket", c.orange:light():light())
        -- group for jsx/tsx
        Group.new("@operator.tsx", c.cyan)
        Group.new("@tag.delimiter.tsx", c.cyan)
        Group.new("variable.tsx", c.purple:light()) Group.new("@tag.tsx", c.purple:light())
        Group.new("@tag.attribute.tsx", c.purple:light():light())
        Group.new("@keyword.export.tsx", c.cyan)
        Group.new("@constructor.tsx", c.orange)

        Group.new("StatuslineError1", c.red:light():light(), g.Statusline)
        Group.new("StatuslineError2", c.red:light(), g.Statusline)
        Group.new("StatuslineError3", c.red, g.Statusline)
        Group.new("StatuslineError3", c.red:dark(), g.Statusline)
        Group.new("StatuslineError3", c.red:dark():dark(), g.Statusline)

        Group.new("WinSeparator", nil, nil)

        Group.new("LspParameter", nil, nil, s.italic)
        Group.new("LspDeprecated", nil, nil, s.strikethrough)
        Group.new("@function.bracket", g.Normal, g.Normal)
        Group.new("@variable.builtin", c.purple:light():light(), g.Normal)

        Group.new("VirtNonText", c.gray3:dark(), nil, s.italic)

        Group.new("TreesitterContext", nil, g.Normal.bg:light())
        Group.new("TreesitterContextLineNumber", c.blue)

        Group.new("@property", c.blue)
        Group.new("@punctuation.bracket.rapper", c.gray3, nil, s.none)
        Group.new("@rapper_argument", c.red, nil, s.italic)
        Group.new("@rapper_return", c.orange:light(), nil, s.italic)
        Group.new("@constructor.ocaml", c.orange:light(), nil, s.none)
        Group.new("@constructor.typescript", c.orange:light(), nil, s.none)
        Group.new("constant", c.orange, nil, s.none)

        Group.new("@keyword", c.violet, nil, s.none)
        Group.new("@keyword.faded", g.nontext.fg:light(), nil, s.none)

        Group.new("Function", c.yellow, nil, s.none)
        vim.cmd [[
          hi link @function.call.lua LuaFunctionCall
          hi link @lsp.type.variable.lua variable
          hi link @lsp.type.variable.ocaml variable
          hi link @lsp.type.variable.javascript variable
          hi link @lsp.type.variable.javascriptreact variable
          hi link @lsp.type.variable.typescript variable
          hi link @lsp.type.variable.typescriptreact variable
          hi link @lsp.type.namespace @namespace
          hi link @punctuation.bracket.rapper @text.literal
          hi link @normal Normal
        ]]

        Group.new("Normal", c.superwhite, c.gray0)
    end
}

local function ColorMyPencils(color)
    color = color or "gruvbuddy"

    -- Call the setup function for the chosen colorscheme
    if schemes[color] ~= nil then
        schemes[color]()
    else
        print("Color scheme not found: " .. color)
    end

    -- Switch to the chosen colorscheme
    vim.cmd("colorscheme "..color)
    vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
    vim.cmd("hi NormalFloat guibg=NONE ctermbg=NONE")
    vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
end

ColorMyPencils()
