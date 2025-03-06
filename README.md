# Kevin's Arch Rice (KAR)
My [arch linux](https://archlinux.org/) / [niri](https://github.com/YaLTeR/niri) / [yambar](https://codeberg.org/dnkl/yambar) / [tofi](https://github.com/philj56/tofi) / [foot](https://codeberg.org/dnkl/foot/) / [yazi](https://github.com/sxyazi/yazi) / [helix](https://helix-editor.com) / [nushell](https://www.nushell.sh/) rice.

Note (2025-02-17): Only recently swtiched to wayland / niri, so these configs may change a lot

![alt text](.local/share/rice/rice-screen.png?raw=true)

## Programs (see `~/.config` for the full list)
* default shell: [nushell](https://www.nushell.sh/)
* login shell: [bash](https://www.gnu.org/software/bash/manual/bash.html)
* `/bin/sh`: [dash](https://www.man7.org/linux/man-pages/man1/dash.1.html)
* text editor: [helix](https://helix-editor.com)
* wayland compositor: [niri](https://github.com/YaLTeR/niri)
* terminal: [foot](https://codeberg.org/dnkl/foot/)
* status bar: [yambar](https://codeberg.org/dnkl/yambar)
* notifications: [mako](https://github.com/emersion/mako)
* file manager: [yazi](https://github.com/sxyazi/yazi)
* launcher: [tofi](https://github.com/philj56/tofi)
* muxer: [zellij](https://github.com/zellij-org/zellij)
* resource monitor: [btop](https://github.com/aristocratos/btop)
* video player: [mpv](https://mpv.io)
* audio player: [termusic](https://github.com/tramhao/termusic)
* browser: librewolf + [tridactyl](https://github.com/tridactyl/tridactyl)
* calculator: [julia](https://julialang.org) REPL
* monospace font: [Iosevka Term SS17](https://github.com/be5invis/Iosevka)
* day/night theming: [darkman](https://gitlab.com/WhyNotHugo/darkman), [wl-sunset](https://github.com/kennylevinsen/wlsunset)

## Installation

### Dependencies
* The latest version of [my scripts](https://github.com/kpa28-git/scripts) as a git submodule dependency (built-in)
<!-- * Free API Keys: [Coinmarketcap](https://coinmarketcap.com/api), [Alphavantage](https://www.alphavantage.co/support/#api-key), [World Air Quality Index](http://aqicn.org/data-platform/token/#/) ([instructions](https://github.com/kpa28-git/scripts/blob/master/polybar/README.md)) -->

### Steps
1. Make sure you have all required programs installed
2. Clone this repo: `git clone git@github.com:kpa28-git/KAR.git`
3. Populate submodules: `git submodule update --init --recursive`

## Overview
* Low friction shell - well organized crossplatform aliases and quick navigation tools
* Mnemonic hotkeys to do common things in graphical sessions
* Minimalist HUD-like statusbar
* Browser configured for intuitive use and low friction
* Most of [my scripts](https://github.com/kpa28-git/scripts) are POSIX compliant for speed and portability
* Global light/dark theme with darkman

### Hotkeys (see `~/.config/niri/config.kdl`)
* Show important niri keybinds with `<super>+<F1>`
* `<super>+<enter>` opens a terminal at the directory of the currently focused terminal (this was set in foot and not in niri)
* `<super>+<shift>+<enter>` opens a terminal at home
* Some mnemonics: `<super>+f(ile manager)`, `<super>+e(mail client)`, `<super>+c(alculator)`, `<super>+b(rowser)`, 
* Hotkeys involving moving windows usually use `shift`

#### Directory Search Aliases (respects `~/.config/fd/ignore_file`)
* `se` (search edit): open file in `$EDITOR`
* `sd` (search directory): cd to the containing directory
* `so` (search open): open file with `$OPENER`
* `sg <str>` (search grep): grep `<str>` within the chosen file (uses `rg`)
* `sr` (search reading): fuzzy search the `$READING` directory and open the file with `$READER` program (also: `srb` and `srp` to search book and paper lists to read from)

