local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local presenceType = require(friendsLanding.dependencies).RoduxPresence.Enums.PresenceType
local filterStatesModule = require(friendsLanding.Friends.filterStates)

return function(p1)
	-- upvalues: filterStatesModule (ref), presenceType (ref)
	return if p1 == filterStatesModule.InExperience then { presenceType.InGame, presenceType.InStudio } elseif p1 == filterStatesModule.Offline then { presenceType.Offline } elseif p1 == filterStatesModule.Online then {
		presenceType.Online,
		presenceType.InStudio,
		presenceType.InGame
	} else {
		presenceType.Online,
		presenceType.InStudio,
		presenceType.InGame,
		presenceType.Offline
	}
end