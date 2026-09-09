local parent = script.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local parent_1 = parent.Parent
local eventNamesModule = require(script.Parent.EventNames)
local socialLuaAnalyticsModule = require(parent_1.SocialLuaAnalytics)
local sharedFlagsModule = require(parent_1.SharedFlags)
local enums = socialLuaAnalyticsModule.Analytics.Enums
local contexts = enums.Contexts
local eventTypes = enums.EventTypes
local btnValuesModule = require(script.Parent.BtnValues)
local constantsModule = require(parent.Common.Constants)
local formatRecommendationContextType = socialLuaAnalyticsModule.Analytics.Formatters.formatRecommendationContextType
local getFFlagPYMKAddFriendsEntry = dependenciesModule.getFFlagPYMKAddFriendsEntry
local fFlagLuaAppPYMKSendUserSeenCollection = sharedFlagsModule.FFlagLuaAppPYMKSendUserSeenCollection
local fFlagLuaAppUserSeenCollectionUnifiedFields = sharedFlagsModule.FFlagLuaAppUserSeenCollectionUnifiedFields

local var1 = function(p1)
	return p1
end

local var2 = function(p1)
	return if p1 then tostring(p1) else nil
end

local t = {
	[eventNamesModule.CarouselLoadedWithUsers] = {
		context = contexts.HomePage,
		eventType = eventTypes.FriendsCarouselLoaded,
		additionalInfo = { source = constantsModule.HomepagePYMKCarouselSourceName },
		formatRulesForAdditionalInfo = {
			recommendationLimit = nil,
			recommendationCount = var1,
			refreshCount = var1
		}
	},
	[eventNamesModule.PYMKCarouselLoadingTime] = {
		context = contexts.HomePage,
		eventType = eventTypes.LoadingTime,
		additionalInfo = { source = constantsModule.HomepagePYMKCarouselSourceName },
		formatRulesForAdditionalInfo = { loadingTime = var1 }
	},
	[eventNamesModule.UserSeen] = {
		context = contexts.HomePage,
		eventType = eventTypes.UserSeen,
		additionalInfo = {
			isRecommendation = true,
			source = constantsModule.HomepagePYMKCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = var1,
			recommendationContextType = formatRecommendationContextType,
			friendStatus = var1,
			recommendationRank = var1,
			userId = var1,
			contactId = var1,
			presence = var2
		}
	},
	[eventNamesModule.UserPressed] = {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			isRecommendation = true,
			contentType = "User",
			actionType = "OpenProfile",
			source = constantsModule.HomepagePYMKCarouselSourceName,
			btn = btnValuesModule.OpenPeopleList
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = var1,
			positionInRow = var1,
			recommendationContextType = formatRecommendationContextType,
			recommendationId = var1,
			friendStatus = var1,
			recommendationRank = var1,
			contactId = var1,
			presence = var2,
			interactionUuid = var1
		}
	},
	[eventNamesModule.RequestFriendship] = {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			contentType = "User",
			actionType = "RequestFriendship",
			btn = btnValuesModule.RequestFriendship,
			source = constantsModule.HomepagePYMKCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = var1,
			positionInRow = var1,
			recommendationContextType = formatRecommendationContextType,
			recommendationRank = var1,
			requestedId = var1,
			contactId = var1,
			presence = var2,
			interactionUuid = var1
		}
	},
	[eventNamesModule.AcceptFriendship] = {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = btnValuesModule.AcceptFriendship,
			source = constantsModule.HomepagePYMKCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = var1,
			recommendationContextType = formatRecommendationContextType,
			recommendationRank = var1,
			requestedId = var1,
			presence = var2
		}
	},
	[eventNamesModule.PYMKUserPresenceLoad] = {
		context = contexts.HomePage,
		eventType = eventTypes.LoadingTime,
		additionalInfo = { source = "HomepagePYMKUserPresence" },
		formatRulesForAdditionalInfo = { loadingTime = var1 }
	},
	[eventNamesModule.UserSeenCollection] = if fFlagLuaAppPYMKSendUserSeenCollection then {
		context = contexts.HomePage,
		eventType = eventTypes.UserSeenCollection,
		additionalInfo = { source = constantsModule.HomepagePYMKCarouselSourceName },
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
	} else nil
}

if getFFlagPYMKAddFriendsEntry() then
	t[eventNamesModule.CarouselGenericTileClicked] = {
		context = contexts.HomePage,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { source = constantsModule.HomepagePYMKCarouselSourceName },
		formatRulesForAdditionalInfo = { btn = var1 }
	}
end
return t