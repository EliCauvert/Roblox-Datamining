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
	convertGraphQlOnlineFriendsToPresenceApiFormat = function(List) --[[ Line: 100 ]]
		local List1 = {}
		local SortScores = {}
		
		for _, value in List do
			local Id = value.id
			local Presence = value.presence
			table.insert(List1, {
				userId = Id,
				userPresenceType = Presence.userPresenceType,
				lastLocation = Presence.lastLocation,
				lastOnline = Presence.lastOnline,
				gameId = Presence.gameId,
				placeId = Presence.placeId,
				rootPlaceId = Presence.rootPlaceId,
				universeId = Presence.universeId
			})
			SortScores[Id] = value.sortScore
		end
		return List1, SortScores
	end,
	convertGraphQlOnlineFriendsToExectedSignalFormat = function(List) --[[ Line: 123 ]]
		local List1 = {}
		
		for _, value in List do
			local Id = value.id
			local Presence = value.presence
			table.insert(List1, {
				id = Id,
				sortScore = value.sortScore,
				presence = {
					id = Id,
					userPresenceType = Presence.userPresenceType,
					lastLocation = Presence.lastLocation,
					lastOnline = Presence.lastOnline,
					gameId = Presence.gameId,
					placeId = Presence.placeId,
					rootPlaceId = Presence.rootPlaceId,
					universeId = Presence.universeId
				}
			})
		end
		return List1
	end
}