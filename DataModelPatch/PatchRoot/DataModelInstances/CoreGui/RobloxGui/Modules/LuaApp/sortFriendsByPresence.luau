local UserModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Models.User)
local config = {
	[UserModule.PresenceType.IN_GAME] = 3,
	[UserModule.PresenceType.ONLINE] = 2,
	[UserModule.PresenceType.IN_STUDIO] = 1,
	[UserModule.PresenceType.OFFLINE] = 0
}

return function(p1, p2): boolean
	-- upvalues: config (copy)
	local Entry = config[p1.presence] or 0
	local Entry1 = config[p2.presence] or 0
	
	return if Entry == Entry1 then p1.name:lower() < p2.name:lower() else Entry1 < Entry
end