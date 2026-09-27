local home = script:FindFirstAncestor("Home")
local parent = home.Parent
local reactModule = require(parent.React)
local _ = require(parent.Navigation)
local appPage = require(parent.RobloxAppEnums).AppPage
local responsiveModule = require(parent.Responsive)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiPageWrapperEntryPoint = sduiSharedUtilitiesModule.SduiPageWrapperEntryPoint
local usePageScopeRef = sduiSharedUtilitiesModule.usePageScopeRef
local useEntrySurfacing = sduiSharedUtilitiesModule.useEntrySurfacing
local videoUtilsModule = require(parent.VideoUtils)
local refreshHomePageModule = require(home.refreshHomePage)
local fetchHomePageModule = require(home.fetchHomePage)
local useHomeCollectionLayoutSyncModule = require(home.useHomeCollectionLayoutSync)
local homeConstantsModule = require(home.HomeConstants)
local fFlagLuaAppSduiStickyHeaderScrollAway = require(parent.SharedFlags).FFlagLuaAppSduiStickyHeaderScrollAway
local fFlagLuaAppAddHomeExtraTopPadding = require(parent.SharedFlags).FFlagLuaAppAddHomeExtraTopPadding
local fFlagLuaAppSduiVideoThumbnail = require(parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail
local fFlagSduiDismissPromptPageScope = require(parent.SharedFlags).FFlagSduiDismissPromptPageScope
local fFlagAppPageShellScrollToTopFocus = require(parent.SharedFlags).FFlagAppPageShellScrollToTopFocus
local fFlagLuaAppsDefaultSelection = require(parent.SharedFlags).FFlagLuaAppsDefaultSelection

local function _(p1, p2)
	return p1[p2] or p1.navigation and p1.navigation.getParam(p2)
end

return reactModule.memo(function(p1)
	-- upvalues: homeConstantsModule (ref), fFlagLuaAppAddHomeExtraTopPadding (ref), useEntrySurfacing (ref), fFlagSduiDismissPromptPageScope (ref), usePageScopeRef (ref), reactModule (ref), sduiSharedUtilitiesModule (ref), appPage (ref), fetchHomePageModule (ref), home (ref), useHomeCollectionLayoutSyncModule (ref), fFlagLuaAppSduiVideoThumbnail (ref), responsiveModule (ref), videoUtilsModule (ref), sduiPageWrapperEntryPoint (ref), refreshHomePageModule (ref), fFlagLuaAppSduiStickyHeaderScrollAway (ref), fFlagAppPageShellScrollToTopFocus (ref), fFlagLuaAppsDefaultSelection (ref)
	local configKey = homeConstantsModule.ConfigKey
	local var1 = nil
	
	if fFlagLuaAppAddHomeExtraTopPadding then
		local var2 = useEntrySurfacing(configKey, homeConstantsModule.ContentIdentifier, "fullPage")
		var1 = (p1.feedTopMargin or 0) + (if var2 then var2.contentTopPadding else 0)
	end
	if fFlagSduiDismissPromptPageScope then
		usePageScopeRef(configKey)
	end
	local pageTimer = p1.pageTimer or p1.navigation and p1.navigation.getParam("pageTimer")
	local var3 = reactModule.useMemo(function()
		-- upvalues: pageTimer (ref), sduiSharedUtilitiesModule (copy), appPage (copy)
		return pageTimer or sduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(appPage.Home)
	end, { configKey, pageTimer })
	reactModule.useEffect(function()
		-- upvalues: fetchHomePageModule (copy), var3 (ref)
		fetchHomePageModule(var3)
	end, { configKey, var3 })
	reactModule.useEffect(function()
		-- upvalues: home (copy)
		return require(home.getHomePageAutoRefreshStore)(false).start()
	end, {})
	useHomeCollectionLayoutSyncModule()
	local var4 = nil
	
	if fFlagLuaAppSduiVideoThumbnail then
		local var5 = responsiveModule.usePreferredInput() == responsiveModule.Input.Touch
		var4 = reactModule.useMemo(function()
			-- upvalues: videoUtilsModule (copy), var5 (ref)
			return videoUtilsModule.FeedVideoPlaybackContext.new(var5)
		end, { var5 })
	end
	return reactModule.createElement(sduiPageWrapperEntryPoint, {
		appPage = appPage.Home,
		configKey = configKey,
		contentIdentifier = homeConstantsModule.ContentIdentifier,
		pageTimer = var3,
		refresh = refreshHomePageModule,
		pageTopPadding = p1.pageTopPadding,
		feedTopMargin = if fFlagLuaAppSduiStickyHeaderScrollAway then if fFlagLuaAppAddHomeExtraTopPadding then var1 else p1.feedTopMargin else nil,
		stickyTopPadding = if fFlagLuaAppSduiStickyHeaderScrollAway then p1.feedTopMargin else nil,
		scrollAway = if fFlagLuaAppSduiStickyHeaderScrollAway then p1.scrollAway else nil,
		videoPlaybackContext = if fFlagLuaAppSduiVideoThumbnail then var4 else nil,
		handleBackButton = if fFlagAppPageShellScrollToTopFocus then false else nil,
		defaultFocusRef = if fFlagAppPageShellScrollToTopFocus and fFlagLuaAppsDefaultSelection then p1.defaultFocusRef else nil
	})
end)