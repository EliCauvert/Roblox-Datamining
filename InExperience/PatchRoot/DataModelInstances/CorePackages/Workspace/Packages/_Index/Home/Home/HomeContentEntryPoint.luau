local home = script:FindFirstAncestor("Home")
local parent = home.Parent
local reactModule = require(parent.React)
local _ = require(parent.Navigation)
local appPage = require(parent.RobloxAppEnums).AppPage
local compositionTags = require(parent.AppComposition).CompositionTags
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiPageEntryPoint = sduiSharedUtilitiesModule.SduiPageEntryPoint
local refreshHomePageModule = require(home.refreshHomePage)
local fetchHomePageModule = require(home.fetchHomePage)
local homeConstantsModule = require(home.HomeConstants)
local fFlagLuaAppSduiStickyHeaderScrollAway = require(parent.SharedFlags).FFlagLuaAppSduiStickyHeaderScrollAway

local function _(p0, p1) --[[ line: 29 | named "getFromPropsOrNavigationParams" ]]
	return p0[p1] or p0.navigation and p0.navigation.getParam(p1)
end

return reactModule.memo(function(p2) --[[ line: 33 | named "HomeContentEntryPoint" ]]
	-- upvalues: homeConstantsModule (ref), reactModule (ref), sduiSharedUtilitiesModule (ref), appPage (ref), fetchHomePageModule (ref), sduiPageEntryPoint (ref), refreshHomePageModule (ref), compositionTags (ref), fFlagLuaAppSduiStickyHeaderScrollAway (ref)
	local configKey = homeConstantsModule.ConfigKey
	local pageTimer = p2.pageTimer or p2.navigation and p2.navigation.getParam("pageTimer")
	local var7 = reactModule.useMemo(function() --[[ line: 37 ]]
		-- upvalues: pageTimer (ref), sduiSharedUtilitiesModule (copy), appPage (copy)
		return pageTimer or sduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(appPage.Home)
	end, { configKey, pageTimer })
	reactModule.useEffect(function() --[[ line: 41 ]]
		-- upvalues: fetchHomePageModule (copy), var7 (ref)
		fetchHomePageModule(var7)
	end, { configKey, var7 })
	
	return reactModule.createElement(sduiPageEntryPoint, {
		includeNavigationHeaderBar = false,
		appPage = appPage.Home,
		configKey = configKey,
		pageTimer = var7,
		refresh = refreshHomePageModule,
		contentTag = compositionTags.ContentRegion.Body,
		pageTopPadding = p2.pageTopPadding,
		feedTopMargin = if fFlagLuaAppSduiStickyHeaderScrollAway then p2.feedTopMargin else nil,
		scrollAway = if fFlagLuaAppSduiStickyHeaderScrollAway then p2.scrollAway else nil
	})
end)