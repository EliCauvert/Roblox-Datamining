local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local DependenciesModule = require(PYMKCarousel.dependencies)
local Dash = DependenciesModule.Dash
local RoduxFriends = DependenciesModule.RoduxFriends
local Recommendation = RoduxFriends.Models.Recommendation
local RecommendationContextType = RoduxFriends.Enums.RecommendationContextType
local User = DependenciesModule.RoduxUsers.Models.User
local RecommendationIds = {
	longName = "1_longName",
	noContext = "2_noContext",
	mutualContextPlural = "3_mutualContextPlural",
	mutualContextSingle = "4_mutualContextSingle",
	mutualContextNone = "5_mutualContextNone",
	frequentContext = "6_frequentContext",
	pendingFriendRequest = "7_pendingFriendRequest",
	incomingFriendRequest = "8_incomingFriendRequest",
	contact = "9_contact"
}

return {
	recommendationIds = RecommendationIds,
	state = {
		LocalUserId = "123456",
		ScreenSize = Vector2.new(1920, 1080),
		TopBar = { topBarHeight = 10 },
		GlobalGuiInset = { bottom = 10 },
		PYMKCarousel = {
			NetworkStatus = {},
			Users = {
				byUserId = {
					[RecommendationIds.longName] = User.mock({ displayName = "Very Long Display Name" }),
					[RecommendationIds.noContext] = User.mock(),
					[RecommendationIds.mutualContextPlural] = User.mock(),
					[RecommendationIds.mutualContextSingle] = User.mock(),
					[RecommendationIds.mutualContextNone] = User.mock(),
					[RecommendationIds.frequentContext] = User.mock(),
					[RecommendationIds.pendingFriendRequest] = User.mock(),
					[RecommendationIds.incomingFriendRequest] = User.mock(),
					[RecommendationIds.contact] = User.mock()
				}
			},
			Friends = {
				recommendations = {
					bySource = {
						[DependenciesModule.SocialCommon.Enums.RecommendationSourceEnum.HomepagePYMKCarousel] = {
							[RecommendationIds.longName] = true,
							[RecommendationIds.noContext] = true,
							[RecommendationIds.mutualContextPlural] = true,
							[RecommendationIds.mutualContextSingle] = true,
							[RecommendationIds.mutualContextNone] = true,
							[RecommendationIds.frequentContext] = true,
							[RecommendationIds.pendingFriendRequest] = true,
							[RecommendationIds.incomingFriendRequest] = true,
							[RecommendationIds.contact] = true
						}
					},
					byUserId = {
						["123456"] = {
							[RecommendationIds.longName] = Recommendation.mock({ rank = 5, id = RecommendationIds.longName }),
							[RecommendationIds.noContext] = Recommendation.mock({
								rank = 6,
								id = RecommendationIds.noContext,
								contextType = RecommendationContextType.None
							}),
							[RecommendationIds.mutualContextPlural] = Recommendation.mock({
								rank = 10,
								id = RecommendationIds.mutualContextPlural,
								contextType = RecommendationContextType.MutualFriends,
								mutualFriendsList = { "111", "222", "333" }
							}),
							[RecommendationIds.mutualContextSingle] = Recommendation.mock({
								rank = 12,
								id = RecommendationIds.mutualContextSingle,
								contextType = RecommendationContextType.MutualFriends,
								mutualFriendsList = { "111" }
							}),
							[RecommendationIds.mutualContextNone] = Recommendation.mock({
								rank = 1,
								id = RecommendationIds.mutualContextNone,
								contextType = RecommendationContextType.MutualFriends,
								mutualFriendsList = {}
							}),
							[RecommendationIds.frequentContext] = Recommendation.mock({
								rank = 0,
								id = RecommendationIds.frequentContext,
								contextType = RecommendationContextType.Frequents,
								mutualFriendsList = {}
							}),
							[RecommendationIds.pendingFriendRequest] = Recommendation.mock({ rank = 70, id = RecommendationIds.pendingFriendRequest }),
							[RecommendationIds.incomingFriendRequest] = Recommendation.mock({ rank = 71, id = RecommendationIds.incomingFriendRequest }),
							[RecommendationIds.contact] = Recommendation.new({
								rank = 80,
								entityId = "contact_entity_1",
								entityDisplayName = "Contact Display Name",
								id = RecommendationIds.contact,
								contextType = RecommendationContextType.Contacts,
								thumbnailEntities = {
									avatarImageUrl = "https://example.com/contact-avatar.png",
									headshotImageUrl = ""
								}
							})
						}
					},
					hasIncomingFriendRequest = { [RecommendationIds.incomingFriendRequest] = true }
				},
				friendshipStatus = {
					[RecommendationIds.pendingFriendRequest] = Enum.FriendStatus.FriendRequestSent
				}
			},
			Analytics = {
				bySessionKey = {
					[require(PYMKCarousel.Common.Constants).RECOMMENDATION_SESSION_ID_KEY] = "mockedRecommendationSessionId"
				}
			},
			Presence = {
				byUserId = {
					[RecommendationIds.noContext] = {
						userPresenceType = require(PYMKCarousel.installReducer.RoduxPresence).Enums.PresenceType.Online
					}
				}
			}
		}
	},
	recommendationIdsList = Dash.map(Dash.values(RecommendationIds), function(Id) --[[ Line: 32 ]]
		return { id = Id }
	end)
}