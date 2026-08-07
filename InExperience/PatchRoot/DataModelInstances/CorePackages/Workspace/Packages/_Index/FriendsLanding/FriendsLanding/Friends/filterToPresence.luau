local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local presenceType = require(friendsLanding.dependencies).RoduxPresence.Enums.PresenceType
local filterStatesModule = require(friendsLanding.Friends.filterStates)

return function(p0) --[[ line: 6 ]]
	-- upvalues: filterStatesModule (ref), presenceType (ref)
	return if p0 == filterStatesModule.InExperience then { presenceType.InGame, presenceType.InStudio } elseif p0 == filterStatesModule.Offline then { presenceType.Offline } elseif p0 == filterStatesModule.Online then {
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