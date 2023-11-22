local schemes = {
    ["rose-pine"] = function()
        require('rose-pine').setup({
            disable_background = true,
            disable_italics = true,
            highlight_groups = {
                Comment = { italic = true },
                Type = { italic = true },
            }
        })
    end,
    ["gruvbox-material"] = function()
      vim.g.gruvbox_material_background = 'soft'
      vim.g.gruvbox_material_foreground = 'material'
      vim.g.gruvbox_material_ui_contrast = 'high'
      vim.g.gruvbox_material_float_style = 'dim'
      vim.g.gruvbox_material_statusline_style = 'material'
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
    end,
    ["gruvbuddy"] = function()
        local Color, colors, Group, groups, styles = require('colorbuddy').setup()
    
        -- Use Color.new(<name>, <#rrggbb>) to create new colors
        -- They can be accessed through colors.<name>
        Color.new('background',  '#282c34')
        Color.new('red',         '#cc6666')
        Color.new('green',       '#99cc99')
        Color.new('yellow',      '#f0c674')

        -- Define highlights in terms of `colors` and `groups`
        Group.new('Function'        , colors.yellow      , colors.background , styles.bold)
        Group.new('luaFunctionCall' , groups.Function    , groups.Function   , groups.Function)

        -- Define highlights in relative terms of other colors
        Group.new('Error'           , colors.red:light() , nil               , styles.bold)

        require('colorbuddy').colorscheme('gruvbuddy')
    end,
}

local function ColorMyPencils(color)
    color = color or "gruvbox-material"

    -- Call the setup function for the chosen colorscheme
    if schemes[color] ~= nil then
        schemes[color]()
    else
        print("Color scheme not found: " .. color)
    end

    -- Switch to the chosen colorscheme
    vim.cmd("colorscheme "..color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, 'LineNr', {bg='none'})
end

ColorMyPencils()
