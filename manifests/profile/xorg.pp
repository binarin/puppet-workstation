class binarin::profile::xorg {
  $packages = ["xorg", "xinput", "fonts-mplus"]
  package { $packages:
    ensure => latest
  }

  concat { "/etc/X11/xorg.conf": }
  concat::fragment { "xorg.conf-header":
    order => "00",
    content => "# Autogenerated by puppet",
    target => "/etc/X11/xorg.conf",
  }


  concat::fragment { "xorg.conf-keyboard":
    order => "50",
    target => "/etc/X11/xorg.conf",
    content => '
Section "InputClass"
        Identifier "Keyboard"
        MatchIsKeyboard "True"
        Option          "XkbRules"      "xorg"
        Option          "XkbModel"      "pc105"
        Option          "XkbLayout"     "us,ru"
        Option          "XkbVariant"    "dvp,dvp"
        Option          "XkbOptions"    "grp:menu_toggle,ctrl:nocaps,altwin:super_win,grp:sclk_toggle"
EndSection
'}


  concat::fragment { "xorg.conf-synaptics":
    order => "50",
    target => "/etc/X11/xorg.conf",
    content => '

Section "InputClass"
        Identifier "InternalTouchpad"
        Option "TapButton1" "1"
        Option "SpecialScrollAreaRight" "true"
        Option "VertEdgeScroll" "true"
        Option "VertTwoFingerScroll" "true"
        MatchProduct "Synaptics"
EndSection
'}

  concat::fragment { "xorg.conf-glidepoint":
    order => "50",
    target => "/etc/X11/xorg.conf",
    content => '
Section "InputClass"
        Identifier "CirqueTouchpad"
        MatchProduct "GlidePoint|9925 AG Touchpad"
        Option "SwapAxes" "True"
        Option "Emulate3Buttons" "True"
        Option "InvertY" "True"
EndSection
    '
  }

  concat::fragment { "xorg.conf-marblemouse":
    order => "50",
    target => "/etc/X11/xorg.conf",
    content => '
Section "InputClass"
        Identifier "MarbleMouse"
        MatchProduct "Marble Mouse"
        Option "EmulateWheel" "true"
        Option "EmulateWheelButton" "8"
        Option "Emulate3Buttons" "True"
EndSection
'
  }

  exec { "/usr/bin/dpkg-divert --divert /usr/share/X11/xkb/symbols/ru.orig --rename /usr/share/X11/xkb/symbols/ru":
    unless => "/usr/bin/dpkg-divert --list | grep /usr/share/X11/xkb/symbols/ru.orig",
  } ->
  concat { "/usr/share/X11/xkb/symbols/ru":
    ensure_newline => true,
  }

  concat::fragment { "/usr/share/X11/xkb/symbols/ru - fragment with original content":
    target => "/usr/share/X11/xkb/symbols/ru",
    order => "00",
    content => $::xkb_symbols_ru
  }

  concat::fragment { "/usr/share/X11/xkb/symbols/ru - russian programmers dvorak":
    target => "/usr/share/X11/xkb/symbols/ru",
    order => "50",
    source => "puppet:///modules/binarin/russian-programmer-dvorak/ru-xkb.add",
  }

}
