-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Batman'

-- config.font = wezterm.font("Berkeley Mono", {weight="Regular", style="Normal"})
config.font = wezterm.font_with_fallback {
  'Berkeley Mono',
  'nonicons',
}
config.font_size = 13.0
-- config.window_background_opacity = 0.87

config.tab_bar_at_bottom = true

-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  -- vertical/horizontal panes
  {
    key = '|',
    mods = 'LEADER|SHIFT',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'LEADER',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Vim like pane navigation
  {
    key = 'h',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = act.ActivatePaneDirection 'Down',
  },
  {
    key = 'w',
    mods = 'CMD',
    action = act.CloseCurrentPane { confirm = true },
  },
  -- fzf search for Developer/merryfield and Developer/jdq
  {
    key = 'f',
    mods = 'CTRL',
    action= wezterm.action {
      SendString="cd \"$( ( find ~/Developer/merryfield -maxdepth 1 -type d ; find ~/Developer/jdq -maxdepth 1 -type d ; find ~/Developer/client-sites -maxdepth 1 -type d ; find ~/Developer/ocaml -maxdepth 1 -type d ) | fzf )\"\n"},
  },
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = 'a',
    mods = 'LEADER|CTRL',
    action = act.SendKey { key = 'a', mods = 'CTRL' },
  },
}


-- and finally, return the configuration to wezterm
return config
