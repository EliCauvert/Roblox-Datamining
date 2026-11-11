local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(UniverseId, IsUniverseEnabledForVoice)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(UniverseId, "string", "universeId")
	ArgCheckModule.isType(IsUniverseEnabledForVoice, "boolean", "isUniverseEnabledForVoice")
	
	return {
		universeId = UniverseId,
		isUniverseEnabledForVoice = IsUniverseEnabledForVoice
	}
end)