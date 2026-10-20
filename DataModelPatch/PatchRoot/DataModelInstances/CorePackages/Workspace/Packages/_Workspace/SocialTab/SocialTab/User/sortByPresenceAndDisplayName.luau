local PresenceType = require(script:FindFirstAncestor("SocialTab").dependencies).RoduxPresence.Enums.PresenceType
local config = {
	[PresenceType.InGame] = 3,
	[PresenceType.Online] = 2,
	[PresenceType.InStudio] = 1,
	[PresenceType.Offline] = 0
}

local function _(p1)
	-- upvalues: config (copy), PresenceType (copy)
	return config[p1] or config[PresenceType.Offline]
end

return function(p1, p2): boolean
	-- upvalues: config (copy), PresenceType (copy)
	local Entry = config[p1.userPresenceType] or config[PresenceType.Offline]
	local Entry1 = config[p2.userPresenceType] or config[PresenceType.Offline]
	
	return if Entry == Entry1 then string.lower(p1.displayName) < string.lower(p2.displayName) else Entry1 < Entry
end