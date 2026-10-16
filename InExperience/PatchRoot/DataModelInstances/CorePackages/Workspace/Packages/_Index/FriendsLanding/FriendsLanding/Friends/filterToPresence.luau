local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local PresenceType = require(FriendsLanding.dependencies).RoduxPresence.Enums.PresenceType
local FilterStatesModule = require(FriendsLanding.Friends.filterStates)

return function(InExperience) --[[ Line: 6 ]]
	-- upvalues: FilterStatesModule (copy), PresenceType (copy)
	return if InExperience == FilterStatesModule.InExperience then { PresenceType.InGame, PresenceType.InStudio } elseif InExperience == FilterStatesModule.Offline then { PresenceType.Offline } elseif InExperience == FilterStatesModule.Online then {
		PresenceType.Online,
		PresenceType.InStudio,
		PresenceType.InGame
	} else {
		PresenceType.Online,
		PresenceType.InStudio,
		PresenceType.InGame,
		PresenceType.Offline
	}
end