#        _      ___
#       (_)_ __/ (_)__ _
#      / / // / / / _ `/
#   __/ /\_,_/_/_/\_,_/
#  |___/
# julia runtime config
#
# symlink $HOME/.julia/config/startup.jl to this file to have it load on startup

# using AbbreviatedStackTraces
using OhMyREPL
using Revise

logger_debug_all!() = ENV["JULIA_DEBUG"] = "all"    # show @debug in all contexts
logger_debug_main!() = ENV["JULIA_DEBUG"] = Main    # show @debug in Main only
logger_debug_clear!() = delete!(ENV, "JULIA_DEBUG") # no @debug shown (default)
