#        _      ___
#       (_)_ __/ (_)__ _
#      / / // / / / _ `/
#   __/ /\_,_/_/_/\_,_/
#  |___/
# julia runtime config
#
# symlink $HOME/.julia/config/startup.jl to this file to have it load on startup

using Pkg
# Pkg.status()
# Pkg.add("package")
# Pkg.update()
# Pkg.rm("package")

using Neptune # start server with Neptune.run()

