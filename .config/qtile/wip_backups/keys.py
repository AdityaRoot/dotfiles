import os

from libqtile.command import lazy
from libqtile.config import Click, Drag, Key, KeyChord

mod = "mod4"
mod1 = "mod1"
mod2 = "control"
mod3 = "shift"
home = os.path.expanduser("~")
Term2 = "alacritty"
myTerm = "kitty"

# SHORTCUTS


keys = [
    Key([mod], "c", lazy.spawn("flameshot gui")),
    # Key([mod], "g", lazy.spawn("rofi -show filebrowser")),
    Key([mod], "x", lazy.spawn("/home/adi/.config/rofi/bin/powermenu")),
    Key([mod], "r", lazy.spawn("/home/adi/.config/rofi/bin/launcher_misc")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight +5")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -5")),
    # Key([mod, "control"], "a", lazy.window.toggle_floating()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "period", lazy.layout.grow(), lazy.layout.increase_nmaster()),
    Key([mod], "comma", lazy.layout.shrink(), lazy.layout.decrease_nmaster()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "w", lazy.window.toggle_fullscreen()),
    Key([mod], "Down", lazy.layout.shuffle_down()),
    Key([mod], "Up", lazy.layout.shuffle_up()),
    Key([mod], "Left", lazy.layout.shuffle_left()),
    Key([mod], "Right", lazy.layout.shuffle_right()),
    Key([mod, "mod1"], "Down", lazy.layout.flip_down()),
    Key([mod, "mod1"], "Up", lazy.layout.flip_up()),
    Key([mod, "mod1"], "Left", lazy.layout.flip_left()),
    Key([mod, "mod1"], "Right", lazy.layout.flip_right()),
    Key([mod, "shift"], "h", lazy.layout.grow_left()),
    Key([mod, "shift"], "l", lazy.layout.grow_right()),
    Key([mod, "shift"], "n", lazy.layout.normalize()),
    Key([mod], "Tab", lazy.layout.next()),
    Key([mod], "b", lazy.hide_show_bar()),
    #    Key([mod], "l", lazy.next_layout()),
    Key([mod], "q", lazy.window.kill()),
    Key([mod, "shift"], "q", lazy.shutdown()),
    Key([mod, "shift"], "r", lazy.restart()),
    Key([mod, "control"], "r", lazy.reload_config()),
    # Key(["shift"], "Print", lazy.spawn("clip")),
    # Key(["control"], "Print", lazy.spawn("vmcrop")),
    # Key(["control"], "Print", lazy.spawn("crop")),
    # Key([mod], "Print", lazy.spawn("winclip")),
    # Key([], "Print", lazy.spawn("shot")),
    # APPLICATIONS
    # Key([mod, "shift"], "a", lazy.spawn("betterlockscreen -l")),
    Key([mod], "Return", lazy.spawn(myTerm)),
    Key([mod], "v", lazy.spawn("pavucontrol")),
    # Key([], "F9", lazy.spawn("pavucontrol")),
    KeyChord(
        [mod],
        "i",
        [
            Key([], "f", lazy.spawn("firefox")),
            # Key([], "v", lazy.spawn("vivaldi-stable")),
            Key([], "b", lazy.spawn("brave")),
            Key([], "q", lazy.spawn("qutebrowser")),
            # Key([], "l", lazy.spawn("librewolf")),
        ],
    ),
]


mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]
