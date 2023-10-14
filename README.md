# Kevin's Arch Rice (KAR)
My [arch linux](https://archlinux.org/) / [bspwm](https://github.com/baskerville/bspwm) / [polybar](https://polybar.github.io) / [rofi](https://github.com/davatorium/rofi) / [xst](https://github.com/gnotclub/xst) / [helix](https://helix-editor.com) rice.

![alt text](.local/share/rice/rice-screen.png?raw=true)

## Programs (see `~/.config` for the full list)
* login shell: [zsh](https://zsh.org)
* `/bin/sh`: [dash](https://www.man7.org/linux/man-pages/man1/dash.1.html)
* text editor: [helix](https://helix-editor.com)
* window manager: [bspwm](https://github.com/baskerville/bspwm)
* compositor: [picom](https://github.com/yshui/picom)
* terminal: [xst](https://github.com/gnotclub/xst) (a [st](https://st.suckless.org) fork) || [alacritty](https://alacritty.org) (backup)
* status bar: [polybar](https://polybar.github.io)
* file manager: [joshuto](https://github.com/kamiyaa/joshuto)
* file manager: [lf](https://pkg.go.dev/github.com/gokcehan/lf) && [pistol](https://github.com/doronbehar/pistol) && [dragon](https://github.com/mwh/dragon)
* notifications: [dunst](https://dunst-project.org)
* launcher: [rofi](https://github.com/davatorium/rofi)
* music: [mpd](https://www.musicpd.org) && [ncmpcpp](https://github.com/ncmpcpp/ncmpcpp)
* video: [mpv](https://mpv.io)
* hotkeys: [sxhkd](https://github.com/baskerville/sxhkd)
* browser: [qutebrowser](https://qutebrowser.org/)
* base16 theme: [gruvbox](https://github.com/dawikur/base16-gruvbox-scheme)
* dropdown calculator: [julia](https://julialang.org) REPL
* other: [redshift](http://jonls.dk/redshift)-minimal

## Installation

### Dependencies
* The latest version of [my scripts](https://github.com/kpa28-git/scripts) as a git submodule dependency (built-in)
* The latest version of [my themes repo](https://github.com/kpa28-git/themes) as a git submodule dependency (built-in)
* Free API Keys: [Coinmarketcap](https://coinmarketcap.com/api), [Alphavantage](https://www.alphavantage.co/support/#api-key), [World Air Quality Index](http://aqicn.org/data-platform/token/#/) ([instructions](https://github.com/kpa28-git/scripts/blob/master/polybar/README.md))

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
* Global light/dark theme based on env variables `$TIMEDAY`/`$TIMENIGHT` (why I always keep dark mode on: [R](https://www.nature.com/articles/s41598-018-28904-x/), [R](https://iovs.arvojournals.org/article.aspx?articleid=2774698), [R](https://tvst.arvojournals.org/article.aspx?articleid=2778758))

### Shell (see `~/.{z}profile`, `~/.local/bin/aliases`)
* `<mod>+<enter>` opens a terminal at directory of focused window
* `<mod>+<shift>+<enter>` opens a terminal at the home directory

#### Directory Search Aliases (respects `~/.config/fd/ignore_file`)
* `se` (search edit): open file in `$EDITOR`
* `sd` (search directory): cd to the containing directory
* `so` (search open): open file with `$OPENER`
* `sg <str>` (search grep): grep `<str>` within the chosen file (uses `rg`)
* `sr` (search reading): fuzzy search the `$READING` directory and open the file with `$READER` program (also: `srb` and `srp` to search book and paper lists to read from)

#### History Search Aliases
* `hs` (history search): search the history with fzf (you can immediately run the searched command with `$(hs)`)
* `hi` (history input): search the history with fzf and input the chosen command into the shell input

### Hotkeys that make sense (see `~/.config/sxhkd/sxhkdrc`)
* Show the sxhkd keybinds with `mod+<F1>` or in the terminal with `keybinds`
* Some mnemonics: `<mod>+v(iew media)`, `<mod>+f(ile manager)`, `<mod>+g(o to bookmark)`, `<mod>+s(earch the web)`, `<mod>+e(mail client)`, `<mod>+c(alculator)`

### Polybar (see `~/.config/polybar/config`)
![alt text](.local/share/rice/rice-screen-top-left.png?raw=true "top left: air, weather, ethereum")
* World Air Quality Info, crypto price (coinmarketcap), equity price (Alphavantage), moonphase
* my geoloc script (`~/.local/bin/apitools/geoloc`) lets them through a vpn (manual location setting)

### Qutebrowser (see `~/.config/qutebrowser/config.{yml,py}`)
* [qutebrowser](https://qutebrowser.org/)+[buku](https://github.com/jarun/Buku)+[rofi](https://github.com/davatorium/rofi) integration to manage/select bookmarks, these can be launched from inside or outside of the browser (userscripts: `~/.config/qutebrowser/userscripts`)
* More sensible tab movement (h/l move through tabs, J/K move through tab history)
* Set base16 theming easily (set `custom.base16.{light,dark}.file` in `config.yml`)

## TODO
* nushell
* bspwm -> leftwm?
* more tmux config (or tab-rs)
* swhkd
* check out [luakit](https://github.com/luakit/luakit)
* clean up home directory (move dotfiles?)
* cleanup and remove unused luke scripts
* multiplex between fzf and rofi (check if on tty or not)
* search aliases should work with `~/.scripts/termtools/samedir`

## Big Thanks To
* [Luke Smith](https://github.com/LukeSmithxyz) for some of the scripts
* [WillMe](https://github.com/WillemMe) for the basis of the polybar layout

