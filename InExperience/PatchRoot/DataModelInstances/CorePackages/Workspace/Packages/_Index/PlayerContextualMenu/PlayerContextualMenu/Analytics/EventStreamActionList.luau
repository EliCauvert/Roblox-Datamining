local eventNamesModule = require(script.Parent.EventNames)
local enums = require(script.Parent.Parent.Parent.SocialLuaAnalytics).Analytics.Enums
local contexts = enums.Contexts
local subPages = enums.SubPages
local eventTypes = enums.EventTypes

local var1 = function(p1)
	return p1
end

return {
	[eventNamesModule.RequestFriendship] = {
		context = contexts.FriendsLanding,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = "addFriend",
			subpage = subPages.PlayerContextualMenu
		},
		formatRulesForAdditionalInfo = { profileUserId = var1 }
	},
	[eventNamesModule.Unfriend] = {
		context = contexts.FriendsLanding,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = "unFriend",
			subpage = subPages.PlayerContextualMenu
		},
		formatRulesForAdditionalInfo = { profileUserId = var1 }
	},
	[eventNamesModule.AcceptFriendRequest] = {
		context = contexts.FriendsLanding,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = "acceptFriend",
			subpage = subPages.PlayerContextualMenu
		},
		formatRulesForAdditionalInfo = { profileUserId = var1 }
	},
	[eventNamesModule.IgnoreFriendRequest] = {
		context = contexts.FriendsLanding,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = "ignoreFriend",
			subpage = subPages.PlayerContextualMenu
		},
		formatRulesForAdditionalInfo = { profileUserId = var1 }
	},
	[eventNamesModule.BlockPlayer] = {
		context = contexts.FriendsLanding,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = "block", subpage = subPages.PlayerContextualMenu },
		formatRulesForAdditionalInfo = { profileUserId = var1 }
	},
	[eventNamesModule.ReportPlayer] = {
		context = contexts.FriendsLanding,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = "report", subpage = subPages.PlayerContextualMenu },
		formatRulesForAdditionalInfo = { profileUserId = var1 }
	},
	[eventNamesModule.JoinExperience] = {
		context = contexts.FriendsLanding,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = "joinUser",
			subpage = subPages.PlayerContextualMenu
		},
		formatRulesForAdditionalInfo = { profileUserId = var1 }
	},
	[eventNamesModule.ViewExperienceDetails] = {
		context = contexts.FriendsLanding,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = "viewExperienceDetails",
			subpage = subPages.PlayerContextualMenu
		},
		formatRulesForAdditionalInfo = { profileUserId = var1 }
	},
	[eventNamesModule.ViewPlatformProfile] = {
		context = contexts.FriendsLanding,
		eventType = eventTypes.ButtonClick,
		additionalInfo = {
			btn = "viewPlatformProfile",
			subpage = subPages.PlayerContextualMenu
		},
		formatRulesForAdditionalInfo = { profileUserId = var1 }
	}
}