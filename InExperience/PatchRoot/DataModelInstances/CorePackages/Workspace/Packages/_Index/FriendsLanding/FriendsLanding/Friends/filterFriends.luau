local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local dependenciesModule = require(friendsLanding.dependencies)
local presenceType = dependenciesModule.RoduxPresence.Enums.PresenceType
local llama = dependenciesModule.llama
local t = dependenciesModule.t
local filterToPresenceModule = require(friendsLanding.Friends.filterToPresence)
local filterStatesModule = require(friendsLanding.Friends.filterStates)
local getCorrectUserPresenceModule = require(friendsLanding.Friends.getCorrectUserPresence)

return function(p1, p2)
	-- upvalues: t (ref), llama (ref), filterStatesModule (ref), filterToPresenceModule (ref), getCorrectUserPresenceModule (ref), presenceType (ref)
	assert(t.table(p1), "friends should be a table")
	assert(t.string(p2), "filter should be a string")
	
	return llama.List.filter(p1, function(p3)
		-- upvalues: p2 (ref), filterStatesModule (copy), filterToPresenceModule (copy), getCorrectUserPresenceModule (copy), presenceType (copy), llama (copy)
		return if p2 == filterStatesModule.Inactive then p3.isInactiveFriend else llama.List.includes(filterToPresenceModule(p2), getCorrectUserPresenceModule(p3) or presenceType.Offline)
	end)
end