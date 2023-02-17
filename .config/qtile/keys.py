import os
from libqtile.config import Click, Drag, KeyChord, Key
from libqtile.layout.tree import TreeTab
from libqtile.lazy import lazy

mod = "mod4"
mod1 = "mod1"
mod2 = "control"
mod3 = "shift"
home = os.path.expanduser('~')
Term2 = "alacritty"
myTerm = "kitty"


@lazy.function
def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)


@lazy.function
def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)

# SHORTCUTS


keys = [
    # Moving between windows
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),

    # Changing window sizes
    Key([mod, "shift"], "h", lazy.layout.grow_left()),
    Key([mod, "shift"], "l", lazy.layout.grow_right()),
    Key([mod, "shift"], "k", lazy.layout.grow_up()),
    Key([mod, "shift"], "j", lazy.layout.grow_down()),
    Key([mod], "w", lazy.window.toggle_fullscreen()),
    # Key([mod, "shift"], "n", lazy.layout.normalize()), # is redefined as mod-n

    # Treetab Controls
    Key([mod], "c", lazy.layout.collapse_branch()),
    Key([mod], "e", lazy.layout.expand_branch()),
    Key([mod, "control"], "h", lazy.layout.move_left()),
    Key([mod, "control"], "l", lazy.layout.move_right()),
    Key([mod, "control"], "k", lazy.layout.move_up()),
    Key([mod, "control"], "j", lazy.layout.move_down()),

    # Moving windows 
    Key([mod], "Down", lazy.layout.shuffle_down()),
    Key([mod], "Up", lazy.layout.shuffle_up()),
    Key([mod], "Left", lazy.layout.shuffle_left()),
    Key([mod], "Right", lazy.layout.shuffle_right()),
    # Key([mod, "mod1"], "Down", lazy.layout.grow_left()), # ngl idk what these do lol
    # Key([mod, "mod1"], "Up", lazy.layout.flip_up()),
    # Key([mod, "mod1"], "Left", lazy.layout.flip_left()),
    # Key([mod, "mod1"], "Right", lazy.layout.flip_right()),

    # Layout controls
    Key([mod], "s", lazy.layout.toggle_split()), # Toggle split/stack mode for columns layout
    Key([mod], "period", lazy.layout.grow(), lazy.layout.increase_nmaster()),
    Key([mod], "comma", lazy.layout.shrink(), lazy.layout.decrease_nmaster()),
    Key([mod], "n", lazy.layout.normalize()), # Normalize size of windows
    Key([mod], "Tab", lazy.next_layout()),
    # Key([mod, "control"], "a", lazy.window.toggle_floating()),

    # Utilities
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight +5")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -5")),

    Key([mod], "b", lazy.hide_show_bar()),
    Key([mod], "q", lazy.window.kill()),

    Key([mod, "shift"], "q", lazy.shutdown()),
    Key([mod, "shift"], "r", lazy.restart()),
    Key([mod, "control"], "r", lazy.reload_config()),

    # Key([mod], "l", lazy.next_layout()),
    # Key([mod], "g", lazy.spawn("rofi -show filebrowser")),
    # Key([], "XF86AudioRaiseVolume", lazy.spawn("xbacklight -5")),
    # Key(["shift"], "Print", lazy.spawn("clip")),
    # Key(["control"], "Print", lazy.spawn("vmcrop")),
    # Key(["control"], "Print", lazy.spawn("crop")),
    # Key([mod], "Print", lazy.spawn("winclip")),
    # Key([], "Print", lazy.spawn("shot")),


    # Applications
    Key([mod, "shift"], "c", lazy.spawn("flameshot gui")),
    Key([mod], "x", lazy.spawn("/home/adi/.config/rofi/bin/powermenu")),
    Key([mod], "r", lazy.spawn("/home/adi/.config/rofi/bin/launcher_misc")),
    # Key([mod, "shift"], "a", lazy.spawn("betterlockscreen -l")),

    Key([mod], "Return", lazy.spawn(myTerm)),
    Key([mod], "v", lazy.spawn("pavucontrol")),
    Key([], "F9", lazy.spawn("pavucontrol")),
    KeyChord([mod], "i", [
        Key([], "f", lazy.spawn("firefox")),
        Key([], "v", lazy.spawn("vivaldi-stable")),
        Key([], "b", lazy.spawn("brave")),
        Key([], "q", lazy.spawn("qutebrowser")),
        Key([], "l", lazy.spawn("librewolf")),
    ]),
]


mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]
