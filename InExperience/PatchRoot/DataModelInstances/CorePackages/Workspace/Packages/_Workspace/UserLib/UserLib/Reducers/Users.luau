local userLib = script:FindFirstAncestor("UserLib")
local parent = userLib.Parent
local immutable = require(parent.AppCommonLib).Immutable
local addUser = require(userLib.Actions).AddUser
local addUsers = require(userLib.Actions).AddUsers
local receivedUserPresence = require(userLib.Actions).ReceivedUserPresence
local removeUser = require(userLib.Actions).RemoveUser
local setUserIsFriend = require(userLib.Actions).SetUserIsFriend
local setUserMembershipType = require(userLib.Actions).SetUserMembershipType
local setUserHasRobloxSubscription = require(userLib.Actions).SetUserHasRobloxSubscription
local setUserPresence = require(userLib.Actions).SetUserPresence
local receivedDisplayName = require(userLib.Actions).ReceivedDisplayName
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck

return function(p0, p1) --[[ line: 20 ]]
	-- upvalues: addUser (ref), immutable (ref), addUsers (ref), setUserIsFriend (ref), setUserPresence (ref), receivedUserPresence (ref), setUserMembershipType (ref), fFlagEnableBlackbirdCheck (ref), setUserHasRobloxSubscription (ref), removeUser (ref), receivedDisplayName (ref)
	p0 = p0 or {}
	assert(p0, "")
	
	if p1.type == addUser.name then
		local user = p1.user
		p0 = immutable.Set(p0, user.id, user)
		
		return p0
	elseif p1.type == addUsers.name then
		local t = {}
		
		for i, v in pairs(p1.users) do
			local var2 = p0[i]
			
			if var2 then
				t[i] = immutable.JoinDictionaries(var2, v)
			else
				t[i] = v
			end
		end
		p0 = immutable.JoinDictionaries(p0, t)
		
		return p0
	elseif p1.type == setUserIsFriend.name then
		local userId = p0[p1.userId]
		
		if userId then
			p0 = immutable.Set(p0, userId.id, immutable.Set(userId, "isFriend", p1.isFriend))
			
			return p0
		end
		warn("Setting isFriend on user", p1.userId, "who doesn't exist yet")
		
		return p0
	elseif p1.type == setUserPresence.name then
		local userId = p0[p1.userId]
		
		if userId then
			p0 = immutable.Set(p0, userId.id, immutable.JoinDictionaries(userId, { presence = p1.presence, lastLocation = p1.lastLocation }))
			
			return p0
		end
		warn("Setting presence on user", p1.userId, "who doesn't exist yet")
		
		return p0
	elseif p1.type == receivedUserPresence.name then
		local userId = p0[p1.userId]
		
		if userId then
			p0 = immutable.JoinDictionaries(p0, {
				[p1.userId] = immutable.JoinDictionaries(userId, {
					presence = p1.presence,
					lastLocation = p1.lastLocation,
					placeId = p1.placeId,
					rootPlaceId = p1.rootPlaceId,
					gameInstanceId = p1.gameInstanceId,
					lastOnline = p1.lastOnline,
					universeId = p1.universeId
				})
			})
			
			return p0
		end
	elseif p1.type == setUserMembershipType.name then
		local userId = p0[p1.userId]
		
		if userId then
			p0 = immutable.JoinDictionaries(p0, {
				[p1.userId] = immutable.JoinDictionaries(userId, { membership = p1.membershipType })
			})
			
			return p0
		end
	elseif fFlagEnableBlackbirdCheck and p1.type == setUserHasRobloxSubscription.name then
		local userId = p0[p1.userId]
		
		if userId then
			p0 = immutable.JoinDictionaries(p0, {
				[p1.userId] = immutable.JoinDictionaries(userId, { hasRobloxSubscription = p1.hasRobloxSubscription })
			})
			
			return p0
		end
	elseif p1.type == removeUser.name then
		if p0[p1.userId] then
			p0 = immutable.RemoveFromDictionary(p0, p1.userId)
			
			return p0
		end
	elseif p1.type == receivedDisplayName.name then
		local userId = p0[p1.userId]
		
		if userId then
			p0 = immutable.JoinDictionaries(p0, {
				[p1.userId] = immutable.JoinDictionaries(userId, { displayName = p1.displayName })
			})
		end
	end
	return p0
end