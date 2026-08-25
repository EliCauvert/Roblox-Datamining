local presenceType = require(script:FindFirstAncestor("FriendsLanding").dependencies).RoduxPresence.Enums.PresenceType
local isUserInGameModule = require(script.Parent.isUserInGame)

return function(p0)
	-- upvalues: presenceType (ref), isUserInGameModule (ref)
	if not p0 then
		return nil
	end
	assert(p0, "")
	local userPresenceType = p0.userPresenceType
	
	return if userPresenceType == presenceType.InGame then if isUserInGameModule(p0) then presenceType.InGame else presenceType.Online else userPresenceType
end