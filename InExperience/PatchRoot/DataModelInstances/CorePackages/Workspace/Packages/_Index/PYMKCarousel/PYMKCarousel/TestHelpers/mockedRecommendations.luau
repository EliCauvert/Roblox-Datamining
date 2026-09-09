local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local dependenciesModule = require(PYMKCarousel.dependencies)
local dash = dependenciesModule.Dash
local roduxFriends = dependenciesModule.RoduxFriends
local roduxUsers = dependenciesModule.RoduxUsers
local socialCommon = dependenciesModule.SocialCommon
local recommendation = roduxFriends.Models.Recommendation
local recommendationContextType = roduxFriends.Enums.RecommendationContextType
local user = roduxUsers.Models.User
local t = {
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
	recommendationIds = t,
	state = {
		LocalUserId = "123456",
		ScreenSize = Vector2.new(1920, 1080),
		TopBar = { topBarHeight = 10 },
		GlobalGuiInset = { bottom = 10 },
		PYMKCarousel = {
			NetworkStatus = {},
			Users = {
				byUserId = {
					[t.longName] = user.mock({ displayName = "Very Long Display Name" }),
					[t.noContext] = user.mock(),
					[t.mutualContextPlural] = user.mock(),
					[t.mutualContextSingle] = user.mock(),
					[t.mutualContextNone] = user.mock(),
					[t.frequentContext] = user.mock(),
					[t.pendingFriendRequest] = user.mock(),
					[t.incomingFriendRequest] = user.mock(),
					[t.contact] = user.mock()
				}
			},
			Friends = {
				recommendations = {
					bySource = {
						[socialCommon.Enums.RecommendationSourceEnum.HomepagePYMKCarousel] = {
							[t.longName] = true,
							[t.noContext] = true,
							[t.mutualContextPlural] = true,
							[t.mutualContextSingle] = true,
							[t.mutualContextNone] = true,
							[t.frequentContext] = true,
							[t.pendingFriendRequest] = true,
							[t.incomingFriendRequest] = true,
							[t.contact] = true
						}
					},
					byUserId = {
						["123456"] = {
							[t.longName] = recommendation.mock({ rank = 5, id = t.longName }),
							[t.noContext] = recommendation.mock({
								rank = 6,
								id = t.noContext,
								contextType = recommendationContextType.None
							}),
							[t.mutualContextPlural] = recommendation.mock({
								rank = 10,
								id = t.mutualContextPlural,
								contextType = recommendationContextType.MutualFriends,
								mutualFriendsList = { "111", "222", "333" }
							}),
							[t.mutualContextSingle] = recommendation.mock({
								rank = 12,
								id = t.mutualContextSingle,
								contextType = recommendationContextType.MutualFriends,
								mutualFriendsList = { "111" }
							}),
							[t.mutualContextNone] = recommendation.mock({
								rank = 1,
								id = t.mutualContextNone,
								contextType = recommendationContextType.MutualFriends,
								mutualFriendsList = {}
							}),
							[t.frequentContext] = recommendation.mock({
								rank = 0,
								id = t.frequentContext,
								contextType = recommendationContextType.Frequents,
								mutualFriendsList = {}
							}),
							[t.pendingFriendRequest] = recommendation.mock({ rank = 70, id = t.pendingFriendRequest }),
							[t.incomingFriendRequest] = recommendation.mock({ rank = 71, id = t.incomingFriendRequest }),
							[t.contact] = recommendation.new({
								rank = 80,
								entityId = "contact_entity_1",
								entityDisplayName = "Contact Display Name",
								id = t.contact,
								contextType = recommendationContextType.Contacts,
								thumbnailEntities = {
									avatarImageUrl = "https://example.com/contact-avatar.png",
									headshotImageUrl = ""
								}
							})
						}
					},
					hasIncomingFriendRequest = { [t.incomingFriendRequest] = true }
				},
				friendshipStatus = {
					[t.pendingFriendRequest] = Enum.FriendStatus.FriendRequestSent
				}
			},
			Analytics = {
				bySessionKey = {
					[require(PYMKCarousel.Common.Constants).RECOMMENDATION_SESSION_ID_KEY] = "mockedRecommendationSessionId"
				}
			},
			Presence = {
				byUserId = {
					[t.noContext] = {
						userPresenceType = require(PYMKCarousel.installReducer.RoduxPresence).Enums.PresenceType.Online
					}
				}
			}
		}
	},
	recommendationIdsList = dash.map(dash.values(t), function(p1)
		return { id = p1 }
	end)
}