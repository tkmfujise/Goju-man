(pwd() != @__DIR__) && cd(@__DIR__) # allow starting app from bin/ dir

using GojuMan
const UserApp = GojuMan
GojuMan.main()
