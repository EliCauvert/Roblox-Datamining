local EventNamesModule = require(script.Parent.EventNames)
local Enums = require(script.Parent.Parent.Parent.SocialLuaAnalytics).Analytics.Enums
local Contexts = Enums.Contexts
local SubPages = Enums.SubPages
local EventTypes = Enums.EventTypes

local function ProfileUserId(p1) --[[ Line: 11 ]]
	return p1
end

return {
	[EventNamesModule.RequestFriendship] = {
		context = Contexts.FriendsLanding,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = "addFriend",
			subpage = SubPages.PlayerContextualMenu
		},
		formatRulesForAdditionalInfo = { profileUserId = ProfileUserId }
	},
	[EventNamesModule.Unfriend] = {
		context = Contexts.FriendsLanding,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = "unFriend",
			subpage = SubPages.PlayerContextualMenu
		},
		formatRulesForAdditionalInfo = { profileUserId = ProfileUserId }
	},
	[EventNamesModule.AcceptFriendRequest] = {
		context = Contexts.FriendsLanding,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = "acceptFriend",
			subpage = SubPages.PlayerContextualMenu
		},
		formatRulesForAdditionalInfo = { profileUserId = ProfileUserId }
	},
	[EventNamesModule.IgnoreFriendRequest] = {
		context = Contexts.FriendsLanding,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = "ignoreFriend",
			subpage = SubPages.PlayerContextualMenu
		},
		formatRulesForAdditionalInfo = { profileUserId = ProfileUserId }
	},
	[EventNamesModule.BlockPlayer] = {
		context = Contexts.FriendsLanding,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = "block", subpage = SubPages.PlayerContextualMenu },
		formatRulesForAdditionalInfo = { profileUserId = ProfileUserId }
	},
	[EventNamesModule.ReportPlayer] = {
		context = Contexts.FriendsLanding,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = "report", subpage = SubPages.PlayerContextualMenu },
		formatRulesForAdditionalInfo = { profileUserId = ProfileUserId }
	},
	[EventNamesModule.JoinExperience] = {
		context = Contexts.FriendsLanding,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = "joinUser",
			subpage = SubPages.PlayerContextualMenu
		},
		formatRulesForAdditionalInfo = { profileUserId = ProfileUserId }
	},
	[EventNamesModule.ViewExperienceDetails] = {
		context = Contexts.FriendsLanding,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = "viewExperienceDetails",
			subpage = SubPages.PlayerContextualMenu
		},
		formatRulesForAdditionalInfo = { profileUserId = ProfileUserId }
	},
	[EventNamesModule.ViewPlatformProfile] = {
		context = Contexts.FriendsLanding,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = "viewPlatformProfile",
			subpage = SubPages.PlayerContextualMenu
		},
		formatRulesForAdditionalInfo = { profileUserId = ProfileUserId }
	}
}