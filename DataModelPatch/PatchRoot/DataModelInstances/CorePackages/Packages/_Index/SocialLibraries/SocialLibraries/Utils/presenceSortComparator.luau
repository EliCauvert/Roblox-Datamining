local UserModel = require(script:FindFirstAncestor("SocialLibraries").dependencies).UserModel
local config = {
	[UserModel.PresenceType.IN_GAME] = 3,
	[UserModel.PresenceType.ONLINE] = 2,
	[UserModel.PresenceType.IN_STUDIO] = 1,
	[UserModel.PresenceType.OFFLINE] = 0
}

return function(p1, p2): boolean
	-- upvalues: config (copy)
	local P0 = p1 or {}
	local P1 = p2 or {}
	local Presence = P0.presence
	local Presence1 = P1.presence
	
	return if Presence and Presence1 and config[Presence] ~= config[Presence1] then config[Presence1] < config[Presence] else P0.displayName < P1.displayName
end