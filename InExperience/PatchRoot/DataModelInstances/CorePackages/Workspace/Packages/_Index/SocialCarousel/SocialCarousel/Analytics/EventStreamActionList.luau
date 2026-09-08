local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local sharedFlagsModule = require(parent.SharedFlags)
local formatRecommendationContextType = socialLuaAnalyticsModule.Analytics.Formatters.formatRecommendationContextType
local enums = socialLuaAnalyticsModule.Analytics.Enums
local contexts = enums.Contexts
local eventTypes = enums.EventTypes
local eventNamesModule = require(script.Parent.EventNames)
local constantsModule = require(socialCarousel.Common.Constants)
local fIntSocialCarouselShowRecsLimit = require(socialCarousel.Flags).FIntSocialCarouselShowRecsLimit
local fFlagSocialCarouselShareQREnabled = sharedFlagsModule.FFlagSocialCarouselShareQREnabled
local fFlagLuaAppUserSeenCollectionUnifiedFields = sharedFlagsModule.FFlagLuaAppUserSeenCollectionUnifiedFields

local var1 = function(p1)
	return p1
end

return {
	[eventNamesModule.UserPressed] = {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = constantsModule.ANALYTICS.BTN_VALUES.OPEN_PEOPLE_LIST,
			contentType = constantsModule.ANALYTICS.CONTENT_TYPE,
			actionType = constantsModule.ANALYTICS.ACTION_TYPES.OPEN_PROFILE
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = var1,
			positionInRow = var1,
			recommendationContextType = formatRecommendationContextType,
			friendId = var1,
			friendStatus = var1,
			isRecommendation = var1,
			recommendationRank = var1,
			universeId = var1,
			presence = var1,
			source = var1,
			interactionUuid = var1
		}
	},
	[eventNamesModule.UserSeen] = {
		context = contexts.HomePage,
		eventType = eventTypes.UserSeen,
		formatRulesForAdditionalInfo = {
			userId = var1,
			presence = var1,
			absolutePosition = var1,
			recommendationRank = var1,
			friendStatus = var1,
			recommendationContextType = formatRecommendationContextType,
			isRecommendation = var1,
			source = var1,
			universeId = var1
		}
	},
	[eventNamesModule.ViewAddFriends] = {
		context = contexts.AddFriends,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = constantsModule.ANALYTICS.BTN_VALUES.ADD_FRIENDS,
			absolutePosition = var1,
			positionInRow = var1,
			contentType = constantsModule.ANALYTICS.CONTENT_TYPE,
			actionType = constantsModule.ANALYTICS.ACTION_TYPES.OPEN_ADD_FRIENDS
		},
		formatRulesForAdditionalInfo = {
			friendCount = var1,
			recommendationLimit = fIntSocialCarouselShowRecsLimit,
			recommendationCount = var1,
			requestCount = var1,
			source = var1,
			interactionUuid = var1
		}
	},
	[eventNamesModule.ViewAllFriends] = {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = constantsModule.ANALYTICS.BTN_VALUES.VIEW_ALL_FRIENDS
		},
		formatRulesForAdditionalInfo = {
			friendCount = var1,
			recommendationLimit = fIntSocialCarouselShowRecsLimit,
			recommendationCount = var1,
			source = var1
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
			nextPage = var1,
			source = var1
		},
		additionalInfo = {}
	},
	[eventNamesModule.StartSquadPressed] = {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = constantsModule.ANALYTICS.BTN_VALUES.START_SQUAD },
		formatRulesForAdditionalInfo = { absolutePosition = var1, source = var1 }
	},
	[eventNamesModule.ShareQRPressed] = if fFlagSocialCarouselShareQREnabled then {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = constantsModule.ANALYTICS.BTN_VALUES.SHARE_QR },
		formatRulesForAdditionalInfo = { absolutePosition = var1, source = var1 }
	} else nil,
	[eventNamesModule.TilesSeenCollection] = {
		context = contexts.HomePage,
		eventType = eventTypes.UserSeenCollection,
		formatRulesForAdditionalInfo = {
			userId = var1,
			absolutePosition = var1,
			presence = var1,
			recommendationRank = var1,
			friendStatus = var1,
			recommendationContextType = var1,
			isRecommendation = var1,
			universeId = var1,
			tileCount = var1,
			source = var1,
			sessionEventCount = var1,
			contentType = if fFlagLuaAppUserSeenCollectionUnifiedFields then var1 else nil,
			interactionUuid = if fFlagLuaAppUserSeenCollectionUnifiedFields then var1 else nil,
			collectionId = if fFlagLuaAppUserSeenCollectionUnifiedFields then var1 else nil,
			collectionPosition = if fFlagLuaAppUserSeenCollectionUnifiedFields then var1 else nil,
			positionsInRow = if fFlagLuaAppUserSeenCollectionUnifiedFields then var1 else nil,
			rowNumbers = if fFlagLuaAppUserSeenCollectionUnifiedFields then var1 else nil,
			feedRowNumbers = if fFlagLuaAppUserSeenCollectionUnifiedFields then var1 else nil,
			totalNumberOfItems = if fFlagLuaAppUserSeenCollectionUnifiedFields then var1 else nil
		}
	}
}