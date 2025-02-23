#                   __       ____
#    ___  __ _____ / /  ___ / / /
#   / _ \/ // (_-</ _ \/ -_) / /
#  /_//_/\_,_/___/_//_/\__/_/_/
# nushell env file

# zoxide integration
$env._ZO_EXCLUDE_DIRS = open $"($env.XDG_CONFIG_HOME)/zoxide/ignore_file" | lines | str join ":";
zoxide init nushell | save -f ~/.config/zoxide/.zoxide.nu
