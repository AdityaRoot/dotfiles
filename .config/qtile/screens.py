import os
from libqtile.config import Screen
from libqtile import layout, bar, widget, hook
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration
from qtile_extras.bar import Bar

theme = "palenight"

colours =  {
    "everblush":[
        ["#D8DEE9"],      # Colour 0
        ["#181f21"],        # Colour 1
        ["#ef7d7d"],        # Colour 2
        ["#9bdead"],        # Colour 3
        ["#f4d67a"],        # Colour 4
        ["#C9CBFF"],        # Colour 5
        ["#f5c2e7"],        # Colour 6
        ["#6da4cd"],        # Colour 7
        ["#d6acff"],        # Colour 8
        ["#8ccf7e"],        # Colour 9
        ["#e06e6e"]        # Colour 10
    ],
    "palenight":[
        ["#D8DEE9"],      # Colour 0
        ["#282d3e"],        # Colour 1
        ["#ff8b92"],        # Colour 2
        ["#c3e88d"],        # Colour 3
        ["#ffe585"],        # Colour 4
        ["#c792ea"],        # Colour 5
        ["#f5c2e7"],        # Colour 6
        ["#82aaff"],        # Colour 7
        ["#F2779C"],        # Colour 8
        ["#81A1C1"],        # Colour 9
        ["#ff6e6e"]        # Colour 10
    ],
    "mocha":[
        ["#D8DEE9"],      # Colour 0
        ["#1e1e2e"],        # Colour 1
        ["#f28fad"],        # Colour 2
        ["#abe9b3"],        # Colour 3
        ["#fae3b0"],        # Colour 4
        ["#d6acff"],        # Colour 5
        ["#f5c2e7"],        # Colour 6
        ["#89DCEB"],        # Colour 7
        ["#C9CBFF"],        # Colour 8
        ["#b5e8e0"],        # Colour 9
        ["#F2779C"]         # Colour 10
    ],
    "dracula":[
        ["#D8DEE9"],        # Colour 0
        ["#282a36"],        # Colour 1
        ["#F2779C"],        # Colour 2
        ["#8be9fd"],        # Colour 3
        ["#f1fa8c"],        # Colour 4
        ["#d6acff"],        # Colour 5
        ["#ff79c6"],        # Colour 6
        ["#50fa7b"],        # Colour 7
        ["#ff6e6e"],        # Colour 8
        ["#a4ffff"],        # Colour 9
        ["#ff5555"]         # Colour 10
    ],
    "macchiato":[
        ["#D8DEE9"],      # Colour 0
        ["#24273a"],        # Colour 1
        ["#f28fad"],        # Colour 2
        ["#a6da95"],        # Colour 3
        ["#eed49f"],        # Colour 4
        ["#d6acff"],        # Colour 5
        ["#F5BDE6"],        # Colour 6
        ["#8BD5CA"],        # Colour 7
        ["#C9CBFF"],        # Colour 8
        ["#b5e8e0"],        # Colour 9
        ["#ed8796"]         # Colour 10
    ],
    "frappe":[
        ["#D8DEE9"],      # Colour 0
        ["#303446"],        # Colour 1
        ["#EA999C"],        # Colour 2
        ["#A6D189"],        # Colour 3
        ["#E5C890"],        # Colour 4
        ["#d6acff"],        # Colour 5
        ["#F4B8E4"],        # Colour 6
        ["#8CAAEE"],        # Colour 7
        ["#C9CBFF"],        # Colour 8
        ["#b5e8e0"],        # Colour 9
        ["#E78284"]         # Colour 10
    ],
}

decor = {
    "decorations": [
        RectDecoration(
            use_widget_background=True,
            radius=11,
            filled=True,
            padding_y=7,
        )
    ],
    "padding": 10,
}
decor1 = {
    "decorations": [
        RectDecoration(
            use_widget_background=True,
            radius=[11,0,0,11],
            filled=True,
            padding_y=7,
        )
    ],
    "padding": 10,
}
decor2 = {
    "decorations": [
        RectDecoration(
            use_widget_background=True,
            radius=[0,11,11,0],
            filled=True,
            padding_y=7,
        )
    ],
    "padding": 10,
}


xx=17
xf="ubuntumono nerd font bold"
default=[
    widget.GroupBox(
        font="ubuntumono nerd font bold",
        fontsize=25,
        background=colours[theme][1],
        margin_y=4,
        margin_x=5,
        padding_y=3,
        padding_x=2,
        borderwidth=8,
        inactive=colours[theme][5],
        active=colours[theme][2],
        rounded=True,
        # invert_mouse_wheel=True,
        urgent_alert_method="text",
        urgent_text=colours[theme][10],
        highlight_color=colours[theme][4],
        highlight_method="text",
        this_current_screen_border=colours[theme][3],
        block_highlight_text_color=colours[theme][1],
    ),
    widget.Sep(
        padding=2,
        linewidth=0,
    ),
    widget.CurrentLayoutIcon(
        custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
        scale=0.45,
        background=colours[theme][1],
    ),

    widget.Spacer(),

    widget.Systray(
        icon_size=20,
        padding=4,
    ),
    widget.TextBox(
        foreground=colours[theme][9],
        text="|",
        font=xf,
    ),
    widget.CPU(
        background=colours[theme][9],
        foreground=colours[theme][1],
        format='  {load_percent}%',
        font=xf,
        fontsize=xx,
        **decor,
    ),
    widget.TextBox(
        foreground=colours[theme][4],
        text="|",
        font=xf,
    ),
    widget.Memory(
        font=xf,
        fontsize=xx,
        background=colours[theme][4],
        foreground=colours[theme][1],
        measure_mem='G',
        measure_swap='G',
        format='  {MemUsed: .2f} GB',
        **decor,
    ),
    widget.TextBox(
        foreground=colours[theme][6],
        text="|",
        font=xf,
    ),
    widget.Battery(
        low_percentage=0.2,
        font=xf,
        fontsize=xx,
        foreground=colours[theme][1],
        background=colours[theme][6],
        charge_char=' ',
        discharge_char='',
        format='{char} {percent:2.0%} ',
        **decor,
    ),
    widget.TextBox(
        foreground=colours[theme][3],
        text="|",
        font=xf,
    ),
    widget.Volume(
        background=colours[theme][3],
        foreground=colours[theme][1],
        update_interval=0.001,
        font=xf,
        fontsize=xx,
        **decor,
    ),
    widget.TextBox(
        foreground=colours[theme][8],
        text="|",
        font=xf,
    ),
    widget.Clock(
        foreground=colours[theme][1],
        background=colours[theme][8],
        format='  %d %b, %a',
        font=xf,
        fontsize=xx,
        **decor,
    ),
    widget.TextBox(
        foreground=colours[theme][5],
        text="|",
        font=xf,
    ),
    widget.Clock(
        foreground=colours[theme][1],
        background=colours[theme][5],
        font=xf,
        fontsize=xx,
        format='  %I:%M %p',
        **decor,
    ),
    # widget.TextBox(
    #     foreground=colours[theme][7],
    #     text="|",
    #     font=xf,
    # ),
]

screens = [
    Screen(
    top=bar.Bar(
        default,
        40,
        background=colours[theme][1],
        foreground=colours[theme][1],
        opacity=0.9,
        margin=[4,1,4,1],
    ),
    ),
]
