local UserSearch = script:FindFirstAncestor("UserSearch")
local ProfileInsightsMocksModule = require(UserSearch.TestHelpers.ProfileInsightsMocks)
local PresenceType = require(UserSearch.Rodux.RoduxPresence).Enums.PresenceType
local ContextualInfoTypes = require(UserSearch.Parent.SocialCommon).Enums.ContextualInfoTypes

local function _(p1, UserPresenceType)
	-- upvalues: PresenceType (copy)
	return {
		lastLocation = "MockLastLocation",
		lastOnline = "2022-05-08T22:44:25.08Z",
		gameInstanceId = nil,
		placeId = nil,
		rootPlaceId = nil,
		userPresenceType = UserPresenceType,
		userId = tonumber(p1),
		universeId = if UserPresenceType == PresenceType.InGame then 123 else nil
	}
end

local Ids = {
	yourself = "1111",
	following = "2222",
	friend = "3333",
	incomingFriendship = "4444",
	compactTileIncomingFriendship = "4444",
	outgoingFriendship = "5555",
	compactTileOutgoingFriendship = "5555",
	previousUserName = "6666",
	random = "7777",
	notFriend = "8888",
	mutualFriends = "9999",
	compactTileMutualFriends = "9999",
	frequents = "101010",
	friendInGame = "111111",
	friendInStudio = "121212"
}
local Offline = PresenceType.Offline
local config = {
	lastLocation = "MockLastLocation",
	lastOnline = "2022-05-08T22:44:25.08Z",
	gameInstanceId = nil,
	placeId = nil,
	rootPlaceId = nil,
	userPresenceType = Offline,
	userId = tonumber(Ids.yourself),
	universeId = if Offline == PresenceType.InGame then 123 else nil
}
local Offline1 = PresenceType.Offline
local config1 = {
	lastLocation = "MockLastLocation",
	lastOnline = "2022-05-08T22:44:25.08Z",
	gameInstanceId = nil,
	placeId = nil,
	rootPlaceId = nil,
	userPresenceType = Offline1,
	userId = tonumber(Ids.following),
	universeId = if Offline1 == PresenceType.InGame then 123 else nil
}
local Online = PresenceType.Online
local config2 = {
	lastLocation = "MockLastLocation",
	lastOnline = "2022-05-08T22:44:25.08Z",
	gameInstanceId = nil,
	placeId = nil,
	rootPlaceId = nil,
	userPresenceType = Online,
	userId = tonumber(Ids.friend),
	universeId = if Online == PresenceType.InGame then 123 else nil
}
local Offline2 = PresenceType.Offline
local config3 = {
	lastLocation = "MockLastLocation",
	lastOnline = "2022-05-08T22:44:25.08Z",
	gameInstanceId = nil,
	placeId = nil,
	rootPlaceId = nil,
	userPresenceType = Offline2,
	userId = tonumber(Ids.incomingFriendship),
	universeId = if Offline2 == PresenceType.InGame then 123 else nil
}
local Offline3 = PresenceType.Offline
local config4 = {
	lastLocation = "MockLastLocation",
	lastOnline = "2022-05-08T22:44:25.08Z",
	gameInstanceId = nil,
	placeId = nil,
	rootPlaceId = nil,
	userPresenceType = Offline3,
	userId = tonumber(Ids.compactTileIncomingFriendship),
	universeId = if Offline3 == PresenceType.InGame then 123 else nil
}
local Offline4 = PresenceType.Offline
local config5 = {
	lastLocation = "MockLastLocation",
	lastOnline = "2022-05-08T22:44:25.08Z",
	gameInstanceId = nil,
	placeId = nil,
	rootPlaceId = nil,
	userPresenceType = Offline4,
	userId = tonumber(Ids.outgoingFriendship),
	universeId = if Offline4 == PresenceType.InGame then 123 else nil
}
local Offline5 = PresenceType.Offline
local config6 = {
	lastLocation = "MockLastLocation",
	lastOnline = "2022-05-08T22:44:25.08Z",
	gameInstanceId = nil,
	placeId = nil,
	rootPlaceId = nil,
	userPresenceType = Offline5,
	userId = tonumber(Ids.previousUserName),
	universeId = if Offline5 == PresenceType.InGame then 123 else nil
}
local Offline6 = PresenceType.Offline
local config7 = {
	lastLocation = "MockLastLocation",
	lastOnline = "2022-05-08T22:44:25.08Z",
	gameInstanceId = nil,
	placeId = nil,
	rootPlaceId = nil,
	userPresenceType = Offline6,
	userId = tonumber(Ids.random),
	universeId = if Offline6 == PresenceType.InGame then 123 else nil
}
local Offline7 = PresenceType.Offline
local config8 = {
	lastLocation = "MockLastLocation",
	lastOnline = "2022-05-08T22:44:25.08Z",
	gameInstanceId = nil,
	placeId = nil,
	rootPlaceId = nil,
	userPresenceType = Offline7,
	userId = tonumber(Ids.notFriend),
	universeId = if Offline7 == PresenceType.InGame then 123 else nil
}
local Offline8 = PresenceType.Offline
local config9 = {
	lastLocation = "MockLastLocation",
	lastOnline = "2022-05-08T22:44:25.08Z",
	gameInstanceId = nil,
	placeId = nil,
	rootPlaceId = nil,
	userPresenceType = Offline8,
	userId = tonumber(Ids.mutualFriends),
	universeId = if Offline8 == PresenceType.InGame then 123 else nil
}
local Offline9 = PresenceType.Offline
local config10 = {
	lastLocation = "MockLastLocation",
	lastOnline = "2022-05-08T22:44:25.08Z",
	gameInstanceId = nil,
	placeId = nil,
	rootPlaceId = nil,
	userPresenceType = Offline9,
	userId = tonumber(Ids.compactTileMutualFriends),
	universeId = if Offline9 == PresenceType.InGame then 123 else nil
}
local Offline10 = PresenceType.Offline
local config11 = {
	lastLocation = "MockLastLocation",
	lastOnline = "2022-05-08T22:44:25.08Z",
	gameInstanceId = nil,
	placeId = nil,
	rootPlaceId = nil,
	userPresenceType = Offline10,
	userId = tonumber(Ids.frequents),
	universeId = if Offline10 == PresenceType.InGame then 123 else nil
}
local InGame = PresenceType.InGame
local config12 = {
	lastLocation = "MockLastLocation",
	lastOnline = "2022-05-08T22:44:25.08Z",
	gameInstanceId = nil,
	placeId = nil,
	rootPlaceId = nil,
	userPresenceType = InGame,
	userId = tonumber(Ids.friendInGame),
	universeId = if InGame == PresenceType.InGame then 123 else nil
}
local InStudio = PresenceType.InStudio

return {
	ids = Ids,
	state = {
		LocalUserId = Ids.yourself,
		UserSearch = {
			NetworkStatus = {},
			Friends = {
				friendshipStatus = {
					[Ids.friend] = Enum.FriendStatus.Friend,
					[Ids.incomingFriendship] = Enum.FriendStatus.FriendRequestReceived,
					[Ids.compactTileIncomingFriendship] = Enum.FriendStatus.FriendRequestReceived,
					[Ids.outgoingFriendship] = Enum.FriendStatus.FriendRequestSent,
					[Ids.compactTileOutgoingFriendship] = Enum.FriendStatus.FriendRequestSent,
					[Ids.notFriend] = Enum.FriendStatus.NotFriend,
					[Ids.mutualFriends] = Enum.FriendStatus.NotFriend,
					[Ids.compactTileMutualFriends] = Enum.FriendStatus.NotFriend,
					[Ids.frequents] = Enum.FriendStatus.NotFriend,
					[Ids.friendInGame] = Enum.FriendStatus.Friend,
					[Ids.friendInStudio] = Enum.FriendStatus.Friend
				},
				followings = {
					followingStatuses = {
						[Ids.following] = { isFollowing = true, isFollowed = false }
					}
				}
			},
			Presence = {
				byUserId = {
					[Ids.yourself] = config,
					[Ids.following] = config1,
					[Ids.friend] = config2,
					[Ids.incomingFriendship] = config3,
					[Ids.compactTileIncomingFriendship] = config4,
					[Ids.outgoingFriendship] = config5,
					[Ids.previousUserName] = config6,
					[Ids.random] = config7,
					[Ids.notFriend] = config8,
					[Ids.mutualFriends] = config9,
					[Ids.compactTileMutualFriends] = config10,
					[Ids.frequents] = config11,
					[Ids.friendInGame] = config12,
					[Ids.friendInStudio] = {
						lastLocation = "MockLastLocation",
						lastOnline = "2022-05-08T22:44:25.08Z",
						gameInstanceId = nil,
						placeId = nil,
						rootPlaceId = nil,
						userPresenceType = InStudio,
						userId = tonumber(Ids.friendInStudio),
						universeId = if InStudio == PresenceType.InGame then 123 else nil
					}
				}
			}
		}
	},
	users = {
		yourself = { id = Ids.yourself },
		following = { id = Ids.following },
		friend = { id = Ids.friend },
		incomingFriendship = { id = Ids.incomingFriendship },
		compactTileIncomingFriendship = { id = Ids.compactTileIncomingFriendship },
		outgoingFriendship = { id = Ids.outgoingFriendship },
		compactTileOutgoingFriendship = { id = Ids.compactTileOutgoingFriendship },
		previousUserName = {
			id = Ids.previousUserName,
			previousUsernames = { "random1", "random1", "searchKeyword" }
		},
		random = { id = Ids.random },
		notFriend = { id = Ids.notFriend },
		mutualFriends = {
			id = Ids.mutualFriends,
			profileInsight = ProfileInsightsMocksModule.mockProfileInsightWithMutualFriends(Ids.mutualFriends)
		},
		frequents = {
			id = Ids.frequents,
			profileInsight = ProfileInsightsMocksModule.mockProfileInsight(Ids.frequents)
		},
		friendInGame = { id = Ids.friendInGame },
		friendInStudio = { id = Ids.friendInStudio }
	},
	contextualInfoType = {
		incomingFriendship = nil,
		compactTileIncomingFriendship = nil,
		outgoingFriendship = nil,
		random = nil,
		notFriend = nil,
		yourself = ContextualInfoTypes.IsMyself,
		following = ContextualInfoTypes.Following,
		friend = ContextualInfoTypes.Friend,
		previousUserName = ContextualInfoTypes.PreviousUsername,
		mutualFriends = ContextualInfoTypes.MutualFriends,
		compactTileMutualFriends = ContextualInfoTypes.MutualFriends,
		frequents = ContextualInfoTypes.Frequents,
		friendInGame = ContextualInfoTypes.ExperienceLastLocation,
		friendInStudio = ContextualInfoTypes.Friend
	}
}