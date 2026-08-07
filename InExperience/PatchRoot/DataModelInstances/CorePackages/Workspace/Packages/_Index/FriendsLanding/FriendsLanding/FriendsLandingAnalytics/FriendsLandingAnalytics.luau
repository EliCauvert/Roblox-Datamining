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

function t.new(p0, p1, p2) --[[ line: 71 ]]
	-- upvalues: t (ref)
	assert(p1, "FriendsLanding must be passed the ID of the local user")
	local t_1 = {
		_diagImpl = p0.Diag,
		_eventStreamImpl = p0.EventStream,
		localUserId = p1,
		_getLoadingTimeInfo = p2,
		_reportedPagePerformanceOnce = {}
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:navigate(p3) --[[ line: 87 ]]
	-- upvalues: loggerModule (ref), t (ref)
	loggerModule:info("navigate to {}", p3)
	local var10 = t.Navigation[p3]
	
	if var10 then
		self._diagImpl:reportCounter(var10, 1)
		
		return
	end
	loggerModule:error("Error from navigate: Invalid destination '{}'", p3)
end

function t:buttonClick(p4, p5) --[[ line: 97 ]]
	-- upvalues: buttonClickEventsModule (ref), loggerModule (ref), llama (ref), showMoreSectionTypeEnumModule (ref), t (ref)
	assert(buttonClickEventsModule.isEnumValue(p4), "invalid button name used")
	loggerModule:info("eventName: buttonClick btn: {}{}", p4, self:_toStringAdditionalArgs(p5))
	local var11 = llama.Dictionary.join(p5 or {}, {
		btn = p4:rawValue(),
		uid = self.localUserId,
		contextOverride = llama.None
	})
	self._eventStreamImpl:setRBXEventStream(if p5 and p5.contextOverride then p5.contextOverride else self.BASE_CONTEXT, "buttonClick", var11)
	var11 = nil
	
	if p4 == buttonClickEventsModule.LoadMoreUsers then
		if var11.sectionType == showMoreSectionTypeEnumModule.FriendRequests then
			var11 = t.DiagCounters.ShowMoreButtonPressedFriendRequests
		elseif var11.sectionType == showMoreSectionTypeEnumModule.Friends then
			var11 = t.DiagCounters.ShowMoreButtonPressedFriends
		end
	end
	if var11 then
		self._diagImpl:reportCounter(var11, 1)
	end
end

function t._toStringAdditionalArgs(_, p6) --[[ line: 127 ]]
	-- upvalues: tutils (ref)
	if p6 then
		local replaced, _ = string.gsub(" args: " .. tutils.toString(p6), "%s+", " ")
		
		return replaced
	end
	return ""
end

function t:pageLoaded() --[[ line: 136 ]]
	-- upvalues: loggerModule (ref), t (ref)
	loggerModule:info("pageLoaded")
	self._diagImpl:reportCounter(t.DiagCounters.UserLoadedPage, 1)
end

function t:pageLoadedWithArgs(p7, p8) --[[ line: 142 ]]
	self._eventStreamImpl:setRBXEventStream(p7 or self.BASE_CONTEXT, "luaPageLoad", p8)
end

function t:_pagePerformanceReport(p9, p10, p11) --[[ line: 147 ]]
	-- upvalues: navigatedFromPagesEnumModule (ref), loggerModule (ref)
	p11 = p11 or os.clock()
	local var14 = self._getLoadingTimeInfo and self._getLoadingTimeInfo() or {}
	local startPage = var14.startPage
	local startTime = var14.startTime
	
	if navigatedFromPagesEnumModule.fromRawValue(startPage) and type(startTime) == "number" then
		local var15 = (p11 - startTime) * 1000
		local var16 = navigatedFromPagesEnumModule[startPage].rawValue()
		local text = p9 .. "_" .. var16
		local t = {
			startPage = var16,
			loadingTime = var15,
			uid = self.localUserId
		}
		loggerModule:info("pageLoaded in " .. var15 .. "ms")
		self._diagImpl:reportStats(text, var15)
		self._eventStreamImpl:setRBXEventStream(self.BASE_CONTEXT, p10, t)
		
		return
	end
	loggerModule:warning("Cannot report loading time: incorrect startPage or startTime")
end

function t:_reportPagePerformanceOnceCheck(p12) --[[ line: 173 ]]
	if self._reportedPagePerformanceOnce[p12] then
		return true
	end
	self._reportedPagePerformanceOnce[p12] = true
	
	return false
end

function t:pageMountingTimeReport(p13) --[[ line: 181 ]]
	-- upvalues: t (ref)
	if self:_reportPagePerformanceOnceCheck("pageMountingTime") then
		return
	end
	self:_pagePerformanceReport(t.DiagStats.MountingPageTime, "pageMountingTime", p13)
end

function t:pageLoadingTimeReport(p14) --[[ line: 189 ]]
	-- upvalues: t (ref)
	if self:_reportPagePerformanceOnceCheck("pageLoadingTime") then
		return
	end
	self:_pagePerformanceReport(t.DiagStats.LoadingPageTime, "pageLoadingTime", p14)
end

function t:reportAddFriendsEntrypoint(p15, p16) --[[ line: 197 ]]
	-- upvalues: t (ref), appPage (ref)
	assert(t.Navigation[p15] ~= nil, "invalid screen")
	
	if p15 == appPage.Home then
		self._eventStreamImpl:setRBXEventStream("addUniversalFriends", "buttonClick", {
			btn = "LegacyAddFriendsButton",
			absolutePosition = 1,
			showContactImporterModal = if p16 then p16.showContactImporterModal else nil
		})
	end
	self._diagImpl:reportCounter(t.Navigation[p15], 1)
end

function t:impressionEvent(p17, p18) --[[ line: 209 ]]
	-- upvalues: impressionEventsModule (ref)
	assert(impressionEventsModule.isEnumValue(p17), "invalid impression name used")
	self._eventStreamImpl:setRBXEventStream("addUniversalFriends", p17:rawValue(), p18)
	self._diagImpl:reportCounter(p17:rawValue(), 1)
end

return t