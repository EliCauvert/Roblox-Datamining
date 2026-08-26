local presenceType = require(script:FindFirstAncestor("FriendsLanding").dependencies).RoduxPresence.Enums.PresenceType
local isUserInGameModule = require(script.Parent.isUserInGame)

return function(p1)
	-- upvalues: presenceType (ref), isUserInGameModule (ref)
	if not p1 then
		return nil
	end
	assert(p1, "")
	local userPresenceType = p1.userPresenceType
	
	return if userPresenceType == presenceType.InGame then if isUserInGameModule(p1) then presenceType.InGame else presenceType.Online else userPresenceType
end