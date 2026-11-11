local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local EventNamesModule = require(script.Parent.EventNames)
local SocialLuaAnalyticsModule = require(Parent1.SocialLuaAnalytics)
local Enums = SocialLuaAnalyticsModule.Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
local BtnValuesModule = require(script.Parent.BtnValues)
local ConstantsModule = require(Parent.Common.Constants)
local FormatRecommendationContextType = SocialLuaAnalyticsModule.Analytics.Formatters.formatRecommendationContextType
local FFlagHomepagePYMKPresenceAnalytics = require(Parent1.SharedFlags).FFlagHomepagePYMKPresenceAnalytics

local function AbsolutePosition(p1)
	return p1
end

local function v12(p1)
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
			presence = if FFlagHomepagePYMKPresenceAnalytics then v12 else nil
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
			presence = if FFlagHomepagePYMKPresenceAnalytics then v12 else nil,
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
			presence = if FFlagHomepagePYMKPresenceAnalytics then v12 else nil,
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
			presence = if FFlagHomepagePYMKPresenceAnalytics then v12 else nil
		}
	},
	[EventNamesModule.PYMKUserPresenceLoad] = if FFlagHomepagePYMKPresenceAnalytics then {
		context = Contexts.HomePage,
		eventType = EventTypes.LoadingTime,
		additionalInfo = { source = "HomepagePYMKUserPresence" },
		formatRulesForAdditionalInfo = { loadingTime = AbsolutePosition }
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