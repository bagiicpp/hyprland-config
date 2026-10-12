--------------------------------------------------------------------------------
-- Hyprland Lua Configuration
--------------------------------------------------------------------------------

--- Hyprmod ---


--- Monitors ---

hl.monitor({
  output   = "",
  mode     = "preferred",
  position = "auto",
  scale    = "1",
})


--- Programs ---

local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "vicinae toggle"


--- Environment ---

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


--- Look and Feel ---

hl.config({
  general = {
    gaps_in          = 7,
    gaps_out         = 12,
    border_size      = 0,
    resize_on_border = false,
    allow_tearing    = false,
    layout           = "dwindle",
  },

  decoration = {
    rounding         = 9,
    rounding_power   = 2,
    active_opacity   = 1.0,
    inactive_opacity = 1.0,

    shadow           = {
      enabled      = true,
      range        = 12,
      render_power = 4,
      color        = 0xee1a1a1a,
    },

    blur             = {
      enabled  = true,
      size     = 12,
      passes   = 2,
      vibrancy = 0.1696,
    },
  },

  animations = {
    enabled = true,
  },

  misc = {
    force_default_wallpaper = -1,
    disable_hyprland_logo   = false,
  },
})


--- Animations ---

--- Animations ---

hl.curve("smooth", {
  type = "bezier",
  points = {
    { 0.22, 1 },
    { 0.1,  1.1 },
  },
})

hl.curve("quick", {
  type = "bezier",
  points = {
    { 0.15, 0.85 },
    { 0.25, 1.0 },
  },
})

hl.curve("overshot", {
  type = "bezier",
  points = {
    { 0.05, 0.9 },
    { 0.1,  1.08 },
  },
})

hl.curve("linearish", {
  type = "bezier",
  points = {
    { 0.3, 0.0 },
    { 0.7, 1.0 },
  },
})

hl.curve("easeOutQuint", {
  type = "bezier",
  points = {
    { 0.23, 1 },
    { 0.32, 1 },
  },
})

-- Windows
hl.animation({
  leaf = "windows",
  enabled = true,
  speed = 4,
  bezier = "smooth",
  style = "popin 95%",
})

hl.animation({
  leaf = "windowsIn",
  enabled = true,
  speed = 4,
  bezier = "smooth",
  style = "popin 85%",
})

hl.animation({
  leaf = "windowsOut",
  enabled = true,
  speed = 3,
  bezier = "quick",
  style = "popin 90%",
})

hl.animation({
  leaf = "windowsMove",
  enabled = true,
  speed = 3,
  bezier = "quick",
})

-- Workspaces
hl.animation({
  leaf = "workspaces",
  enabled = true,
  speed = 5,
  bezier = "smooth",
  style = "slidefade 20%",
})

hl.animation({
  leaf = "specialWorkspace",
  enabled = true,
  speed = 3,
  bezier = "smooth",
  style = "slidefadevert 5%",
})

-- Layers
hl.animation({
  leaf = "layers",
  enabled = true,
  speed = 3,
  bezier = "quick",
  style = "fade",
})

hl.animation({
  leaf = "layersIn",
  enabled = true,
  speed = 3,
  bezier = "quick",
  style = "popin 95%",
})

hl.animation({
  leaf = "layersOut",
  enabled = true,
  speed = 3,
  bezier = "quick",
  style = "popin 95%",
})

hl.animation({
  leaf = "fadeLayersIn",
  enabled = true,
  speed = 3,
  bezier = "linearish",
})

hl.animation({
  leaf = "fadeLayersOut",
  enabled = true,
  speed = 3,
  bezier = "linearish",
})

-- Fade
hl.animation({
  leaf = "fade",
  enabled = true,
  speed = 4,
  bezier = "smooth",
})

--- Layouts ---

hl.config({
  dwindle = {
    preserve_split = true,
  },
  master = {
    new_status = "master",
  },
  scrolling = {
    fullscreen_on_one_column = true,
  },
})


--- Input ---
hl.env("XCURSOR_THEME", "macOS")
hl.env("XCURSOR_SIZE", "24")

hl.config({
  input = {
    kb_layout    = "us",
    kb_variant   = "",
    kb_model     = "",
    kb_options   = "",
    kb_rules     = "",
    follow_mouse = 1,
    sensitivity  = 0,

    touchpad     = {
      scroll_factor = 0.4,
      natural_scroll = true
    },
  },
})

hl.gesture({
  fingers   = 3,
  direction = "horizontal",
  action    = "workspace",
})

hl.device({
  name        = "epic-mouse-v1",
  sensitivity = -0.5,
})

hl.device({
  name          = "logitech-g305-1",
  sensitivity   = 0,
  accel_profile = "flat",
})

hl.config({
  input = {
    kb_layout = "us,si,mk",
    kb_variant = ",,",
    kb_options = "grp:alt_shift_toggle"
  }
})

--- Keybindings ---

local mainMod = "SUPER"

-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd(
  [[grim -g "$(slurp)" -t ppm - | satty --filename -]]
))

-- Core Apps & System Controls
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("nemo"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M",
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("zen"))

-- Layout & Window State
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Focus Navigation
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Workspaces 1 - 10
for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special Scratchpad Workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Mouse Binds
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media & Hardware Keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })


--- Window Rules ---

hl.window_rule({
  name = "nemo-glass",
  match = {
    class = "nemo",
  },

  opacity = "0.93 override 0.89 override",
  rounding = 14,
})

hl.window_rule({
  name         = "vicinae-overlay",
  match        = { class = "^(vicinae)$" },

  float        = true,
  center       = true,
  stay_focused = true,
})

hl.layer_rule({
  name = "rofi",
  match = {
    namespace = "rofi",
  },

  animation = "popin 92%",
})

hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
  },

  no_anim = true,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})
-- Prevent maximize requests
hl.window_rule({
  name           = "suppress-maximize-events",
  match          = { class = ".*" },

  suppress_event = "maximize",
})

-- Fix drag issues with unclassified XWayland popups
hl.window_rule({
  name     = "fix-xwayland-drags",
  match    = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },

  no_focus = true,
})

-- Hyprland Run Position Rule
hl.window_rule({
  name  = "move-hyprland-run",
  match = { class = "hyprland-run" },

  move  = "20 monitor_h-120",
  float = true,
})

-- HyprMod managed settings
require("hyprland-gui")
