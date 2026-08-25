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
local fFlagLuaAppAddSortDataToSocialCarouselClicks = sharedFlagsModule.FFlagLuaAppAddSortDataToSocialCarouselClicks
local fFlagSocialCarouselShareQREnabled = sharedFlagsModule.FFlagSocialCarouselShareQREnabled
local fFlagLuaAppUserSeenCollectionUnifiedFields = sharedFlagsModule.FFlagLuaAppUserSeenCollectionUnifiedFields

local var5 = function(p0)
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
			absolutePosition = var5,
			positionInRow = if fFlagLuaAppAddSortDataToSocialCarouselClicks then var5 else nil,
			recommendationContextType = formatRecommendationContextType,
			friendId = var5,
			friendStatus = var5,
			isRecommendation = var5,
			recommendationRank = var5,
			universeId = var5,
			presence = var5,
			source = var5,
			interactionUuid = var5
		}
	},
	[eventNamesModule.UserSeen] = {
		context = contexts.HomePage,
		eventType = eventTypes.UserSeen,
		formatRulesForAdditionalInfo = {
			userId = var5,
			presence = var5,
			absolutePosition = var5,
			recommendationRank = var5,
			friendStatus = var5,
			recommendationContextType = formatRecommendationContextType,
			isRecommendation = var5,
			source = var5,
			universeId = var5
		}
	},
	[eventNamesModule.ViewAddFriends] = {
		context = contexts.AddFriends,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = constantsModule.ANALYTICS.BTN_VALUES.ADD_FRIENDS,
			absolutePosition = var5,
			positionInRow = var5,
			contentType = constantsModule.ANALYTICS.CONTENT_TYPE,
			actionType = constantsModule.ANALYTICS.ACTION_TYPES.OPEN_ADD_FRIENDS
		},
		formatRulesForAdditionalInfo = {
			friendCount = var5,
			recommendationLimit = fIntSocialCarouselShowRecsLimit,
			recommendationCount = var5,
			requestCount = var5,
			source = var5,
			interactionUuid = var5
		}
	},
	[eventNamesModule.ViewAllFriends] = {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = constantsModule.ANALYTICS.BTN_VALUES.VIEW_ALL_FRIENDS
		},
		formatRulesForAdditionalInfo = {
			friendCount = var5,
			recommendationLimit = fIntSocialCarouselShowRecsLimit,
			recommendationCount = var5,
			source = var5
		}
	},
	[eventNamesModule.FriendsCarouselUILoadingTime] = {
		context = contexts.HomePage,
		eventType = eventTypes.LoadingTime,
		formatRulesForAdditionalInfo = {
			status = var5,
			fetch = var5,
			loadingTime = var5,
			loadingThreshold = var5,
			nextPage = var5,
			source = var5
		},
		additionalInfo = {}
	},
	[eventNamesModule.StartSquadPressed] = {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = constantsModule.ANALYTICS.BTN_VALUES.START_SQUAD },
		formatRulesForAdditionalInfo = { absolutePosition = var5, source = var5 }
	},
	[eventNamesModule.ShareQRPressed] = if fFlagSocialCarouselShareQREnabled then {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = constantsModule.ANALYTICS.BTN_VALUES.SHARE_QR },
		formatRulesForAdditionalInfo = { absolutePosition = var5, source = var5 }
	} else nil,
	[eventNamesModule.TilesSeenCollection] = {
		context = contexts.HomePage,
		eventType = eventTypes.UserSeenCollection,
		formatRulesForAdditionalInfo = {
			userId = var5,
			absolutePosition = var5,
			presence = var5,
			recommendationRank = var5,
			friendStatus = var5,
			recommendationContextType = var5,
			isRecommendation = var5,
			universeId = var5,
			tileCount = var5,
			source = var5,
			sessionEventCount = var5,
			contentType = if fFlagLuaAppUserSeenCollectionUnifiedFields then var5 else nil,
			interactionUuid = if fFlagLuaAppUserSeenCollectionUnifiedFields then var5 else nil,
			collectionId = if fFlagLuaAppUserSeenCollectionUnifiedFields then var5 else nil,
			collectionPosition = if fFlagLuaAppUserSeenCollectionUnifiedFields then var5 else nil,
			positionsInRow = if fFlagLuaAppUserSeenCollectionUnifiedFields then var5 else nil,
			rowNumbers = if fFlagLuaAppUserSeenCollectionUnifiedFields then var5 else nil,
			feedRowNumbers = if fFlagLuaAppUserSeenCollectionUnifiedFields then var5 else nil,
			totalNumberOfItems = if fFlagLuaAppUserSeenCollectionUnifiedFields then var5 else nil
		}
	}
}