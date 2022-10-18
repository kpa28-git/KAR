# Kevin's Arch Rice (KAR)
My arch linux / bspwm / polybar / rofi / st / kakoune rice.

![alt text](.local/share/rice/rice-screen.png?raw=true)

## Programs
* login shell: zsh
* `/bin/sh`: dash
* text editor: kakoune
* window manager: bspwm
* compositor: picom
* terminal: st (xst fork) || alacritty (backup)
* status bar: polybar
* file manager: lf+pistol+dragon
* notifications: dunst
* launcher: rofi
* music: mpd+ncmpcpp
* video: mpv
* hotkeys: sxhkd
* browser: qutebrowser
* base16 theme: gruvbox
* dropdown calculator: julia REPL
* other: redshift-minimal

## Installation
1. Make sure you have all required programs installed
2. Clone this repo: `git clone git@github.com:kevindirect/KAR.git`
3. Populate submodules: `git submodule update --init --recursive`

## Dependencies
* The latest version of [my scripts](https://github.com/kevindirect/scripts) as a git submodule dependency (built-in).
* The latest version of [my themes repo](https://github.com/kevindirect/themes) as a git submodule dependency (built-in).
* Free API Keys: [Coinmarketcap](https://coinmarketcap.com/api), [Alphavantage](https://www.alphavantage.co/support/#api-key), [World Air Quality Index](http://aqicn.org/data-platform/token/#/) ([instructions](https://github.com/kevindirect/scripts/blob/master/polybar/README.md)).

## Overview
* Low friction shell - well organized crossplatform aliases and quick navigation tools
* Mnemonic hotkeys to do common things in graphical sessions
* Minimalist HUD-like statusbar
* Browser configured for intuitive use and low friction
* Most of [my scripts](https://github.com/kevindirect/scripts) are POSIX compliant for speed and portability
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
* qutebrowser+[buku](https://github.com/jarun/Buku)+rofi integration to manage bookmarks, these can be launched from inside or outside of the browser (userscripts: `~/.config/qutebrowser/userscripts`)
* More sensible tab movement (h/l move through tabs, J/K move through tab history)
* Set base16 theming easily (set `custom.base16.{light,dark}.file` in `config.yml`)

## TODO
* tmux
* clean up home directory (move dotfiles?)
* cleanup and remove unused luke scripts
* multiplex between fzf and rofi (check if on tty or not)
* search aliases should work with `~/.scripts/termtools/samedir`

## Big Thanks To
* [Luke Smith](https://github.com/LukeSmithxyz) for some of the scripts
* [WillMe](https://github.com/WillemMe) for the basis of the polybar layout

