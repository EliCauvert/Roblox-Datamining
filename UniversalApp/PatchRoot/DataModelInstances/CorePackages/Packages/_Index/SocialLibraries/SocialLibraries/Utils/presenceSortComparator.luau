local userModel = require(script:FindFirstAncestor("SocialLibraries").dependencies).UserModel
local t = {
	[userModel.PresenceType.IN_GAME] = 3,
	[userModel.PresenceType.ONLINE] = 2,
	[userModel.PresenceType.IN_STUDIO] = 1,
	[userModel.PresenceType.OFFLINE] = 0
}

return function(p0, p1)
	-- upvalues: t (ref)
	p0 = p0 or {}
	p1 = p1 or {}
	p0 = p0.presence
	local presence = p1.presence
	
	return if p0 and presence and t[p0] ~= t[presence] then t[presence] < t[p0] else p0.displayName < p1.displayName
end