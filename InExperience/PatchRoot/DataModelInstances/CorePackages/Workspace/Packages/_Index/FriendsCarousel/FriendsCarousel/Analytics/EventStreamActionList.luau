local parent = script.Parent.Parent
local eventNamesModule = require(script.Parent.EventNames)
local socialLuaAnalyticsModule = require(parent.Parent.SocialLuaAnalytics)
local enums = socialLuaAnalyticsModule.Analytics.Enums
local contexts = enums.Contexts
local eventTypes = enums.EventTypes
local btnValuesModule = require(script.Parent.BtnValues)
local constantsModule = require(parent.Common.Constants)
local formatFriendStatusModule = require(script.Parent.formatFriendStatus)
local getUniverseIdFromUserModule = require(script.Parent.getUniverseIdFromUser)
local formatRecommendationContextType = socialLuaAnalyticsModule.Analytics.Formatters.formatRecommendationContextType
local formatPresence = socialLuaAnalyticsModule.Analytics.Formatters.formatPresence
local getFIntShowFriendRecommendationsLimitModule = require(parent.Flags.getFIntShowFriendRecommendationsLimit)

local var1 = function(p1)
	return p1
end

return {
	[eventNamesModule.CarouselLoadedWithUsers] = {
		context = contexts.HomePage,
		eventType = eventTypes.FriendsCarouselLoaded,
		additionalInfo = {
			source = constantsModule.HomepageFriendsCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			friendCount = var1,
			recommendationCount = var1,
			recommendationLimit = getFIntShowFriendRecommendationsLimitModule,
			refreshCount = var1,
			experimentLayerStatus = var1,
			fetchedRecommendations = var1,
			recommendationSessionId = var1
		}
	},
	[eventNamesModule.UserSeen] = {
		context = contexts.HomePage,
		eventType = eventTypes.UserSeen,
		additionalInfo = {
			source = constantsModule.HomepageFriendsCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = var1,
			recommendationContextType = formatRecommendationContextType,
			friendStatus = formatFriendStatusModule,
			isRecommendation = var1,
			presence = formatPresence,
			recommendationRank = var1,
			userId = var1,
			universeId = getUniverseIdFromUserModule
		}
	},
	[eventNamesModule.UserPressed] = {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = btnValuesModule.OpenPeopleList,
			source = constantsModule.HomepageFriendsCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = var1,
			recommendationContextType = formatRecommendationContextType,
			friendId = var1,
			friendStatus = formatFriendStatusModule,
			isRecommendation = var1,
			recommendationRank = var1,
			universeId = getUniverseIdFromUserModule,
			presence = formatPresence
		}
	},
	[eventNamesModule.RequestFriendship] = {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = btnValuesModule.RequestFriendship,
			source = constantsModule.HomepageFriendsCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = var1,
			recommendationContextType = formatRecommendationContextType,
			recommendationRank = var1,
			requestedId = var1
		}
	},
	[eventNamesModule.RevokeFriendRequest] = {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = btnValuesModule.RevokeFriendRequest,
			source = constantsModule.HomepageFriendsCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = var1,
			recommendationContextType = formatRecommendationContextType,
			recommendationRank = var1,
			requestedId = var1
		}
	},
	[eventNamesModule.ViewAllFriends] = {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = btnValuesModule.FriendsLanding,
			source = constantsModule.HomepageFriendsCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			friendCount = var1,
			recommendationLimit = getFIntShowFriendRecommendationsLimitModule,
			recommendationCount = var1
		}
	},
	[eventNamesModule.ViewAddFriends] = {
		context = contexts.AddFriends,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			absolutePosition = 1,
			btn = btnValuesModule.AddFriendsButton,
			source = constantsModule.HomepageFriendsCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			friendCount = var1,
			recommendationLimit = getFIntShowFriendRecommendationsLimitModule,
			recommendationCount = var1,
			requestCount = var1,
			showContactImporterModal = var1
		}
	},
	[eventNamesModule.CarouselLoadingTime] = {
		context = contexts.HomePage,
		eventType = eventTypes.CarouselLoadingTime,
		additionalInfo = {
			source = constantsModule.HomepageFriendsCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			carouselFetchingStatus = var1,
			friendsFetchingStatus = var1,
			recommendationFetchingStatus = var1,
			loadingTime = var1,
			reachedThreshold = var1,
			loadingThreshold = var1,
			experimentLayerStatus = var1,
			isLegacyCarousel = var1
		}
	},
	[eventNamesModule.ContactImporterOnAddFriends] = {
		context = contexts.HomePage,
		eventType = eventTypes.ContactImporterOnAddFriends,
		additionalInfo = { isLegacyAddFriends = false }
	},
	[eventNamesModule.PaginatedFriendsCarouselLoadingTime] = {
		context = contexts.HomePage,
		eventType = eventTypes.LoadingTime,
		formatRulesForAdditionalInfo = {
			status = var1,
			loadingTime = var1,
			loadingThreshold = var1,
			nextPage = var1,
			fetch = var1
		},
		additionalInfo = {
			source = constantsModule.HomepageFriendsCarouselSourceName
		}
	},
	[eventNamesModule.FriendsEndpointLoadingTime] = {
		context = contexts.HomePage,
		eventType = eventTypes.LoadingTime,
		formatRulesForAdditionalInfo = {
			status = var1,
			loadingTime = var1,
			loadingThreshold = var1,
			nextPage = var1,
			fetch = var1
		},
		additionalInfo = {
			source = constantsModule.HomepageFriendsCarouselSourceName
		}
	},
	[eventNamesModule.FriendsCarouselUILoadingTime] = {
		context = contexts.HomePage,
		eventType = eventTypes.LoadingTime,
		formatRulesForAdditionalInfo = {
			status = var1,
			fetch = var1,
			loadingTime = var1,
			loadingThreshold = var1,
			nextPage = var1
		},
		additionalInfo = {
			source = constantsModule.HomepageFriendsCarouselSourceName
		}
	}
}