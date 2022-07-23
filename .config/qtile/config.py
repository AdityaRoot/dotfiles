import os
import subprocess
from typing import List  # noqa: F401

from libqtile import hook, layout
from libqtile.config import Match, Screen

# from screens import screens
from bar import my_bar
from groups import groups
from keys import keys

screens = [
    Screen(top=my_bar()),
]
border = dict(
    border_focus="#e1acff",
    border_normal="#4c566a",
    border_width=2,
)
layouts = [
    layout.Columns(insert_position=1, margin=5, **border),
    layout.Tile(margin=8, ratio=0.55, shift_windows=True, **border),
    layout.Bsp(fair=False, margin=8, shift_windows=True, **border),
    layout.Zoomy(
        columnwidth=350,
        margin=8,
    ),
    layout.Max(),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    **border,
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="Blueman-manager"),
        Match(wm_class="Tor Browser"),
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(wm_class="Tk"),  # ssh-askpass
        # Match(wm_class = endswith(".py")),
        Match(wm_class="Signal Beta"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True


@hook.subscribe.startup
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call([home])


auto_minimize = True
wmname = "Adi's Qtile"
