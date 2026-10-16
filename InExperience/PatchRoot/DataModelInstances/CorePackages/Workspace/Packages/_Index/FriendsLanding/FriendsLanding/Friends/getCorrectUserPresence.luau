local PresenceType = require(script:FindFirstAncestor("FriendsLanding").dependencies).RoduxPresence.Enums.PresenceType
local IsUserInGameModule = require(script.Parent.isUserInGame)

return function(p1) --[[ Line: 10 ]]
	-- upvalues: PresenceType (copy), IsUserInGameModule (copy)
	if p1 then
		assert(p1, "")
		local UserPresenceType = p1.userPresenceType
		
		return if UserPresenceType == PresenceType.InGame then IsUserInGameModule(p1) and PresenceType.InGame or PresenceType.Online else UserPresenceType
	else
		return nil
	end
end