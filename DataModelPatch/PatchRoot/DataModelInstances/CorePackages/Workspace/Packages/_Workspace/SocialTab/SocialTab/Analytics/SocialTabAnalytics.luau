local SocialTab = script:FindFirstAncestor("SocialTab")
local DependenciesModule = require(SocialTab.dependencies)
local Llama = DependenciesModule.llama
local Tutils = DependenciesModule.tutils
local LocalizationService = DependenciesModule.LocalizationService
local LoggerModule = require(script.Parent.Logger)
local Sources = require(SocialTab.Parent.SocialLuaAnalytics).Analytics.Enums.Sources
local SocialTabAnalyticsModule = {}
SocialTabAnalyticsModule.__index = SocialTabAnalyticsModule
SocialTabAnalyticsModule.DiagCounters = {
	UserLoadedPage = game:DefineFastString("SocialTabUserLoadedPageCounter", "SocialTabUserLoadedPage"),
	UserLoadedSocialTab = game:DefineFastString("SocialTabUserLoadedCounter", "RoactChatUserLoaded")
}
SocialTabAnalyticsModule.Navigation = {
	LoggedInUserIdentity = game:DefineFastString("SocialTabNavigationLoggedInUserIdentityCounter", "SocialTabNavigationLoggedInUserIdentity"),
	Chats = game:DefineFastString("SocialTabNavigationChatsCounter", "SocialTabNavigationChats"),
	Groups = game:DefineFastString("SocialTabNavigationGroupsCounter", "SocialTabNavigationGroups"),
	AddFriends = game:DefineFastString("SocialTabNavigationAddFriendsCounter", "SocialTabNavigationAddFriends"),
	FriendRequests = game:DefineFastString("SocialTabNavigationFriendRequestsCounter", "SocialTabNavigationFriendRequests"),
	SearchFriends = game:DefineFastString("SocialTabNavigationSearchFriendsCounter", "SocialTabNavigationSearchFriends"),
	Notifications = game:DefineFastString("SocialTabNavigationNotificationsCounter", "SocialTabNavigationNotifications"),
	CarouselTitle = game:DefineFastString("SocialTabNavigationCarouselTitleCounter", "SocialTabNavigationCarouselTitle"),
	FriendsLandingPage = game:DefineFastString("SocialTabNavigationFriendsLandingCounter", "SocialTabNavigationFriendsLanding"),
	ViewUserProfile = game:DefineFastString("SocialTabLuaViewUserProfileCounter", "SocialTabLuaViewUserProfile")
}
SocialTabAnalyticsModule.Navigation.LuaProfileTEMP = game:DefineFastString("SocialTabLuaProfileSelfCounter", "SocialTabLuaProfileSelf")

function SocialTabAnalyticsModule.new(p1, LocalUserId)
	-- upvalues: SocialTabAnalyticsModule (copy)
	assert(LocalUserId, "SocialTabAnalytics must be passed the ID of the local user")
	local config = {
		_diagImpl = p1.Diag,
		_eventStreamImpl = p1.EventStream,
		localUserId = LocalUserId
	}
	setmetatable(config, SocialTabAnalyticsModule)
	
	return config
end

function SocialTabAnalyticsModule:navigate(p1, _)
	-- upvalues: LoggerModule (copy), SocialTabAnalyticsModule (copy)
	LoggerModule:info("navigate to {}", p1)
	local NavigationEntry = SocialTabAnalyticsModule.Navigation[p1]
	
	if NavigationEntry then
		self._diagImpl:reportCounter(NavigationEntry, 1)
		
		return
	else
		LoggerModule:error("Error from navigate: Invalid destination '{}'", p1)
	end
end

function SocialTabAnalyticsModule:buttonClick(Btn, p1)
	-- upvalues: LoggerModule (copy), Llama (copy)
	LoggerModule:info("eventName: buttonClick btn: {}{}", Btn, self:_toStringAdditionalArgs(p1))
	self._eventStreamImpl:setRBXEventStream("SocialTab", "buttonClick", (Llama.Dictionary.join(p1 or {}, { btn = Btn, uid = self.localUserId })))
end

function SocialTabAnalyticsModule:_toStringAdditionalArgs(p1)
	-- upvalues: Tutils (copy)
	if p1 then
		local Replaced, _ = string.gsub(" args: " .. Tutils.toString(p1), "%s+", " ")
		
		return Replaced
	else
		return ""
	end
end

function SocialTabAnalyticsModule:pageLoaded()
	-- upvalues: LoggerModule (copy), SocialTabAnalyticsModule (copy)
	LoggerModule:info("pageLoaded")
	self._diagImpl:reportCounter(SocialTabAnalyticsModule.DiagCounters.UserLoadedPage, 1)
end

function SocialTabAnalyticsModule:userLoadedSocialTab()
	-- upvalues: SocialTabAnalyticsModule (copy)
	self._eventStreamImpl:setRBXEventStream("roactChat", "userLoadedChat", { uid = self.localUserId })
	self._diagImpl:reportCounter(SocialTabAnalyticsModule.DiagCounters.UserLoadedSocialTab, 1)
end

function SocialTabAnalyticsModule:openPlayerSearch()
	-- upvalues: Sources (copy), LocalizationService (copy)
	self._eventStreamImpl:setRBXEventStream("players", "search", {
		act = "open",
		source = Sources.SocialTab,
		locale = LocalizationService.RobloxLocaleId
	})
end

return SocialTabAnalyticsModule