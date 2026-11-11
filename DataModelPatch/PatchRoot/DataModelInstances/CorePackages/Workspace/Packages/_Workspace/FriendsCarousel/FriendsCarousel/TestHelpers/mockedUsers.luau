local FriendsCarousel = script:FindFirstAncestor("FriendsCarousel")
local DependenciesModule = require(FriendsCarousel.dependencies)
local PresenceType = DependenciesModule.RoduxPresence.Enums.PresenceType
local RecommendationContextType = DependenciesModule.RoduxFriends.Enums.RecommendationContextType
local _ = require(FriendsCarousel.Common.LocalTypes)

return {
	friendOnline = {
		id = "2326285850",
		username = "username",
		displayName = "name",
		userId = "friendOnline",
		isFriendWithUser = true,
		hasPendingFriendRequest = false,
		canSendFriendRequest = false,
		userPresenceType = PresenceType.Online
	},
	friendOffline = {
		id = "2326285850",
		username = "username",
		displayName = "friendOffline displayName",
		userId = "friendOffline",
		isFriendWithUser = true,
		hasPendingFriendRequest = false,
		canSendFriendRequest = false,
		userPresenceType = PresenceType.Offline
	},
	friendInGame = {
		id = "2326285850",
		username = "username",
		displayName = "friendInGame displayName",
		userId = "friendInGame",
		lastOnline = "lastOnline",
		lastLocation = "last Location very long name name name",
		universeId = "universeId",
		rootPlaceId = "rootPlaceId",
		placeId = "placeId",
		gameId = "gameId",
		isFriendWithUser = true,
		hasPendingFriendRequest = false,
		canSendFriendRequest = false,
		userPresenceType = PresenceType.InGame
	},
	friendInGameWithoutLocation = {
		id = "2326285850",
		username = "username",
		displayName = "friendInGameWithoutLocation displayName",
		userId = "friendInGameWithoutLocation",
		lastOnline = "lastOnline",
		lastLocation = nil,
		universeId = "universeId",
		rootPlaceId = "rootPlaceId",
		placeId = "placeId",
		gameId = "gameId",
		isFriendWithUser = true,
		hasPendingFriendRequest = false,
		canSendFriendRequest = false,
		userPresenceType = PresenceType.InGame
	},
	friendInStudio = {
		id = "2326285850",
		username = "username",
		displayName = "friendInStudio displayName",
		userId = "friendInStudio",
		isFriendWithUser = true,
		hasPendingFriendRequest = false,
		canSendFriendRequest = false,
		lastLocation = "In Studio location",
		userPresenceType = PresenceType.InStudio
	},
	recommendationMutual = {
		id = "2326285850",
		username = "username",
		displayName = "recommendationMutual displayName",
		rank = 1,
		isFriendWithUser = false,
		hasPendingFriendRequest = false,
		canSendFriendRequest = true,
		mutualFriendsList = { "1", "2", "3", "4" },
		contextType = RecommendationContextType.MutualFriends
	},
	recommendationMutualSingle = {
		id = "2326285850",
		username = "username",
		displayName = "recommendationMutual displayName",
		rank = 1,
		isFriendWithUser = false,
		hasPendingFriendRequest = false,
		canSendFriendRequest = true,
		mutualFriendsList = { "1" },
		contextType = RecommendationContextType.MutualFriends
	},
	recommendationMutualNone = {
		id = "2326285850",
		username = "username",
		displayName = "recommendationMutualNone displayName",
		rank = 1,
		isFriendWithUser = false,
		hasPendingFriendRequest = false,
		canSendFriendRequest = true,
		mutualFriendsList = {},
		contextType = RecommendationContextType.MutualFriends
	},
	recommendationNone = {
		id = "2326285850",
		username = "username2",
		displayName = "recommendationNone displayName",
		rank = 1,
		isFriendWithUser = false,
		hasPendingFriendRequest = false,
		canSendFriendRequest = true,
		mutualFriendsList = {},
		contextType = RecommendationContextType.None
	},
	requestPending = {
		id = "2326285850",
		username = "username",
		displayName = "requestPending displayName",
		rank = 0,
		isFriendWithUser = false,
		hasPendingFriendRequest = true,
		canSendFriendRequest = false,
		mutualFriendsList = { "1" },
		contextType = RecommendationContextType.MutualFriends
	},
	recommendationFrequent = {
		id = "2326285850",
		username = "username",
		displayName = "recommendationFrequent displayName",
		rank = 1,
		isFriendWithUser = false,
		hasPendingFriendRequest = false,
		canSendFriendRequest = true,
		mutualFriendsList = {},
		contextType = RecommendationContextType.Frequents
	},
	recommendationIncomingFriendRequest = {
		id = "2326285850",
		username = "username",
		displayName = "recommendationIncomingFriendRequest displayName",
		rank = 1,
		isFriendWithUser = false,
		hasPendingFriendRequest = false,
		canSendFriendRequest = false,
		hasIncomingFriendRequest = true,
		mutualFriendsList = { "1" },
		contextType = RecommendationContextType.MutualFriends
	},
	recommendationPlatformName = {
		id = "123",
		username = "username",
		displayName = "recommendationPlatformName displayName",
		rank = 1,
		isFriendWithUser = false,
		hasPendingFriendRequest = false,
		canSendFriendRequest = false,
		hasIncomingFriendRequest = true,
		mutualFriendsList = { "1" },
		contextType = RecommendationContextType.MutualFriends
	},
	recommendationContactImporter = {
		id = "Entity Id",
		entityId = "Entity Id",
		entityDisplayName = "Display Name",
		isFriendWithUser = false,
		rank = 1,
		contextType = RecommendationContextType.Contacts,
		thumbnailEntities = {
			avatarImageUrl = "avatarImageUrl",
			headshotImageUrl = "headshotImageUrl"
		}
	}
}