local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local SharedFlagsModule = require(Parent.SharedFlags)
local FormatRecommendationContextType = SocialLuaAnalyticsModule.Analytics.Formatters.formatRecommendationContextType
local Enums = SocialLuaAnalyticsModule.Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
local EventNamesModule = require(script.Parent.EventNames)
local ConstantsModule = require(SocialCarousel.Common.Constants)
local FIntSocialCarouselShowRecsLimit = require(SocialCarousel.Flags).FIntSocialCarouselShowRecsLimit
local FFlagLuaAppUserSeenCollectionUnifiedFields = SharedFlagsModule.FFlagLuaAppUserSeenCollectionUnifiedFields

local function Source(p1)
	return p1
end

return {
	[EventNamesModule.UserPressed] = {
		context = Contexts.HomePage,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = ConstantsModule.ANALYTICS.BTN_VALUES.OPEN_PEOPLE_LIST,
			contentType = ConstantsModule.ANALYTICS.CONTENT_TYPE,
			actionType = ConstantsModule.ANALYTICS.ACTION_TYPES.OPEN_PROFILE
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = Source,
			positionInRow = Source,
			recommendationContextType = FormatRecommendationContextType,
			friendId = Source,
			friendStatus = Source,
			isRecommendation = Source,
			recommendationRank = Source,
			universeId = Source,
			presence = Source,
			source = Source,
			interactionUuid = Source
		}
	},
	[EventNamesModule.UserSeen] = {
		context = Contexts.HomePage,
		eventType = EventTypes.UserSeen,
		formatRulesForAdditionalInfo = {
			userId = Source,
			presence = Source,
			absolutePosition = Source,
			recommendationRank = Source,
			friendStatus = Source,
			recommendationContextType = FormatRecommendationContextType,
			isRecommendation = Source,
			source = Source,
			universeId = Source
		}
	},
	[EventNamesModule.ViewAddFriends] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = ConstantsModule.ANALYTICS.BTN_VALUES.ADD_FRIENDS,
			absolutePosition = Source,
			positionInRow = Source,
			contentType = ConstantsModule.ANALYTICS.CONTENT_TYPE,
			actionType = ConstantsModule.ANALYTICS.ACTION_TYPES.OPEN_ADD_FRIENDS
		},
		formatRulesForAdditionalInfo = {
			friendCount = Source,
			recommendationLimit = FIntSocialCarouselShowRecsLimit,
			recommendationCount = Source,
			requestCount = Source,
			source = Source,
			interactionUuid = Source
		}
	},
	[EventNamesModule.ViewAllFriends] = {
		context = Contexts.HomePage,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = ConstantsModule.ANALYTICS.BTN_VALUES.VIEW_ALL_FRIENDS
		},
		formatRulesForAdditionalInfo = {
			friendCount = Source,
			recommendationLimit = FIntSocialCarouselShowRecsLimit,
			recommendationCount = Source,
			source = Source
		}
	},
	[EventNamesModule.FriendsCarouselUILoadingTime] = {
		context = Contexts.HomePage,
		eventType = EventTypes.LoadingTime,
		formatRulesForAdditionalInfo = {
			status = Source,
			fetch = Source,
			loadingTime = Source,
			loadingThreshold = Source,
			nextPage = Source,
			source = Source
		},
		additionalInfo = {}
	},
	[EventNamesModule.StartSquadPressed] = {
		context = Contexts.HomePage,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = ConstantsModule.ANALYTICS.BTN_VALUES.START_SQUAD },
		formatRulesForAdditionalInfo = { absolutePosition = Source, source = Source }
	},
	[EventNamesModule.ShareQRPressed] = if SharedFlagsModule.FFlagSocialCarouselShareQREnabled then {
		context = Contexts.HomePage,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = ConstantsModule.ANALYTICS.BTN_VALUES.SHARE_QR },
		formatRulesForAdditionalInfo = { absolutePosition = Source, source = Source }
	} else nil,
	[EventNamesModule.TilesSeenCollection] = {
		context = Contexts.HomePage,
		eventType = EventTypes.UserSeenCollection,
		formatRulesForAdditionalInfo = {
			userId = Source,
			absolutePosition = Source,
			presence = Source,
			recommendationRank = Source,
			friendStatus = Source,
			recommendationContextType = Source,
			isRecommendation = Source,
			universeId = Source,
			tileCount = Source,
			source = Source,
			sessionEventCount = Source,
			contentType = if FFlagLuaAppUserSeenCollectionUnifiedFields then Source else nil,
			interactionUuid = if FFlagLuaAppUserSeenCollectionUnifiedFields then Source else nil,
			collectionId = if FFlagLuaAppUserSeenCollectionUnifiedFields then Source else nil,
			collectionPosition = if FFlagLuaAppUserSeenCollectionUnifiedFields then Source else nil,
			positionsInRow = if FFlagLuaAppUserSeenCollectionUnifiedFields then Source else nil,
			rowNumbers = if FFlagLuaAppUserSeenCollectionUnifiedFields then Source else nil,
			feedRowNumbers = if FFlagLuaAppUserSeenCollectionUnifiedFields then Source else nil,
			totalNumberOfItems = if FFlagLuaAppUserSeenCollectionUnifiedFields then Source else nil
		}
	}
}