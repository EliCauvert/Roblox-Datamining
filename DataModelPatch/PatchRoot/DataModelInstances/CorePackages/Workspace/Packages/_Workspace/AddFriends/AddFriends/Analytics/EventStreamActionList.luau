local Parent = script:FindFirstAncestor("AddFriends").Parent
local DashModule = require(Parent.Dash)
local Enums = require(Parent.SocialLuaAnalytics).Analytics.Enums
local EventTypes = Enums.EventTypes
local Contexts = Enums.Contexts
local Sources = Enums.Sources
local EventNamesModule = require(script.Parent.EventNames)
local FFlagAddFriendsPYMKPresenceAnalytics = require(Parent.SharedFlags).FFlagAddFriendsPYMKPresenceAnalytics
local FFlagEnableSchoolEntry = require(Parent.SharedFlags).FFlagEnableSchoolEntry

local function v9(p1)
	return if p1 then tostring(p1) else nil
end

return {
	[EventNamesModule.PageLoad] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.PageLoad,
		formatRulesForAdditionalInfo = {
			recommendationCount = DashModule.identity,
			status = DashModule.identity
		}
	},
	[EventNamesModule.AddFriendsPageLoadingTime] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.LoadingTime,
		formatRulesForAdditionalInfo = {
			loadingTime = DashModule.identity,
			status = DashModule.identity
		}
	},
	[EventNamesModule.AFPUserTileLoadFromHomeCarousel] = if require(Parent.SharedFlags).FFlagAddFriendsTileLoadFromHomeCarouselAnalytics then {
		context = Contexts.AddFriends,
		eventType = EventTypes.LoadingTime,
		additionalInfo = {
			fetch = "userTileLoad",
			source = Sources.HomePageFriendsCarousel
		},
		formatRulesForAdditionalInfo = { loadingTime = DashModule.identity }
	} else nil,
	[EventNamesModule.UserSearchClick] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { action = "peopleSearchBar" }
	},
	[EventNamesModule.CIBtnClick] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { action = "connectWithFriends" }
	},
	[EventNamesModule.QRCodeBtnClick] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { action = "shareProfileQRCode" }
	},
	[EventNamesModule.CIBtnImpression] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.UserSeen,
		additionalInfo = { action = "connectWithFriends" }
	},
	[EventNamesModule.QRCodeBtnImpression] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.UserSeen,
		additionalInfo = { action = "shareProfileQRCode" }
	},
	[EventNamesModule.SchoolBtnClick] = if FFlagEnableSchoolEntry then {
		context = Contexts.AddFriends,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { action = "school" }
	} else nil,
	[EventNamesModule.SchoolBtnImpression] = if FFlagEnableSchoolEntry then {
		context = Contexts.AddFriends,
		eventType = EventTypes.UserSeen,
		additionalInfo = { action = "school" }
	} else nil,
	[EventNamesModule.RequestFriendshipBtnClick] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { action = "requestFriendship" },
		formatRulesForAdditionalInfo = {
			namespace = DashModule.identity,
			targetUserId = DashModule.identity,
			absolutePosition = DashModule.identity,
			rank = DashModule.identity,
			contextType = DashModule.identity,
			entityType = DashModule.identity,
			presence = if FFlagAddFriendsPYMKPresenceAnalytics then v9 else nil
		}
	},
	[EventNamesModule.AcceptFriendshipBtnClick] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { action = "acceptFriendship" },
		formatRulesForAdditionalInfo = {
			namespace = DashModule.identity,
			targetUserId = DashModule.identity,
			absolutePosition = DashModule.identity,
			rank = DashModule.identity,
			contextType = DashModule.identity,
			entityType = DashModule.identity,
			presence = if FFlagAddFriendsPYMKPresenceAnalytics then v9 else nil
		}
	},
	[EventNamesModule.DeclineFriendshipBtnClick] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { action = "declineFriendship" },
		formatRulesForAdditionalInfo = {
			namespace = DashModule.identity,
			targetUserId = DashModule.identity,
			absolutePosition = DashModule.identity,
			rank = DashModule.identity,
			contextType = DashModule.identity,
			entityType = DashModule.identity,
			presence = if FFlagAddFriendsPYMKPresenceAnalytics then v9 else nil
		}
	},
	[EventNamesModule.PlayerTileClick] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { action = "userTileClick" },
		formatRulesForAdditionalInfo = {
			namespace = DashModule.identity,
			targetUserId = DashModule.identity,
			absolutePosition = DashModule.identity,
			rank = DashModule.identity,
			contextType = DashModule.identity,
			entityType = DashModule.identity,
			friendStatus = DashModule.identity,
			presence = if FFlagAddFriendsPYMKPresenceAnalytics then v9 else nil
		}
	},
	[EventNamesModule.IgnoreAllBtnClick] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { action = "ignoreAll" }
	},
	[EventNamesModule.ShowMoreBtnClick] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { action = "loadMoreUsers" },
		formatRulesForAdditionalInfo = { namespace = DashModule.identity }
	},
	[EventNamesModule.UserTileImpression] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.UserSeen,
		additionalInfo = { action = "userTileImpression" },
		formatRulesForAdditionalInfo = {
			namespace = DashModule.identity,
			targetUserId = DashModule.identity,
			absolutePosition = DashModule.identity,
			rank = DashModule.identity,
			contextType = DashModule.identity,
			entityType = DashModule.identity,
			friendStatus = DashModule.identity,
			rowInSort = DashModule.identity,
			presence = if FFlagAddFriendsPYMKPresenceAnalytics then DashModule.identity else nil
		}
	},
	[EventNamesModule.FriendingOSAEducationSubtitleImpression] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.UserSeen,
		additionalInfo = { action = "friendingOSAEducationSubtitle" }
	},
	[EventNamesModule.TrustedContactsEducationalBannerClick] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { action = "trustedContactsEducationalBanner" }
	},
	[EventNamesModule.TrustedContactsEducationalBannerClose] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { action = "TrustedContactsEducationalBannerClose" }
	},
	[EventNamesModule.TrustedContactsEducationalBannerImpression] = {
		context = Contexts.AddFriends,
		eventType = EventTypes.UserSeen,
		additionalInfo = { action = "trustedContactsEducationalBanner" }
	},
	[EventNamesModule.PYMKUserPresenceLoad] = if FFlagAddFriendsPYMKPresenceAnalytics then {
		context = Contexts.AddFriends,
		eventType = EventTypes.LoadingTime,
		additionalInfo = { source = "AddFriendsPYMKUserPresence" }
	} else nil
}