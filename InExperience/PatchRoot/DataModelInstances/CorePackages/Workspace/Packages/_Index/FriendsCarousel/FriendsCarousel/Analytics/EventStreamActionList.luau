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

local var7 = function(p0) --[[ line: 20 ]]
	return p0
end

return {
	[eventNamesModule.CarouselLoadedWithUsers] = {
		context = contexts.HomePage,
		eventType = eventTypes.FriendsCarouselLoaded,
		additionalInfo = {
			source = constantsModule.HomepageFriendsCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			friendCount = var7,
			recommendationCount = var7,
			recommendationLimit = getFIntShowFriendRecommendationsLimitModule,
			refreshCount = var7,
			experimentLayerStatus = var7,
			fetchedRecommendations = var7,
			recommendationSessionId = var7
		}
	},
	[eventNamesModule.UserSeen] = {
		context = contexts.HomePage,
		eventType = eventTypes.UserSeen,
		additionalInfo = {
			source = constantsModule.HomepageFriendsCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = var7,
			recommendationContextType = formatRecommendationContextType,
			friendStatus = formatFriendStatusModule,
			isRecommendation = var7,
			presence = formatPresence,
			recommendationRank = var7,
			userId = var7,
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
			absolutePosition = var7,
			recommendationContextType = formatRecommendationContextType,
			friendId = var7,
			friendStatus = formatFriendStatusModule,
			isRecommendation = var7,
			recommendationRank = var7,
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
			absolutePosition = var7,
			recommendationContextType = formatRecommendationContextType,
			recommendationRank = var7,
			requestedId = var7
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
			absolutePosition = var7,
			recommendationContextType = formatRecommendationContextType,
			recommendationRank = var7,
			requestedId = var7
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
			friendCount = var7,
			recommendationLimit = getFIntShowFriendRecommendationsLimitModule,
			recommendationCount = var7
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
			friendCount = var7,
			recommendationLimit = getFIntShowFriendRecommendationsLimitModule,
			recommendationCount = var7,
			requestCount = var7,
			showContactImporterModal = var7
		}
	},
	[eventNamesModule.CarouselLoadingTime] = {
		context = contexts.HomePage,
		eventType = eventTypes.CarouselLoadingTime,
		additionalInfo = {
			source = constantsModule.HomepageFriendsCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			carouselFetchingStatus = var7,
			friendsFetchingStatus = var7,
			recommendationFetchingStatus = var7,
			loadingTime = var7,
			reachedThreshold = var7,
			loadingThreshold = var7,
			experimentLayerStatus = var7,
			isLegacyCarousel = var7
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
			status = var7,
			loadingTime = var7,
			loadingThreshold = var7,
			nextPage = var7,
			fetch = var7
		},
		additionalInfo = {
			source = constantsModule.HomepageFriendsCarouselSourceName
		}
	},
	[eventNamesModule.FriendsEndpointLoadingTime] = {
		context = contexts.HomePage,
		eventType = eventTypes.LoadingTime,
		formatRulesForAdditionalInfo = {
			status = var7,
			loadingTime = var7,
			loadingThreshold = var7,
			nextPage = var7,
			fetch = var7
		},
		additionalInfo = {
			source = constantsModule.HomepageFriendsCarouselSourceName
		}
	},
	[eventNamesModule.FriendsCarouselUILoadingTime] = {
		context = contexts.HomePage,
		eventType = eventTypes.LoadingTime,
		formatRulesForAdditionalInfo = {
			status = var7,
			fetch = var7,
			loadingTime = var7,
			loadingThreshold = var7,
			nextPage = var7
		},
		additionalInfo = {
			source = constantsModule.HomepageFriendsCarouselSourceName
		}
	}
}