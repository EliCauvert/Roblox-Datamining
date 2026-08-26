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

return function(p1, p2)
	-- upvalues: addUser (ref), immutable (ref), addUsers (ref), setUserIsFriend (ref), setUserPresence (ref), receivedUserPresence (ref), setUserMembershipType (ref), fFlagEnableBlackbirdCheck (ref), setUserHasRobloxSubscription (ref), removeUser (ref), receivedDisplayName (ref)
	p1 = p1 or {}
	assert(p1, "")
	
	if p2.type == addUser.name then
		local user = p2.user
		p1 = immutable.Set(p1, user.id, user)
		
		return p1
	elseif p2.type == addUsers.name then
		local t = {}
		
		for i, v in pairs(p2.users) do
			local var1 = p1[i]
			
			if var1 then
				t[i] = immutable.JoinDictionaries(var1, v)
			else
				t[i] = v
			end
		end
		p1 = immutable.JoinDictionaries(p1, t)
		
		return p1
	elseif p2.type == setUserIsFriend.name then
		local userId = p1[p2.userId]
		
		if userId then
			p1 = immutable.Set(p1, userId.id, immutable.Set(userId, "isFriend", p2.isFriend))
			
			return p1
		end
		warn("Setting isFriend on user", p2.userId, "who doesn't exist yet")
		
		return p1
	elseif p2.type == setUserPresence.name then
		local userId = p1[p2.userId]
		
		if userId then
			p1 = immutable.Set(p1, userId.id, immutable.JoinDictionaries(userId, { presence = p2.presence, lastLocation = p2.lastLocation }))
			
			return p1
		end
		warn("Setting presence on user", p2.userId, "who doesn't exist yet")
		
		return p1
	elseif p2.type == receivedUserPresence.name then
		local userId = p1[p2.userId]
		
		if userId then
			p1 = immutable.JoinDictionaries(p1, {
				[p2.userId] = immutable.JoinDictionaries(userId, {
					presence = p2.presence,
					lastLocation = p2.lastLocation,
					placeId = p2.placeId,
					rootPlaceId = p2.rootPlaceId,
					gameInstanceId = p2.gameInstanceId,
					lastOnline = p2.lastOnline,
					universeId = p2.universeId
				})
			})
			
			return p1
		end
	elseif p2.type == setUserMembershipType.name then
		local userId = p1[p2.userId]
		
		if userId then
			p1 = immutable.JoinDictionaries(p1, {
				[p2.userId] = immutable.JoinDictionaries(userId, { membership = p2.membershipType })
			})
			
			return p1
		end
	elseif fFlagEnableBlackbirdCheck and p2.type == setUserHasRobloxSubscription.name then
		local userId = p1[p2.userId]
		
		if userId then
			p1 = immutable.JoinDictionaries(p1, {
				[p2.userId] = immutable.JoinDictionaries(userId, { hasRobloxSubscription = p2.hasRobloxSubscription })
			})
			
			return p1
		end
	elseif p2.type == removeUser.name then
		if p1[p2.userId] then
			p1 = immutable.RemoveFromDictionary(p1, p2.userId)
			
			return p1
		end
	elseif p2.type == receivedDisplayName.name then
		local userId = p1[p2.userId]
		
		if userId then
			p1 = immutable.JoinDictionaries(p1, {
				[p2.userId] = immutable.JoinDictionaries(userId, { displayName = p2.displayName })
			})
		end
	end
	return p1
end