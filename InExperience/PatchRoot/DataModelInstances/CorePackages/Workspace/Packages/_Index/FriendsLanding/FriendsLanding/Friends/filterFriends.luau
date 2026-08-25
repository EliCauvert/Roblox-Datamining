local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local dependenciesModule = require(friendsLanding.dependencies)
local presenceType = dependenciesModule.RoduxPresence.Enums.PresenceType
local llama = dependenciesModule.llama
local t = dependenciesModule.t
local filterToPresenceModule = require(friendsLanding.Friends.filterToPresence)
local filterStatesModule = require(friendsLanding.Friends.filterStates)
local getCorrectUserPresenceModule = require(friendsLanding.Friends.getCorrectUserPresence)

return function(p0, p1)
	-- upvalues: t (ref), llama (ref), filterStatesModule (ref), filterToPresenceModule (ref), getCorrectUserPresenceModule (ref), presenceType (ref)
	assert(t.table(p0), "friends should be a table")
	assert(t.string(p1), "filter should be a string")
	
	return llama.List.filter(p0, function(p2)
		-- upvalues: p1 (ref), filterStatesModule (copy), filterToPresenceModule (copy), getCorrectUserPresenceModule (copy), presenceType (copy), llama (copy)
		return if p1 == filterStatesModule.Inactive then p2.isInactiveFriend else llama.List.includes(filterToPresenceModule(p1), getCorrectUserPresenceModule(p2) or presenceType.Offline)
	end)
end