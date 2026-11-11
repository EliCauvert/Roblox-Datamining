local GetFFlagIsSquadEnabledModule = require(script.Parent.GetFFlagIsSquadEnabled)
game:SetFlagVersion("LuaAppEnablePlaySquadButton", 3)

return GetFFlagIsSquadEnabledModule() and game:DefineFastFlag("LuaAppEnablePlaySquadButton", false)