local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local recommendationContextType = require(PYMKCarousel.dependencies).RoduxFriends.Enums.RecommendationContextType
local _ = require(PYMKCarousel.Common.OmniTypes)
local constantsModule = require(PYMKCarousel.Common.Constants)
local t = {
	topicId = "topicId3",
	treatmentType = "FriendRecommendationCarousel",
	topic = "",
	recommendations = {
		[1] = {
			contentId = "RecommendedFriend1",
			contentType = "RecommendedFriend",
			contentMetadata = {
				rank = "10",
				recommendationRequestId = "recommendationSessionId",
				hasPendingFriendRequest = constantsModule.BE_FALSE_VALUE
			}
		},
		[2] = {
			contentId = "RecommendedFriend2",
			contentType = "RecommendedFriend",
			contentMetadata = {
				rank = "5",
				mutualFriendsCount = "5",
				recommendationRequestId = "recommendationSessionId",
				contextType = recommendationContextType.MutualFriends.rawValue(),
				hasPendingFriendRequest = constantsModule.BE_TRUE_VALUE
			}
		},
		[3] = {
			contentId = "RecommendedFriend3",
			contentType = "RecommendedFriend",
			contentMetadata = {
				rank = "8",
				recommendationRequestId = "recommendationSessionId",
				contextType = recommendationContextType.Frequents.rawValue(),
				hasPendingFriendRequest = constantsModule.BE_FALSE_VALUE
			}
		},
		[4] = {
			contentStringId = "RecommendedFriend4",
			contentId = "",
			contentType = "RecommendedFriend",
			contentMetadata = {
				rank = "1",
				recommendationRequestId = "recommendationSessionId",
				contextType = recommendationContextType.Contacts.rawValue(),
				hasPendingFriendRequest = constantsModule.BE_FALSE_VALUE
			}
		}
	}
}
local t_1 = {
	RecommendedFriend1 = {
		userName = "userName1",
		displayName = "displayName1",
		userId = "RecommendedFriend1",
		mutualFriendDisplayName = {},
		contextType = recommendationContextType.Frequents.rawValue()
	},
	RecommendedFriend2 = {
		userName = "userName2",
		displayName = "displayName2",
		userId = "RecommendedFriend2",
		mutualFriendDisplayName = {},
		contextType = recommendationContextType.None.rawValue()
	},
	RecommendedFriend3 = {
		userName = "userName3",
		displayName = "displayName3",
		userId = "RecommendedFriend3",
		contextType = "NotCorrect",
		mutualFriendDisplayName = {}
	},
	RecommendedFriend4 = {
		AvatarThumbnailUrl = "AvatarImageUrl",
		ContactId = "ContactId",
		ContactName = "ContactName",
		HeadshotThumbnailUrl = "HeadshotImageUrl",
		userId = "0",
		contextType = recommendationContextType.Contacts.rawValue(),
		mutualFriendDisplayName = {}
	}
}
local t_2 = {
	[1] = {
		topicId = "topicId1",
		treatmentType = "Carousel",
		topic = "TopicGames1",
		recommendations = {
			[1] = {
				contentId = "Game1",
				contentType = "Game",
				contentMetadata = {}
			},
			[2] = {
				contentId = "Game2",
				contentType = "Game",
				contentMetadata = {}
			}
		}
	},
	[2] = {
		topicId = "topicId2",
		treatmentType = "Carousel",
		topic = "TopicGames2",
		recommendations = {
			[1] = {
				contentId = "Game3",
				contentType = "Game",
				contentMetadata = {}
			}
		}
	}
}
local t_3 = {
	Game1 = {
		universeId = "universeId1",
		name = "name1",
		totalUpVotes = 123,
		totalDownVotes = 123,
		placeId = "placeId1",
		playerCount = 123
	},
	Game2 = {
		universeId = "universeId2",
		name = "name2",
		totalUpVotes = 123,
		totalDownVotes = 123,
		placeId = "placeId2",
		playerCount = 123
	},
	Game3 = {
		universeId = "universeId3",
		name = "name3",
		totalUpVotes = 123,
		totalDownVotes = 123,
		placeId = "placeId3",
		playerCount = 123
	}
}

return {
	withoutContent = {
		type = "AddOmniRecommendations",
		recommendationsId = "recommendationsId",
		pageType = "Home",
		sortsExpirationTime = 2434324,
		recommendations = {}
	},
	withRecommendedFriends = {
		type = "AddOmniRecommendations",
		recommendationsId = "recommendationsId",
		pageType = "Home",
		sortsExpirationTime = 2434324,
		recommendations = {
			Home = {
				omniSessionId = "omniSessionId1",
				sorts = { [1] = t_2[1], [2] = t_2[2], [3] = t },
				metadata = {
					CatalogAsset = {},
					CatalogBundle = {},
					RecommendedFriend = t_1,
					Game = t_3
				}
			}
		}
	},
	withoutRecommendedFriends = {
		type = "AddOmniRecommendations",
		recommendationsId = "recommendationsId",
		pageType = "Home",
		sortsExpirationTime = 2434324,
		recommendations = {
			Home = {
				omniSessionId = "omniSessionId1",
				sorts = { [1] = t_2[1], [2] = t_2[2] },
				metadata = {
					CatalogAsset = {},
					CatalogBundle = {},
					RecommendedFriend = {},
					Game = t_3
				}
			}
		}
	},
	invalidRecommendedFriendsSort = {
		type = "AddOmniRecommendations",
		recommendationsId = "recommendationsId",
		pageType = "Home",
		sortsExpirationTime = 2434324,
		recommendations = {
			Home = {
				omniSessionId = "omniSessionId1",
				sorts = {
					[1] = t_2[1],
					[2] = t_2[2],
					[3] = {
						topicId = "topicId3",
						treatmentType = "FriendRecommendationCarousel",
						topic = "",
						recommendations = nil
					}
				},
				metadata = {
					CatalogAsset = {},
					CatalogBundle = {},
					RecommendedFriend = {},
					Game = t_3
				}
			}
		}
	},
	recommendedFriendMetadata = t_1,
	recommendedFriendSort = t
}