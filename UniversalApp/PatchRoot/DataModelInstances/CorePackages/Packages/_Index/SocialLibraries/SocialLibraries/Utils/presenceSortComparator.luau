local userModel = require(script:FindFirstAncestor("SocialLibraries").dependencies).UserModel
local t = {
	[userModel.PresenceType.IN_GAME] = 3,
	[userModel.PresenceType.ONLINE] = 2,
	[userModel.PresenceType.IN_STUDIO] = 1,
	[userModel.PresenceType.OFFLINE] = 0
}

return function(p1, p2)
	-- upvalues: t (ref)
	p1 = p1 or {}
	p2 = p2 or {}
	p1 = p1.presence
	local presence = p2.presence
	
	return if p1 and presence and t[p1] ~= t[presence] then t[presence] < t[p1] else p1.displayName < p2.displayName
end