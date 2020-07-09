# Kevin's Arch Rice (KAR)
My arch linux / bspwm / kakoune/ polybar rice.
Clone it and watch this bad boy go.

![alt text](.local/share/rice/rice-screen.png?raw=true)

## Features
* Most of the scripts are POSIX compliant for speed and portability

## Fuzzyfinding with fzf
* I generally prefer search based navigation to static aliases

### Search Based Navigation
* All navigation is based on the alias `s` defined in `aliasrc`.
* `s` (search): fzf filter paths returned by `lspaths` (the latter lists paths from the current directory and it respects the `ignore_file` at `$XDG_CONFIG_HOME/fd/ignore_file`.).
* The following aliases or functions run on the result of `s`
	* `se` (search edit): open in $EDITOR
	* `sd` (search directory): cd to the containing directory (or to it if it's a directory)
	* `so` (search open): open with $OPENER
	* `sg <str>` (search grep): grep string within the file (uses `rg`)
* `sr` (search reading): fuzzy search the `$READING` directory and open the file with `$READER` program. I added this over so to limit the search space and stay organized with my current reading.

### History
* `hs` (history search): search the history with fzf (you can immediately run the searched command with `$(hs)`)
* `hi` (history input): search the history with fzf and input the chosen command into the shell input

### Polybar
![alt text](.local/share/rice/rice-screen-top-left.png?raw=true "top left: air, weather, ethereum")
* A minimalist high information HUD-like statusbar
* World Air Quality info in top left
	* my geoloc script (`~/.local/bin/apitools/geoloc`) lets it work through a vpn (manual location setting)
* Weather
	* my geoloc script (`~/.local/bin/apitools/geoloc`) lets it work through a vpn (manual location setting)
* Ethereum price (can be easily changed to any crypto tracked by coinmarketcap)
* S&P500 and Russell 2000 asset prices (via alphavantage)
* Moonphase
* See my `~/.config/polybar/config`

### Hotkeys that make sense
* All hotkeys can be modified from `~/.config/sxhkd/sxhkdrc`
* Show the sxhkd keybinds with mod+F1 or in the terminal with `keybinds`

### Qutebrowser
![qutebrowser+buku+rofi integration](.local/share/rice/rice-qb.gif)
* Text file configuration at: `~/.config/qutebrowser/config.yml`
	* Cleaner to version control and no need to modify a giant config.py
* rofi+buku+qutebrowser integration to manage bookmarks
	* standard qutebrowser bookmark management sucks
	* my rbuku script uses the powerful and browser agnostic [buku](https://github.com/jarun/Buku) to manage bookmarks with a [rofi](https://github.com/davatorium/rofi) interface
		- rbuku will work with any browser as long as it has a commandline interface to launch it
	* qb-rbuku userscript wraps around my rbuku script (`~/.local/bin/uitools/rbuku`) to enable in-browser launching
		- :b / mod+g(o) -> go to a bookmark
		- :ba -> add current or hinted url as a bookmark (opens a prompt for tags, title, etc)
		- :br -> remove one or more bookmarks (disabled by default)
	* see config.yml `## ALIASES`
* A lot of search engine additions
	* mod+s(earch) -> open up rofi search engine prompt - go directly from the desktop to a search engine search (one step vs three steps)
	* see config.yml `## URL`
* More sensible tab movement
	* H and L move left and right through tabs
	* J and K move up and down through selected tab's history
	* h/j/k/l still scroll up/down/left/right in the selected tab
	* see config.yml `## KEYBINDS`
* Set base16 theming easily
	* Set `custom.base16.file` in config.yml to any base16 yaml file
* youtube-dl+rofi integration with `:rytd`

### Redshift
* redshift starts at boot
* my geoloc script (`~/.local/bin/apitools/geoloc`) lets it work through a vpn (manual location setting)
* redshift config at `~/.config/redshift/redshift.conf`

## TODO
* continue adding to kakrc
* Next browser config
	* Play around with and learn next
	* Start building a config file `~/.config/next/init.lisp`
* Custom st build
	* scrollback, alpha patch, working dpi setting, dedicated config file, remove <a-l> binding
* clean up home directory (move dotfiles elsewhere?)
* Set global theming from my directory of base16 files
	* Choose a theme from a rofi prompt and set base16 for:
		* Xresources (needs fixing)
		* qutebrowser
* lf
	* fix vidir problem with spaces in filenames, escape spaces
* cleanup and remove unused luke scripts
* xdg-open within the current terminal window
* multiplex between fzf and rofi
* search aliases should work with `~/.scripts/termtools/samedir` (cd back and forth? can't use pushd/popd because those aren't POSIX). move to directory and 'cd -' at the end

## Installation
1. Make sure you have all required programs installed
2. Clone this repo: `git clone git@github.com:kpatel28/KAR.git`
3. Populate submodules: `git submodule update --init --recursive`

## Details
* login shell: bash
* `/bin/sh`: dash
* window manager: bspwm
* compositor: picom
* terminal: st || alacritty (backup)
* terminal (monospace) font: Hack Nerd Font Mono
* bar: polybar
* bar icon: hack nerd font
* text editor: kakoune
* file manager: lf+pistol
* notifications: dunst
* launcher: rofi
* music: mpd+ncmpcpp
* video: mpv
* hotkeys: sxhkd
* browser: qutebrowser || next
* base16 theme: gruvbox

## Dependencies
* The latest version of [my scripts](https://github.com/kpatel28/scripts) as a git submodule dependency (built-in).
* The latest version of [my themes repo](https://github.com/kpatel28/themes) as a git submodule dependency (built-in).
* API Keys from [Coinmarketcap](https://coinmarketcap.com/api) and [World Air Quality Index](http://aqicn.org/data-platform/token/#/) ([Instructions](https://github.com/kpatel28/scripts/blob/master/polybar/README.md)).
* The programs these dotfiles rice.

## Big Thanks To
* [Luke Smith](https://github.com/LukeSmithxyz) for some of the scripts
* [WillMe](https://github.com/WillemMe) for the basis of the polybar layout

