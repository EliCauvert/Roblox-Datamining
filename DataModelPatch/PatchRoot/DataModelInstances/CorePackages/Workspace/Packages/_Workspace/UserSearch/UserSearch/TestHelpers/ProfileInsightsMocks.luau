local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local ProfilesInsightsQueryModule = require(UserSearch.Apollo.ProfilesInsightsQuery)
local _ = require(UserSearch.Common.LocalTypes)
local _ = require(Parent.ApolloClient)
local _ = require(Parent.GraphQLServer)
local FFlagPlayerSearchEnableOnlineFrequentsForAll = require(Parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequentsForAll
local Test = ProfilesInsightsQueryModule.createPageId("test")

return {
	mockProfileInsight = function(TargetUserId)
		return {
			__typename = "ProfileInsights",
			isOfflineFrequents = true,
			targetUserId = TargetUserId,
			mutualFriends = {}
		}
	end,
	mockProfileInsightWithMutualFriends = function(TargetUserId)
		return {
			__typename = "ProfileInsights",
			isOfflineFrequents = true,
			friendshipAgeUnixSeconds = 0,
			friendRequestOriginSource = 0,
			accountCreationDateUnixSeconds = 0,
			localizedCountryName = "test",
			userAgeVerifiedBracket = "",
			targetUserId = TargetUserId,
			mutualFriends = {
				{
					__typename = "MutualFriend",
					id = "234",
					username = "mockedUsername",
					displayName = "mockedDisplayName"
				}
			}
		}
	end,
	twoEntries = {
		searchKeyword = "test",
		users = { { id = "111" }, { id = "222" } },
		userIds = { "111", "222" },
		pageId = Test,
		response = {
			userInsights = {
				{
					targetUser = "111",
					profileInsights = {
						{
							mutualFriendInsight = {},
							offlineFrequentsInsight = { havePlayedTogether = true }
						}
					}
				},
				{
					targetUser = "222",
					profileInsights = {
						{
							mutualFriendInsight = {},
							offlineFrequentsInsight = { havePlayedTogether = true }
						}
					}
				}
			}
		},
		query = {
			variables = {
				userIds = { "111", "222" },
				pageId = Test,
				rankingStrategy = if FFlagPlayerSearchEnableOnlineFrequentsForAll then "profile_info_boost" else nil
			},
			query = ProfilesInsightsQueryModule.query,
			data = {
				profilesInsights = {
					__typename = "ProfileInsightsPages",
					id = Test,
					profileInsights = {
						{
							__typename = "ProfileInsights",
							targetUserId = "111",
							isOfflineFrequents = true,
							mutualFriends = {}
						},
						{
							__typename = "ProfileInsights",
							targetUserId = "222",
							isOfflineFrequents = true,
							mutualFriends = {}
						}
					}
				}
			}
		},
		usersMore = {
			{ id = "111" },
			{ id = "222" },
			{ id = "333" },
			{ id = "444" }
		},
		queryMore = {
			variables = {
				userIds = { "333", "444" },
				pageId = Test,
				rankingStrategy = if FFlagPlayerSearchEnableOnlineFrequentsForAll then "profile_info_boost" else nil
			},
			query = ProfilesInsightsQueryModule.query,
			data = {
				profilesInsights = {
					__typename = "ProfileInsightsPages",
					id = Test,
					profileInsights = {
						{
							__typename = "ProfileInsights",
							targetUserId = "333",
							isOfflineFrequents = true,
							mutualFriends = {}
						},
						{
							__typename = "ProfileInsights",
							targetUserId = "444",
							isOfflineFrequents = true,
							mutualFriends = {}
						}
					}
				}
			}
		},
		userIdsMore = { "333", "444" }
	}
}