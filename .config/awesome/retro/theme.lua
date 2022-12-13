---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local gfs = require("gears.filesystem")
local dpi = xresources.apply_dpi

local theme = {}

theme.dir = os.getenv("HOME") .. "/.config/awesome/retro/"

theme.font          = "JetBrainsMono Nerd Font 8"

theme.bg_normal     = "#79a"
theme.bg_focus      = "#567"
theme.bg_urgent     = "#ca0d54"
theme.bg_minimize   = "#05427a"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#000000"
theme.fg_focus      = "#112233"
theme.fg_urgent     = "#112233"
theme.fg_minimize   = "#112233"

theme.useless_gap         = dpi(0)
theme.border_width        = dpi(1)
theme.border_color_normal = "#000000"
theme.border_color_active = "#05427a"
theme.border_color_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ca0d54"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme.dir .. "submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = theme.dir .. "titlebar/close_normal.png"
theme.titlebar_close_button_focus  = theme.dir .. "titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = theme.dir .. "titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = theme.dir .. "titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = theme.dir .. "titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = theme.dir .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = theme.dir .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = theme.dir .. "titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = theme.dir .. "titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = theme.dir .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = theme.dir .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = theme.dir .. "titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = theme.dir .. "titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = theme.dir .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = theme.dir .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = theme.dir .. "titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = theme.dir .. "titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = theme.dir .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = theme.dir .. "titlebar/maximized_focus_active.png"

theme.wallpaper = theme.dir .. "background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = theme.dir .. "layouts/fairhw.png"
theme.layout_fairv = theme.dir .. "layouts/fairvw.png"
theme.layout_floating  = theme.dir .. "layouts/floatingw.png"
theme.layout_magnifier = theme.dir .. "layouts/magnifierw.png"
theme.layout_max = theme.dir .. "layouts/maxw.png"
theme.layout_fullscreen = theme.dir .. "layouts/fullscreenw.png"
theme.layout_tilebottom = theme.dir .. "layouts/tilebottomw.png"
theme.layout_tileleft   = theme.dir .. "layouts/tileleftw.png"
theme.layout_tile = theme.dir .. "layouts/tilew.png"
theme.layout_tiletop = theme.dir .. "layouts/tiletopw.png"
theme.layout_spiral  = theme.dir .. "layouts/spiralw.png"
theme.layout_dwindle = theme.dir .. "layouts/dwindlew.png"
theme.layout_cornernw = theme.dir .. "layouts/cornernww.png"
theme.layout_cornerne = theme.dir .. "layouts/cornernew.png"
theme.layout_cornersw = theme.dir .. "layouts/cornersww.png"
theme.layout_cornerse = theme.dir .. "layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ca0d54', fg = '#a4d1ec' }
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
