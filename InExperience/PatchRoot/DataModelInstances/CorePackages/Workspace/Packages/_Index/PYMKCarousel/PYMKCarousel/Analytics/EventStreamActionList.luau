local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local EventNamesModule = require(script.Parent.EventNames)
local SocialLuaAnalyticsModule = require(Parent1.SocialLuaAnalytics)
local SharedFlagsModule = require(Parent1.SharedFlags)
local Enums = SocialLuaAnalyticsModule.Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
local BtnValuesModule = require(script.Parent.BtnValues)
local ConstantsModule = require(Parent.Common.Constants)
local FormatRecommendationContextType = SocialLuaAnalyticsModule.Analytics.Formatters.formatRecommendationContextType
local FFlagLuaAppUserSeenCollectionUnifiedFields = SharedFlagsModule.FFlagLuaAppUserSeenCollectionUnifiedFields

local function AbsolutePosition(p1) --[[ Line: 20 ]]
	return p1
end

local function Presence(p1) --[[ Line: 24 ]]
	return if p1 then tostring(p1) else nil
end

local EventStreamActionListModule = {
	[EventNamesModule.CarouselLoadedWithUsers] = {
		context = Contexts.HomePage,
		eventType = EventTypes.FriendsCarouselLoaded,
		additionalInfo = { source = ConstantsModule.HomepagePYMKCarouselSourceName },
		formatRulesForAdditionalInfo = {
			recommendationLimit = nil,
			recommendationCount = AbsolutePosition,
			refreshCount = AbsolutePosition
		}
	},
	[EventNamesModule.PYMKCarouselLoadingTime] = {
		context = Contexts.HomePage,
		eventType = EventTypes.LoadingTime,
		additionalInfo = { source = ConstantsModule.HomepagePYMKCarouselSourceName },
		formatRulesForAdditionalInfo = { loadingTime = AbsolutePosition }
	},
	[EventNamesModule.UserSeen] = {
		context = Contexts.HomePage,
		eventType = EventTypes.UserSeen,
		additionalInfo = {
			isRecommendation = true,
			source = ConstantsModule.HomepagePYMKCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = AbsolutePosition,
			recommendationContextType = FormatRecommendationContextType,
			friendStatus = AbsolutePosition,
			recommendationRank = AbsolutePosition,
			userId = AbsolutePosition,
			contactId = AbsolutePosition,
			presence = Presence
		}
	},
	[EventNamesModule.UserPressed] = {
		context = Contexts.HomePage,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			isRecommendation = true,
			contentType = "User",
			actionType = "OpenProfile",
			source = ConstantsModule.HomepagePYMKCarouselSourceName,
			btn = BtnValuesModule.OpenPeopleList
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = AbsolutePosition,
			positionInRow = AbsolutePosition,
			recommendationContextType = FormatRecommendationContextType,
			recommendationId = AbsolutePosition,
			friendStatus = AbsolutePosition,
			recommendationRank = AbsolutePosition,
			contactId = AbsolutePosition,
			presence = Presence,
			interactionUuid = AbsolutePosition
		}
	},
	[EventNamesModule.RequestFriendship] = {
		context = Contexts.HomePage,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			contentType = "User",
			actionType = "RequestFriendship",
			btn = BtnValuesModule.RequestFriendship,
			source = ConstantsModule.HomepagePYMKCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = AbsolutePosition,
			positionInRow = AbsolutePosition,
			recommendationContextType = FormatRecommendationContextType,
			recommendationRank = AbsolutePosition,
			requestedId = AbsolutePosition,
			contactId = AbsolutePosition,
			presence = Presence,
			interactionUuid = AbsolutePosition
		}
	},
	[EventNamesModule.AcceptFriendship] = {
		context = Contexts.HomePage,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = BtnValuesModule.AcceptFriendship,
			source = ConstantsModule.HomepagePYMKCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = AbsolutePosition,
			recommendationContextType = FormatRecommendationContextType,
			recommendationRank = AbsolutePosition,
			requestedId = AbsolutePosition,
			presence = Presence
		}
	},
	[EventNamesModule.PYMKUserPresenceLoad] = {
		context = Contexts.HomePage,
		eventType = EventTypes.LoadingTime,
		additionalInfo = { source = "HomepagePYMKUserPresence" },
		formatRulesForAdditionalInfo = { loadingTime = AbsolutePosition }
	},
	[EventNamesModule.UserSeenCollection] = if SharedFlagsModule.FFlagLuaAppPYMKSendUserSeenCollection then {
		context = Contexts.HomePage,
		eventType = EventTypes.UserSeenCollection,
		additionalInfo = { source = ConstantsModule.HomepagePYMKCarouselSourceName },
		formatRulesForAdditionalInfo = {
			userId = AbsolutePosition,
			absolutePosition = AbsolutePosition,
			presence = AbsolutePosition,
			recommendationRank = AbsolutePosition,
			friendStatus = AbsolutePosition,
			recommendationContextType = AbsolutePosition,
			isRecommendation = AbsolutePosition,
			universeId = AbsolutePosition,
			tileCount = AbsolutePosition,
			sessionEventCount = AbsolutePosition,
			contentType = if FFlagLuaAppUserSeenCollectionUnifiedFields then AbsolutePosition else nil,
			interactionUuid = if FFlagLuaAppUserSeenCollectionUnifiedFields then AbsolutePosition else nil,
			collectionId = if FFlagLuaAppUserSeenCollectionUnifiedFields then AbsolutePosition else nil,
			collectionPosition = if FFlagLuaAppUserSeenCollectionUnifiedFields then AbsolutePosition else nil,
			positionsInRow = if FFlagLuaAppUserSeenCollectionUnifiedFields then AbsolutePosition else nil,
			rowNumbers = if FFlagLuaAppUserSeenCollectionUnifiedFields then AbsolutePosition else nil,
			feedRowNumbers = if FFlagLuaAppUserSeenCollectionUnifiedFields then AbsolutePosition else nil,
			totalNumberOfItems = if FFlagLuaAppUserSeenCollectionUnifiedFields then AbsolutePosition else nil
		}
	} else nil
}

if require(Parent.dependencies).getFFlagPYMKAddFriendsEntry() then
	EventStreamActionListModule[EventNamesModule.CarouselGenericTileClicked] = {
		context = Contexts.HomePage,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { source = ConstantsModule.HomepagePYMKCarouselSourceName },
		formatRulesForAdditionalInfo = { btn = AbsolutePosition }
	}
end
return EventStreamActionListModule