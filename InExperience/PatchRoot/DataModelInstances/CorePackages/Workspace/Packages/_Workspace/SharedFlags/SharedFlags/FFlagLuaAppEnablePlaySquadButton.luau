local getFFlagIsSquadEnabledModule = require(script.Parent.GetFFlagIsSquadEnabled)
game:SetFlagVersion("LuaAppEnablePlaySquadButton", 3)

return getFFlagIsSquadEnabledModule() and game:DefineFastFlag("LuaAppEnablePlaySquadButton", false)