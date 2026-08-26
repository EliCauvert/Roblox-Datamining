local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local parent = friendsLanding.Parent
local dependenciesModule = require(friendsLanding.dependencies)
local enumScreensModule = require(friendsLanding.EnumScreens)
local appPage = require(parent.RobloxAppEnums).AppPage
local llama = dependenciesModule.llama
local tutils = dependenciesModule.tutils
local buttonClickEventsModule = require(script.Parent.ButtonClickEvents)
local impressionEventsModule = require(script.Parent.ImpressionEvents)
local navigatedFromPagesEnumModule = require(script.Parent.NavigatedFromPagesEnum)
local showMoreSectionTypeEnumModule = require(friendsLanding.Enums.ShowMoreSectionTypeEnum)
local loggerModule = require(script.Parent.Logger)
local t = {}
t.__index = t
t.DiagCounters = {
	UserLoadedPage = game:DefineFastString("FriendsLandingUserLoadedPageCounter", "FriendsLandingUserLoadedPage"),
	ShowMoreButtonPressedFriends = game:DefineFastString("ShowMoreButtonPressedFriends", "ShowMoreButtonPressedFriends"),
	ShowMoreButtonPressedFriendRequests = game:DefineFastString("ShowMoreButtonPressedFriendRequests", "ShowMoreButtonPressedFriendRequests")
}
t.Navigation = {
	[enumScreensModule.AddFriends] = game:DefineFastString("FriendsLandingNavigationAddFriendsCounter", "FriendsLandingNavigationAddFriends"),
	[enumScreensModule.ViewUserProfile] = game:DefineFastString("FriendsLandingNavigationViewUserProfileCounter", "FriendsLandingNavigationViewUserProfile"),
	[enumScreensModule.GameDetailsPeekView] = game:DefineFastString("FriendsLandingNavigationGameDetailsPeekViewCounter", "FriendsLandingNavigationGameDetailsPeekView"),
	[enumScreensModule.SearchFriends] = game:DefineFastString("FriendsLandingSearchFriendsCounter", "FriendsLandingSearchFriends")
}
t.Navigation[appPage.Home] = game:DefineFastString("AddFriendsHomeEntryCounter", "AddFriendsHomeEntry")
t.Navigation.ViewUserProfileAddFriends = game:DefineFastString("FriendsLandingViewUserProfileAddFriendsCounter", "FriendsLandingViewUserProfileAddFriends")
t.Navigation.ConnectWithFriends = game:DefineFastString("AddFriendsConnectWithFriendsCounter", "AddFriendsConnectWithFriends")
t.DiagStats = {
	LoadingPageTime = game:DefineFastString("FriendsLandingLoadingPageTimeStats", "FriendsLandingLoadingPageTime"),
	MountingPageTime = game:DefineFastString("FriendsLandingMountingPageTimeStats", "FriendsLandingMountingPageTime")
}
t.BASE_CONTEXT = "friendsLanding"

function t.new(p1, p2, p3)
	-- upvalues: t (ref)
	assert(p2, "FriendsLanding must be passed the ID of the local user")
	local t_1 = {
		_diagImpl = p1.Diag,
		_eventStreamImpl = p1.EventStream,
		localUserId = p2,
		_getLoadingTimeInfo = p3,
		_reportedPagePerformanceOnce = {}
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:navigate(p1)
	-- upvalues: loggerModule (ref), t (ref)
	loggerModule:info("navigate to {}", p1)
	local var1 = t.Navigation[p1]
	
	if var1 then
		self._diagImpl:reportCounter(var1, 1)
		
		return
	end
	loggerModule:error("Error from navigate: Invalid destination '{}'", p1)
end

function t:buttonClick(p1, p2)
	-- upvalues: buttonClickEventsModule (ref), loggerModule (ref), llama (ref), showMoreSectionTypeEnumModule (ref), t (ref)
	assert(buttonClickEventsModule.isEnumValue(p1), "invalid button name used")
	loggerModule:info("eventName: buttonClick btn: {}{}", p1, self:_toStringAdditionalArgs(p2))
	local var1 = llama.Dictionary.join(p2 or {}, {
		btn = p1:rawValue(),
		uid = self.localUserId,
		contextOverride = llama.None
	})
	self._eventStreamImpl:setRBXEventStream(if p2 and p2.contextOverride then p2.contextOverride else self.BASE_CONTEXT, "buttonClick", var1)
	var1 = nil
	
	if p1 == buttonClickEventsModule.LoadMoreUsers then
		if var1.sectionType == showMoreSectionTypeEnumModule.FriendRequests then
			var1 = t.DiagCounters.ShowMoreButtonPressedFriendRequests
		elseif var1.sectionType == showMoreSectionTypeEnumModule.Friends then
			var1 = t.DiagCounters.ShowMoreButtonPressedFriends
		end
	end
	if var1 then
		self._diagImpl:reportCounter(var1, 1)
	end
end

function t._toStringAdditionalArgs(_, p1)
	-- upvalues: tutils (ref)
	if p1 then
		local replaced, _ = string.gsub(" args: " .. tutils.toString(p1), "%s+", " ")
		
		return replaced
	end
	return ""
end

function t:pageLoaded()
	-- upvalues: loggerModule (ref), t (ref)
	loggerModule:info("pageLoaded")
	self._diagImpl:reportCounter(t.DiagCounters.UserLoadedPage, 1)
end

function t:pageLoadedWithArgs(p1, p2)
	self._eventStreamImpl:setRBXEventStream(p1 or self.BASE_CONTEXT, "luaPageLoad", p2)
end

function t:_pagePerformanceReport(p1, p2, p3)
	-- upvalues: navigatedFromPagesEnumModule (ref), loggerModule (ref)
	p3 = p3 or os.clock()
	local var1 = self._getLoadingTimeInfo and self._getLoadingTimeInfo() or {}
	local startPage = var1.startPage
	local startTime = var1.startTime
	
	if navigatedFromPagesEnumModule.fromRawValue(startPage) and type(startTime) == "number" then
		local var2 = (p3 - startTime) * 1000
		local var3 = navigatedFromPagesEnumModule[startPage].rawValue()
		local text = p1 .. "_" .. var16
		local t = {
			startPage = var3,
			loadingTime = var2,
			uid = self.localUserId
		}
		loggerModule:info("pageLoaded in " .. var15 .. "ms")
		self._diagImpl:reportStats(text, var2)
		self._eventStreamImpl:setRBXEventStream(self.BASE_CONTEXT, p2, t)
		
		return
	end
	loggerModule:warning("Cannot report loading time: incorrect startPage or startTime")
end

function t:_reportPagePerformanceOnceCheck(p1)
	if self._reportedPagePerformanceOnce[p1] then
		return true
	end
	self._reportedPagePerformanceOnce[p1] = true
	
	return false
end

function t:pageMountingTimeReport(p1)
	-- upvalues: t (ref)
	if self:_reportPagePerformanceOnceCheck("pageMountingTime") then
		return
	end
	self:_pagePerformanceReport(t.DiagStats.MountingPageTime, "pageMountingTime", p1)
end

function t:pageLoadingTimeReport(p1)
	-- upvalues: t (ref)
	if self:_reportPagePerformanceOnceCheck("pageLoadingTime") then
		return
	end
	self:_pagePerformanceReport(t.DiagStats.LoadingPageTime, "pageLoadingTime", p1)
end

function t:reportAddFriendsEntrypoint(p1, p2)
	-- upvalues: t (ref), appPage (ref)
	assert(t.Navigation[p1] ~= nil, "invalid screen")
	
	if p1 == appPage.Home then
		self._eventStreamImpl:setRBXEventStream("addUniversalFriends", "buttonClick", {
			btn = "LegacyAddFriendsButton",
			absolutePosition = 1,
			showContactImporterModal = if p2 then p2.showContactImporterModal else nil
		})
	end
	self._diagImpl:reportCounter(t.Navigation[p1], 1)
end

function t:impressionEvent(p1, p2)
	-- upvalues: impressionEventsModule (ref)
	assert(impressionEventsModule.isEnumValue(p1), "invalid impression name used")
	self._eventStreamImpl:setRBXEventStream("addUniversalFriends", p1:rawValue(), p2)
	self._diagImpl:reportCounter(p1:rawValue(), 1)
end

return t