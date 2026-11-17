local InviteFriends = require(script:FindFirstAncestor("InExperienceSideSheet").Common.Constants).IntegrationIds.InviteFriends

return function(InviteFriends1, p1, p2): boolean
	-- upvalues: InviteFriends (copy)
	return InviteFriends1 ~= InviteFriends or (not p1 or not p2)
end