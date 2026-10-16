local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local DependenciesModule = require(FriendsLanding.dependencies)
local PresenceType = DependenciesModule.RoduxPresence.Enums.PresenceType
local Llama = DependenciesModule.llama
local T = DependenciesModule.t
local FilterToPresenceModule = require(FriendsLanding.Friends.filterToPresence)
local FilterStatesModule = require(FriendsLanding.Friends.filterStates)
local GetCorrectUserPresenceModule = require(FriendsLanding.Friends.getCorrectUserPresence)

return function(p1, Inactive) --[[ Line: 10 ]]
	-- upvalues: T (copy), Llama (copy), FilterStatesModule (copy), FilterToPresenceModule (copy), GetCorrectUserPresenceModule (copy), PresenceType (copy)
	assert(T.table(p1), "friends should be a table")
	assert(T.string(Inactive), "filter should be a string")
	
	return Llama.List.filter(p1, function(p2) --[[ Line: 14 ]]
		-- upvalues: Inactive (copy), FilterStatesModule (upval), FilterToPresenceModule (upval), GetCorrectUserPresenceModule (upval), PresenceType (upval), Llama (upval)
		return if Inactive == FilterStatesModule.Inactive then p2.isInactiveFriend else Llama.List.includes(FilterToPresenceModule(Inactive), GetCorrectUserPresenceModule(p2) or PresenceType.Offline)
	end)
end