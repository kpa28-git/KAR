#                   __       ____
#    ___  __ _____ / /  ___ / / /
#   / _ \/ // (_-</ _ \/ -_) / /
#  /_//_/\_,_/___/_//_/\__/_/_/
# nushell config file

$env.config.show_banner = false

source "~/.local/bin/aliases/load-aliases.nu"
source "~/.config/zoxide/.zoxide.nu"

if (is-installed theme.sh) {
	let theme = match (open ~/.cache/darkman/mode.txt) {
		"light" => "atelier-estuary-light"
		_ => "eighties"
	}
	theme.sh $theme
}

