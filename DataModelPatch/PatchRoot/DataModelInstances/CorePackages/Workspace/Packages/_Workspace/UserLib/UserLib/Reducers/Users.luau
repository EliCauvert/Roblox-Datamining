local UserLib = script:FindFirstAncestor("UserLib")
local Parent = UserLib.Parent
local Immutable = require(Parent.AppCommonLib).Immutable
local AddUser = require(UserLib.Actions).AddUser
local AddUsers = require(UserLib.Actions).AddUsers
local ReceivedUserPresence = require(UserLib.Actions).ReceivedUserPresence
local RemoveUser = require(UserLib.Actions).RemoveUser
local SetUserIsFriend = require(UserLib.Actions).SetUserIsFriend
local SetUserMembershipType = require(UserLib.Actions).SetUserMembershipType
local SetUserHasRobloxSubscription = require(UserLib.Actions).SetUserHasRobloxSubscription
local SetUserPresence = require(UserLib.Actions).SetUserPresence
local ReceivedDisplayName = require(UserLib.Actions).ReceivedDisplayName
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck

return function(p1, p2)
	-- upvalues: AddUser (copy), Immutable (copy), AddUsers (copy), SetUserIsFriend (copy), SetUserPresence (copy), ReceivedUserPresence (copy), SetUserMembershipType (copy), FFlagEnableBlackbirdCheck (copy), SetUserHasRobloxSubscription (copy), RemoveUser (copy), ReceivedDisplayName (copy)
	local P0 = p1 or {}
	assert(P0, "")
	
	if p2.type == AddUser.name then
		local User = p2.user
		P0 = Immutable.Set(P0, User.id, User)
		
		return P0
	end
	if p2.type == AddUsers.name then
		local JoinDictionariesResults = {}
		
		for i, user in pairs(p2.users) do
			local Entry = P0[i]
			
			if Entry then
				JoinDictionariesResults[i] = Immutable.JoinDictionaries(Entry, user)
			else
				JoinDictionariesResults[i] = user
			end
		end
		P0 = Immutable.JoinDictionaries(P0, JoinDictionariesResults)
		
		return P0
	elseif p2.type == SetUserIsFriend.name then
		local Entry = P0[p2.userId]
		
		if Entry then
			P0 = Immutable.Set(P0, Entry.id, (Immutable.Set(Entry, "isFriend", p2.isFriend)))
			
			return P0
		else
			warn("Setting isFriend on user", p2.userId, "who doesn't exist yet")
			
			return P0
		end
	elseif p2.type == SetUserPresence.name then
		local Entry = P0[p2.userId]
		
		if Entry then
			P0 = Immutable.Set(P0, Entry.id, (Immutable.JoinDictionaries(Entry, { presence = p2.presence, lastLocation = p2.lastLocation })))
			
			return P0
		else
			warn("Setting presence on user", p2.userId, "who doesn't exist yet")
			
			return P0
		end
	else
		if p2.type == ReceivedUserPresence.name then
			local Entry = P0[p2.userId]
			
			if Entry then
				P0 = Immutable.JoinDictionaries(P0, {
					[p2.userId] = Immutable.JoinDictionaries(Entry, {
						presence = p2.presence,
						lastLocation = p2.lastLocation,
						placeId = p2.placeId,
						rootPlaceId = p2.rootPlaceId,
						gameInstanceId = p2.gameInstanceId,
						lastOnline = p2.lastOnline,
						universeId = p2.universeId
					})
				})
				
				return P0
			end
		elseif p2.type == SetUserMembershipType.name then
			local Entry = P0[p2.userId]
			
			if Entry then
				P0 = Immutable.JoinDictionaries(P0, {
					[p2.userId] = Immutable.JoinDictionaries(Entry, { membership = p2.membershipType })
				})
				
				return P0
			end
		elseif FFlagEnableBlackbirdCheck and p2.type == SetUserHasRobloxSubscription.name then
			local Entry = P0[p2.userId]
			
			if Entry then
				P0 = Immutable.JoinDictionaries(P0, {
					[p2.userId] = Immutable.JoinDictionaries(Entry, { hasRobloxSubscription = p2.hasRobloxSubscription })
				})
				
				return P0
			end
		elseif p2.type ~= RemoveUser.name then
			if p2.type == ReceivedDisplayName.name then
				local Entry = P0[p2.userId]
				
				if Entry then
					P0 = Immutable.JoinDictionaries(P0, {
						[p2.userId] = Immutable.JoinDictionaries(Entry, { displayName = p2.displayName })
					})
				end
			end
		elseif P0[p2.userId] then
			P0 = Immutable.RemoveFromDictionary(P0, p2.userId)
			
			return P0
		end
		return P0
	end
end