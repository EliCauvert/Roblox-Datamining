return {
	localUserId = "1",
	offlineFriend = {
		__typename = "Friend",
		id = "2",
		hasVerifiedBadge = false,
		targetUserId = "1"
	},
	onlineFriend = {
		__typename = "Friend",
		id = "5",
		targetUserId = "1",
		sortScore = 20.4,
		presence = {
			__typename = "UserPresence",
			id = "5",
			userPresenceType = "Online",
			lastLocation = "Website",
			lastOnline = "time3",
			gameId = "",
			placeId = "",
			rootPlaceId = "",
			universeId = ""
		}
	},
	inGameFriend = {
		__typename = "Friend",
		id = "3",
		targetUserId = "1",
		sortScore = 30.3,
		presence = {
			__typename = "UserPresence",
			id = "3",
			userPresenceType = "InGame",
			lastLocation = "location",
			lastOnline = "time",
			gameId = "game-id",
			placeId = "123",
			rootPlaceId = "456",
			universeId = "789"
		}
	},
	inStudioFriend = {
		__typename = "Friend",
		id = "4",
		targetUserId = "1",
		sortScore = 10.5,
		presence = {
			__typename = "UserPresence",
			id = "4",
			userPresenceType = "InStudio",
			lastLocation = "Studio",
			lastOnline = "time2",
			gameId = "",
			placeId = "",
			rootPlaceId = "",
			universeId = ""
		}
	},
	inGameFriendNoUniverseId = {
		__typename = "Friend",
		id = "6",
		targetUserId = "1",
		sortScore = 20.3,
		presence = {
			__typename = "UserPresence",
			id = "6",
			userPresenceType = "InGame",
			lastLocation = "",
			lastOnline = "time4",
			gameId = "",
			placeId = "",
			rootPlaceId = "",
			universeId = ""
		}
	},
	inGameFriendLowerSortScore = {
		__typename = "Friend",
		id = "7",
		targetUserId = "1",
		sortScore = 30.1,
		presence = {
			__typename = "UserPresence",
			id = "3",
			userPresenceType = "InGame",
			lastLocation = "location",
			lastOnline = "time",
			gameId = "game-id",
			placeId = "123",
			rootPlaceId = "456",
			universeId = "789"
		}
	},
	convertGraphQlOnlineFriendsToPresenceApiFormat = function(p0)
		local t = {}
		local t_1 = {}
		
		for i, v in p0 do
			local id = v.id
			local presence = v.presence
			table.insert(t, {
				userId = id,
				userPresenceType = presence.userPresenceType,
				lastLocation = presence.lastLocation,
				lastOnline = presence.lastOnline,
				gameId = presence.gameId,
				placeId = presence.placeId,
				rootPlaceId = presence.rootPlaceId,
				universeId = presence.universeId
			})
			t_1[id] = v.sortScore
		end
		return t, t_1
	end,
	convertGraphQlOnlineFriendsToExectedSignalFormat = function(value)
		local t = {}
		
		for i, v in value do
			local id = v.id
			local presence = v.presence
			table.insert(t, {
				id = id,
				sortScore = v.sortScore,
				presence = {
					id = id,
					userPresenceType = presence.userPresenceType,
					lastLocation = presence.lastLocation,
					lastOnline = presence.lastOnline,
					gameId = presence.gameId,
					placeId = presence.placeId,
					rootPlaceId = presence.rootPlaceId,
					universeId = presence.universeId
				}
			})
		end
		return t
	end
}