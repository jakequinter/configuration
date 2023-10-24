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
    ["gruvbox"] = function()
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
    end,
    ["kanagawa"] = function()
        require('kanagawa').setup({
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none"
                        }
                    }
                }
            },
            background = {
                dark = "dragon",
            },
        })
    end,    
    ["gruvbuddy"] = function()
        require('colorbuddy').setup()
        require('colorbuddy').colorscheme('gruvbuddy')
    end,
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

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, 'LineNr', {bg='none'})
end

ColorMyPencils()
