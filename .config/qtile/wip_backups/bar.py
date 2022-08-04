import os

from libqtile import bar, qtile, widget
from libqtile.lazy import lazy
from libqtile.config import Screen

from color import colors
from font import font, windowname

MARGIN = 9
BORDER_WIDTH = 2
CENTER_SPACERS = 100

fontinfo = dict(
    font=font["secondary"]["family"],
    padding=font["secondary"]["padding"],
    fontsize=font["secondary"]["fontsize"],
)

DEFAULT_FG = colors["fg"]
DEFAULT_BG = colors["bg"]
WIDTH = 34


def launcher(qtile):
    lazy.spawn("sh " + os.path.expanduser("~/.scripts/rofi-launchpad.sh"))


groupbox = [
    widget.GroupBox,
    {
        "font": font["clear"]["family"],
        "padding": font["clear"]["padding"],
        "fontsize": font["clear"]["fontsize"],
        "foreground": colors["cyan"],
        "highlight_method": "text",
        "block_highlight_text_color": colors["white"],
        "active": colors["fg"],
        "inactive": colors["cyan"],
        "rounded": False,
        "highlight_color": [colors["fg"], colors["yellow"]],
        "urgent_alert_method": "line",
        "urgent_text": colors["red"],
        "urgent_border": colors["red"],
        "disable_drag": True,
        "use_mouse_wheel": False,
        "hide_unused": False,
        "spacing": 5,
        "this_current_screen_border": colors["yellow"],
    },
]

windowname = [
    widget.WindowName,
    {
        "font": windowname,
        "fontsize": 16,
        "padding": 3,
        "format": "{name}",
        "background": colors["fg_gutter"],
        "center_aligned": True,
    },
]

systray = [
    widget.Systray,
    {
        "background": colors["orange"],
        "foreground": colors["black"],
        "theme_path": "rose-pine-gtk",
    },
]

spacer_small = [
    widget.Spacer,
    {
        "length": 5,
        # these values are used by style func, not qtile
        "is_spacer": True,
        "inheirit": True,
        "use_separator": False,
    },
]

logo_image = [
    widget.Image,
    {
        "background": colors["magenta"],
        "margin": 3,
        "filename": "~/.config/qtile/icon/artixlinux-logo-flat.png",
        "mouse_callbacks": {
            "Button1": lazy.spawn(
                "sh " + os.path.expanduser("~/.scripts/rofi-launchpad.sh")
            )
        },
    },
]

logo = [
    widget.TextBox,
    {
        # text="  ",
        "font": font["clear"]["family"],
        "padding": 8,
        "fontsize": font["clear"]["fontsize"] * 1.3,
        "text": "",
        # "text": " Σ",
        "background": colors["magenta"],
        "foreground": colors["bg"],
    },
]

cpu = [
    widget.CPU,
    {
        **fontinfo,
        "format": " {load_percent}%",
        "background": colors["yellow"],
        "foreground": colors["bg"],
    },
]

weather = [
    widget.OpenWeather,
    {
        **fontinfo,
        "cityid": 1819729,
        "format": " {main_temp:.0f}°{units_temperature} ↑ {main_temp_max:.0f}°{units_temperature} ↓ {main_temp_min:.0f}°{units_temperature} ",
        "background": colors["orange"],
    },
]
mem = [
    widget.Memory,
    {
        **fontinfo,
        "format": ": {MemUsed:.2f}/{MemTotal:.2f}{mm}",
        "update_interval": 1.0,
        "measure_mem": "G",
    },
]

batt = [
    widget.Battery,
    {
        **fontinfo,
        "background": colors["magenta"],
        "foreground": colors["bg"],
        "low_foreground": colors["red"],
        "low_background": None,
        "low_percentage": 0.30,
        "charge_char": "",
        "discharge_char": "",
        "full_char": "",
        "unknown_char": "?",
        "format": "  {char} {percent:2.0%}",
        "show_short_text": False,
        "update_interval": 2,
    },
]

layout = [widget.CurrentLayout, {**fontinfo, "background": colors["pink"]}]

date = [
    widget.Clock,
    {**fontinfo, "format": "%a %d-%b %H:%M ", "background": colors["orange"]},
]

volume = [
    widget.Volume,
    {
        **fontinfo,
        "update_interval": 0.001,
        "fmt": "  {} ",
        "background": colors["yellow"],
        "foreground": colors["bg"],
    },
]
backlight = [
    widget.Backlight,
    {
        **fontinfo,
        "backlight_name": "intel_backlight",
        "brightness_file": "actual_brightness",
        "fmt": "☀ {}",
    },
]


def widgetlist():
    return [
        spacer_small,
        logo,
        groupbox,
        windowname,
        systray,
        cpu,
        batt,
        volume,
        backlight,
        #        disk,
        #        net,
        mem,
        #        batt,
        layout,
        date,
        #  time,
    ]


def style(widgetlist):
    # adds separator widgets in between the initial widget list
    styled = widgetlist[:]

    for index, wid in enumerate(widgetlist):
        end_sep = {
            "font": "JetBrainsMono Nerd Font",
            "text": " ",
            "fontsize": WIDTH,
            "padding": -1,
        }

        if index < len(widgetlist) - 1:
            # end_sep["background"]=widgetlist[index+1][1].get("background", DEFAULT_BG)
            # end_sep["foreground"]=wid[1].get("background", DEFAULT_BG)

            end_sep["foreground"] = widgetlist[index + 1][1].get(
                "background", DEFAULT_BG
            )
            end_sep["background"] = wid[1].get("background", DEFAULT_BG)
            if wid[1].get("is_spacer") and wid[1].get("inheirit"):
                bg = widgetlist[index + 1][1].get("background", DEFAULT_BG)
                wid[1]["background"] = bg
                end_sep["background"] = bg
            # insert separator before current
            if wid[1].get("use_separator", True):
                styled.insert(styled.index(wid) + 1, (widget.TextBox, end_sep))

    return [w[0](**w[1]) for w in styled]


def my_bar():
    return bar.Bar(
        [*style(widgetlist())],
        WIDTH,
        foreground=DEFAULT_FG,
        background=DEFAULT_BG,
        opacity=1.0,
        margin=[4, 0, 4, 0],
    )


screens = [
    Screen(top=my_bar()),
]
