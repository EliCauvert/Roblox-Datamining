local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local formatRecommendationContextType = socialLuaAnalyticsModule.Analytics.Formatters.formatRecommendationContextType
local enums = socialLuaAnalyticsModule.Analytics.Enums
local contexts = enums.Contexts
local eventTypes = enums.EventTypes
local eventNamesModule = require(script.Parent.EventNames)
local constantsModule = require(socialCarousel.Common.Constants)
local fIntSocialCarouselShowRecsLimit = require(socialCarousel.Flags).FIntSocialCarouselShowRecsLimit
local fFlagLuaAppAddSortDataToSocialCarouselClicks = require(parent.SharedFlags).FFlagLuaAppAddSortDataToSocialCarouselClicks

local var4 = function(p0) --[[ line: 17 ]]
	return p0
end

return {
	[eventNamesModule.UserPressed] = {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = constantsModule.ANALYTICS.BTN_VALUES.OPEN_PEOPLE_LIST,
			contentType = if fFlagLuaAppAddSortDataToSocialCarouselClicks then constantsModule.ANALYTICS.CONTENT_TYPE else nil,
			actionType = if fFlagLuaAppAddSortDataToSocialCarouselClicks then constantsModule.ANALYTICS.ACTION_TYPES.OPEN_PROFILE else nil
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = var4,
			positionInRow = if fFlagLuaAppAddSortDataToSocialCarouselClicks then var4 else nil,
			recommendationContextType = formatRecommendationContextType,
			friendId = var4,
			friendStatus = var4,
			isRecommendation = var4,
			recommendationRank = var4,
			universeId = var4,
			presence = var4,
			source = var4,
			interactionUuid = var4
		}
	},
	[eventNamesModule.UserSeen] = {
		context = contexts.HomePage,
		eventType = eventTypes.UserSeen,
		formatRulesForAdditionalInfo = {
			userId = var4,
			presence = var4,
			absolutePosition = var4,
			recommendationRank = var4,
			friendStatus = var4,
			recommendationContextType = formatRecommendationContextType,
			isRecommendation = var4,
			source = var4,
			universeId = var4
		}
	},
	[eventNamesModule.ViewAddFriends] = {
		context = contexts.AddFriends,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = constantsModule.ANALYTICS.BTN_VALUES.ADD_FRIENDS,
			absolutePosition = var4,
			positionInRow = var4,
			contentType = constantsModule.ANALYTICS.CONTENT_TYPE,
			actionType = constantsModule.ANALYTICS.ACTION_TYPES.OPEN_ADD_FRIENDS
		},
		formatRulesForAdditionalInfo = {
			friendCount = var4,
			recommendationLimit = fIntSocialCarouselShowRecsLimit,
			recommendationCount = var4,
			requestCount = var4,
			source = var4,
			interactionUuid = var4
		}
	},
	[eventNamesModule.ViewAllFriends] = {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = constantsModule.ANALYTICS.BTN_VALUES.VIEW_ALL_FRIENDS
		},
		formatRulesForAdditionalInfo = {
			friendCount = var4,
			recommendationLimit = fIntSocialCarouselShowRecsLimit,
			recommendationCount = var4,
			source = var4
		}
	},
	[eventNamesModule.FriendsCarouselUILoadingTime] = {
		context = contexts.HomePage,
		eventType = eventTypes.LoadingTime,
		formatRulesForAdditionalInfo = {
			status = var4,
			fetch = var4,
			loadingTime = var4,
			loadingThreshold = var4,
			nextPage = var4,
			source = var4
		},
		additionalInfo = {}
	},
	[eventNamesModule.StartSquadPressed] = {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = constantsModule.ANALYTICS.BTN_VALUES.START_SQUAD },
		formatRulesForAdditionalInfo = { absolutePosition = var4, source = var4 }
	},
	[eventNamesModule.ShareQRPressed] = if require(parent.SharedFlags).FFlagSocialCarouselShareQREnabled then {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = constantsModule.ANALYTICS.BTN_VALUES.SHARE_QR },
		formatRulesForAdditionalInfo = { absolutePosition = var4, source = var4 }
	} else nil,
	[eventNamesModule.TilesSeenCollection] = {
		context = contexts.HomePage,
		eventType = eventTypes.UserSeenCollection,
		formatRulesForAdditionalInfo = {
			userId = var4,
			absolutePosition = var4,
			presence = var4,
			recommendationRank = var4,
			friendStatus = var4,
			recommendationContextType = var4,
			isRecommendation = var4,
			universeId = var4,
			tileCount = var4,
			source = var4,
			sessionEventCount = var4
		}
	}
}