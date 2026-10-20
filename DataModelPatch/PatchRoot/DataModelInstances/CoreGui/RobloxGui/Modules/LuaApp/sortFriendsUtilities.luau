local UserModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Models.User)
local config = {
	[UserModule.PresenceType.IN_GAME] = 3,
	[UserModule.PresenceType.ONLINE] = 2,
	[UserModule.PresenceType.IN_STUDIO] = 1,
	[UserModule.PresenceType.OFFLINE] = 0
}

return {
	useLastOnlineForSort = function(p1, p2): boolean
		return typeof(p1) == "number" and typeof(p2) == "number" and p1 ~= p2
	end,
	getFriendWeight = function(p1)
		-- upvalues: config (copy), UserModule (copy)
		local Entry = if p1 and p1.presence then config[p1.presence] else nil
		
		if Entry == nil then
			Entry = config[UserModule.PresenceType.OFFLINE]
		end
		return Entry
	end
}