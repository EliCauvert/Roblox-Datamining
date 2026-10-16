local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local DependenciesModule = require(FriendsLanding.dependencies)
local EnumScreensModule = require(FriendsLanding.EnumScreens)
local AppPage = require(FriendsLanding.Parent.RobloxAppEnums).AppPage
local Llama = DependenciesModule.llama
local Tutils = DependenciesModule.tutils
local ButtonClickEventsModule = require(script.Parent.ButtonClickEvents)
local ImpressionEventsModule = require(script.Parent.ImpressionEvents)
local NavigatedFromPagesEnumModule = require(script.Parent.NavigatedFromPagesEnum)
local ShowMoreSectionTypeEnumModule = require(FriendsLanding.Enums.ShowMoreSectionTypeEnum)
local LoggerModule = require(script.Parent.Logger)
local FriendsLandingAnalyticsModule = {}
FriendsLandingAnalyticsModule.__index = FriendsLandingAnalyticsModule
FriendsLandingAnalyticsModule.DiagCounters = {
	UserLoadedPage = game:DefineFastString("FriendsLandingUserLoadedPageCounter", "FriendsLandingUserLoadedPage"),
	ShowMoreButtonPressedFriends = game:DefineFastString("ShowMoreButtonPressedFriends", "ShowMoreButtonPressedFriends"),
	ShowMoreButtonPressedFriendRequests = game:DefineFastString("ShowMoreButtonPressedFriendRequests", "ShowMoreButtonPressedFriendRequests")
}
FriendsLandingAnalyticsModule.Navigation = {
	[EnumScreensModule.AddFriends] = game:DefineFastString("FriendsLandingNavigationAddFriendsCounter", "FriendsLandingNavigationAddFriends"),
	[EnumScreensModule.ViewUserProfile] = game:DefineFastString("FriendsLandingNavigationViewUserProfileCounter", "FriendsLandingNavigationViewUserProfile"),
	[EnumScreensModule.GameDetailsPeekView] = game:DefineFastString("FriendsLandingNavigationGameDetailsPeekViewCounter", "FriendsLandingNavigationGameDetailsPeekView"),
	[EnumScreensModule.SearchFriends] = game:DefineFastString("FriendsLandingSearchFriendsCounter", "FriendsLandingSearchFriends")
}
FriendsLandingAnalyticsModule.Navigation[AppPage.Home] = game:DefineFastString("AddFriendsHomeEntryCounter", "AddFriendsHomeEntry")
FriendsLandingAnalyticsModule.Navigation.ViewUserProfileAddFriends = game:DefineFastString("FriendsLandingViewUserProfileAddFriendsCounter", "FriendsLandingViewUserProfileAddFriends")
FriendsLandingAnalyticsModule.Navigation.ConnectWithFriends = game:DefineFastString("AddFriendsConnectWithFriendsCounter", "AddFriendsConnectWithFriends")
FriendsLandingAnalyticsModule.DiagStats = {
	LoadingPageTime = game:DefineFastString("FriendsLandingLoadingPageTimeStats", "FriendsLandingLoadingPageTime"),
	MountingPageTime = game:DefineFastString("FriendsLandingMountingPageTimeStats", "FriendsLandingMountingPageTime")
}
FriendsLandingAnalyticsModule.BASE_CONTEXT = "friendsLanding"

function FriendsLandingAnalyticsModule.new(p1, LocalUserId, _getLoadingTimeInfo) --[[ Line: 71 ]]
	-- upvalues: FriendsLandingAnalyticsModule (copy)
	assert(LocalUserId, "FriendsLanding must be passed the ID of the local user")
	local config = {
		_diagImpl = p1.Diag,
		_eventStreamImpl = p1.EventStream,
		localUserId = LocalUserId,
		_getLoadingTimeInfo = _getLoadingTimeInfo,
		_reportedPagePerformanceOnce = {}
	}
	setmetatable(config, FriendsLandingAnalyticsModule)
	
	return config
end

function FriendsLandingAnalyticsModule:navigate(p1) --[[ Line: 87 ]]
	-- upvalues: LoggerModule (copy), FriendsLandingAnalyticsModule (copy)
	LoggerModule:info("navigate to {}", p1)
	local NavigationEntry = FriendsLandingAnalyticsModule.Navigation[p1]
	
	if NavigationEntry then
		self._diagImpl:reportCounter(NavigationEntry, 1)
		
		return
	else
		LoggerModule:error("Error from navigate: Invalid destination '{}'", p1)
	end
end

function FriendsLandingAnalyticsModule:buttonClick(LoadMoreUsers, p1) --[[ Line: 97 ]]
	-- upvalues: ButtonClickEventsModule (copy), LoggerModule (copy), Llama (copy), ShowMoreSectionTypeEnumModule (copy), FriendsLandingAnalyticsModule (copy)
	assert(ButtonClickEventsModule.isEnumValue(LoadMoreUsers), "invalid button name used")
	LoggerModule:info("eventName: buttonClick btn: {}{}", LoadMoreUsers, self:_toStringAdditionalArgs(p1))
	local ContextOverride = if p1 and p1.contextOverride then p1.contextOverride else self.BASE_CONTEXT
	local JoinResult = Llama.Dictionary.join(p1 or {}, {
		btn = LoadMoreUsers:rawValue(),
		uid = self.localUserId,
		contextOverride = Llama.None
	})
	self._eventStreamImpl:setRBXEventStream(ContextOverride, "buttonClick", JoinResult)
	local ShowMoreButtonPressedFriendRequests = nil
	
	if LoadMoreUsers == ButtonClickEventsModule.LoadMoreUsers then
		if JoinResult.sectionType == ShowMoreSectionTypeEnumModule.FriendRequests then
			ShowMoreButtonPressedFriendRequests = FriendsLandingAnalyticsModule.DiagCounters.ShowMoreButtonPressedFriendRequests
		elseif JoinResult.sectionType == ShowMoreSectionTypeEnumModule.Friends then
			ShowMoreButtonPressedFriendRequests = FriendsLandingAnalyticsModule.DiagCounters.ShowMoreButtonPressedFriends
		end
	end
	if ShowMoreButtonPressedFriendRequests then
		self._diagImpl:reportCounter(ShowMoreButtonPressedFriendRequests, 1)
	end
end

function FriendsLandingAnalyticsModule:_toStringAdditionalArgs(p1) --[[ Line: 127 ]]
	-- upvalues: Tutils (copy)
	if p1 then
		local Replaced, _ = string.gsub(" args: " .. Tutils.toString(p1), "%s+", " ")
		
		return Replaced
	else
		return ""
	end
end

function FriendsLandingAnalyticsModule:pageLoaded() --[[ Line: 136 ]]
	-- upvalues: LoggerModule (copy), FriendsLandingAnalyticsModule (copy)
	LoggerModule:info("pageLoaded")
	self._diagImpl:reportCounter(FriendsLandingAnalyticsModule.DiagCounters.UserLoadedPage, 1)
end

function FriendsLandingAnalyticsModule:pageLoadedWithArgs(p1, p2) --[[ Line: 142 ]]
	self._eventStreamImpl:setRBXEventStream(p1 or self.BASE_CONTEXT, "luaPageLoad", p2)
end

function FriendsLandingAnalyticsModule:_pagePerformanceReport(LoadingPageTime, p1, p2) --[[ Line: 147 ]]
	-- upvalues: NavigatedFromPagesEnumModule (copy), LoggerModule (copy)
	local P17 = p2 or os.clock()
	local LoadingTimeInfo = self._getLoadingTimeInfo and self._getLoadingTimeInfo() or {}
	local StartPage = LoadingTimeInfo.startPage
	local StartTime = LoadingTimeInfo.startTime
	
	if NavigatedFromPagesEnumModule.fromRawValue(StartPage) and type(StartTime) == "number" then
		local ScaledP = (P17 - StartTime) * 1000
		local RawValueResult = NavigatedFromPagesEnumModule[StartPage].rawValue()
		local Text = LoadingPageTime .. "_" .. RawValueResult
		local config = {
			startPage = RawValueResult,
			loadingTime = ScaledP,
			uid = self.localUserId
		}
		LoggerModule:info("pageLoaded in " .. ScaledP .. "ms")
		self._diagImpl:reportStats(Text, ScaledP)
		self._eventStreamImpl:setRBXEventStream(self.BASE_CONTEXT, p1, config)
		
		return
	else
		LoggerModule:warning("Cannot report loading time: incorrect startPage or startTime")
	end
end

function FriendsLandingAnalyticsModule:_reportPagePerformanceOnceCheck(p1): boolean --[[ Line: 173 ]]
	if self._reportedPagePerformanceOnce[p1] then
		return true
	else
		self._reportedPagePerformanceOnce[p1] = true
		
		return false
	end
end

function FriendsLandingAnalyticsModule:pageMountingTimeReport(p1) --[[ Line: 181 ]]
	-- upvalues: FriendsLandingAnalyticsModule (copy)
	if not self:_reportPagePerformanceOnceCheck("pageMountingTime") then
		self:_pagePerformanceReport(FriendsLandingAnalyticsModule.DiagStats.MountingPageTime, "pageMountingTime", p1)
		
		return
	end
end

function FriendsLandingAnalyticsModule:pageLoadingTimeReport(p1) --[[ Line: 189 ]]
	-- upvalues: FriendsLandingAnalyticsModule (copy)
	if not self:_reportPagePerformanceOnceCheck("pageLoadingTime") then
		self:_pagePerformanceReport(FriendsLandingAnalyticsModule.DiagStats.LoadingPageTime, "pageLoadingTime", p1)
		
		return
	end
end

function FriendsLandingAnalyticsModule:reportAddFriendsEntrypoint(Home, p1) --[[ Line: 197 ]]
	-- upvalues: FriendsLandingAnalyticsModule (copy), AppPage (copy)
	assert(FriendsLandingAnalyticsModule.Navigation[Home] ~= nil, "invalid screen")
	
	if Home == AppPage.Home then
		self._eventStreamImpl:setRBXEventStream("addUniversalFriends", "buttonClick", {
			btn = "LegacyAddFriendsButton",
			absolutePosition = 1,
			showContactImporterModal = if p1 then p1.showContactImporterModal else nil
		})
	end
	self._diagImpl:reportCounter(FriendsLandingAnalyticsModule.Navigation[Home], 1)
end

function FriendsLandingAnalyticsModule:impressionEvent(p1, p2) --[[ Line: 209 ]]
	-- upvalues: ImpressionEventsModule (copy)
	assert(ImpressionEventsModule.isEnumValue(p1), "invalid impression name used")
	self._eventStreamImpl:setRBXEventStream("addUniversalFriends", p1:rawValue(), p2)
	self._diagImpl:reportCounter(p1:rawValue(), 1)
end

return FriendsLandingAnalyticsModule