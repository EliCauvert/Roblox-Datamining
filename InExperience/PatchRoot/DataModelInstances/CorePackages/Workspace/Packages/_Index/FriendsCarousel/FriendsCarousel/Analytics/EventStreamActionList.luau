local Parent = script.Parent.Parent
local EventNamesModule = require(script.Parent.EventNames)
local SocialLuaAnalyticsModule = require(Parent.Parent.SocialLuaAnalytics)
local Enums = SocialLuaAnalyticsModule.Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
local BtnValuesModule = require(script.Parent.BtnValues)
local ConstantsModule = require(Parent.Common.Constants)
local FormatFriendStatusModule = require(script.Parent.formatFriendStatus)
local GetUniverseIdFromUserModule = require(script.Parent.getUniverseIdFromUser)
local FormatRecommendationContextType = SocialLuaAnalyticsModule.Analytics.Formatters.formatRecommendationContextType
local FormatPresence = SocialLuaAnalyticsModule.Analytics.Formatters.formatPresence
local GetFIntShowFriendRecommendationsLimitModule = require(Parent.Flags.getFIntShowFriendRecommendationsLimit)

local function AbsolutePosition(p1) --[[ Line: 20 ]]
	return p1
end

return {
	[EventNamesModule.CarouselLoadedWithUsers] = {
		context = Contexts.HomePage,
		eventType = EventTypes.FriendsCarouselLoaded,
		additionalInfo = {
			source = ConstantsModule.HomepageFriendsCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			friendCount = AbsolutePosition,
			recommendationCount = AbsolutePosition,
			recommendationLimit = GetFIntShowFriendRecommendationsLimitModule,
			refreshCount = AbsolutePosition,
			experimentLayerStatus = AbsolutePosition,
			fetchedRecommendations = AbsolutePosition,
			recommendationSessionId = AbsolutePosition
		}
	},
	[EventNamesModule.UserSeen] = {
		context = Contexts.HomePage,
		eventType = EventTypes.UserSeen,
		additionalInfo = {
			source = ConstantsModule.HomepageFriendsCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = AbsolutePosition,
			recommendationContextType = FormatRecommendationContextType,
			friendStatus = FormatFriendStatusModule,
			isRecommendation = AbsolutePosition,
			presence = FormatPresence,
			recommendationRank = AbsolutePosition,
			userId = AbsolutePosition,
			universeId = GetUniverseIdFromUserModule
		}
	},
	[EventNamesModule.UserPressed] = {
		context = Contexts.HomePage,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = BtnValuesModule.OpenPeopleList,
			source = ConstantsModule.HomepageFriendsCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = AbsolutePosition,
			recommendationContextType = FormatRecommendationContextType,
			friendId = AbsolutePosition,
			friendStatus = FormatFriendStatusModule,
			isRecommendation = AbsolutePosition,
			recommendationRank = AbsolutePosition,
			universeId = GetUniverseIdFromUserModule,
			presence = FormatPresence
		}
	},
	[EventNamesModule.RequestFriendship] = {
		context = Contexts.HomePage,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = BtnValuesModule.RequestFriendship,
			source = ConstantsModule.HomepageFriendsCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = AbsolutePosition,
			recommendationContextType = FormatRecommendationContextType,
			recommendationRank = AbsolutePosition,
			requestedId = AbsolutePosition
		}
	},
	[EventNamesModule.RevokeFriendRequest] = {
		context = Contexts.HomePage,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = BtnValuesModule.RevokeFriendRequest,
			source = ConstantsModule.HomepageFriendsCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = AbsolutePosition,
			recommendationContextType = FormatRecommendationContextType,
			recommendationRank = AbsolutePosition,
			requestedId = AbsolutePosition
		}
	},
	[EventNamesModule.ViewAllFriends] = {
		context = Contexts.HomePage,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = BtnValuesModule.FriendsLanding,
			source = ConstantsModule.HomepageFriendsCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			friendCount = AbsolutePosition,
			recommendationLimit = GetFIntShowFriendRecommendationsLimitModule,
			recommendationCount = AbsolutePosition
		}
	},
	[EventNamesModule.ViewAddFriends] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			absolutePosition = 1,
			btn = BtnValuesModule.AddFriendsButton,
			source = ConstantsModule.HomepageFriendsCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			friendCount = AbsolutePosition,
			recommendationLimit = GetFIntShowFriendRecommendationsLimitModule,
			recommendationCount = AbsolutePosition,
			requestCount = AbsolutePosition,
			showContactImporterModal = AbsolutePosition
		}
	},
	[EventNamesModule.CarouselLoadingTime] = {
		context = Contexts.HomePage,
		eventType = EventTypes.CarouselLoadingTime,
		additionalInfo = {
			source = ConstantsModule.HomepageFriendsCarouselSourceName
		},
		formatRulesForAdditionalInfo = {
			carouselFetchingStatus = AbsolutePosition,
			friendsFetchingStatus = AbsolutePosition,
			recommendationFetchingStatus = AbsolutePosition,
			loadingTime = AbsolutePosition,
			reachedThreshold = AbsolutePosition,
			loadingThreshold = AbsolutePosition,
			experimentLayerStatus = AbsolutePosition,
			isLegacyCarousel = AbsolutePosition
		}
	},
	[EventNamesModule.ContactImporterOnAddFriends] = {
		context = Contexts.HomePage,
		eventType = EventTypes.ContactImporterOnAddFriends,
		additionalInfo = { isLegacyAddFriends = false }
	},
	[EventNamesModule.PaginatedFriendsCarouselLoadingTime] = {
		context = Contexts.HomePage,
		eventType = EventTypes.LoadingTime,
		formatRulesForAdditionalInfo = {
			status = AbsolutePosition,
			loadingTime = AbsolutePosition,
			loadingThreshold = AbsolutePosition,
			nextPage = AbsolutePosition,
			fetch = AbsolutePosition
		},
		additionalInfo = {
			source = ConstantsModule.HomepageFriendsCarouselSourceName
		}
	},
	[EventNamesModule.FriendsEndpointLoadingTime] = {
		context = Contexts.HomePage,
		eventType = EventTypes.LoadingTime,
		formatRulesForAdditionalInfo = {
			status = AbsolutePosition,
			loadingTime = AbsolutePosition,
			loadingThreshold = AbsolutePosition,
			nextPage = AbsolutePosition,
			fetch = AbsolutePosition
		},
		additionalInfo = {
			source = ConstantsModule.HomepageFriendsCarouselSourceName
		}
	},
	[EventNamesModule.FriendsCarouselUILoadingTime] = {
		context = Contexts.HomePage,
		eventType = EventTypes.LoadingTime,
		formatRulesForAdditionalInfo = {
			status = AbsolutePosition,
			fetch = AbsolutePosition,
			loadingTime = AbsolutePosition,
			loadingThreshold = AbsolutePosition,
			nextPage = AbsolutePosition
		},
		additionalInfo = {
			source = ConstantsModule.HomepageFriendsCarouselSourceName
		}
	}
}