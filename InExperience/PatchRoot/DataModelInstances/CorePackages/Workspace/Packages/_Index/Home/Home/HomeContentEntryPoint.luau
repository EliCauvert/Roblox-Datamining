local home = script:FindFirstAncestor("Home")
local parent = home.Parent
local reactModule = require(parent.React)
local _ = require(parent.Navigation)
local appPage = require(parent.RobloxAppEnums).AppPage
local compositionTags = require(parent.AppComposition).CompositionTags
local responsiveModule = require(parent.Responsive)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiPageEntryPoint = sduiSharedUtilitiesModule.SduiPageEntryPoint
local videoUtilsModule = require(parent.VideoUtils)
local refreshHomePageModule = require(home.refreshHomePage)
local fetchHomePageModule = require(home.fetchHomePage)
local homeConstantsModule = require(home.HomeConstants)
local fFlagLuaAppSduiStickyHeaderScrollAway = require(parent.SharedFlags).FFlagLuaAppSduiStickyHeaderScrollAway
local fFlagLuaAppSduiVideoThumbnail = require(parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail

local function _(p0, p1) --[[ line: 33 | named "getFromPropsOrNavigationParams" ]]
	return p0[p1] or p0.navigation and p0.navigation.getParam(p1)
end

return reactModule.memo(function(p2) --[[ line: 37 | named "HomeContentEntryPoint" ]]
	-- upvalues: homeConstantsModule (ref), reactModule (ref), sduiSharedUtilitiesModule (ref), appPage (ref), fetchHomePageModule (ref), fFlagLuaAppSduiVideoThumbnail (ref), responsiveModule (ref), videoUtilsModule (ref), sduiPageEntryPoint (ref), refreshHomePageModule (ref), compositionTags (ref), fFlagLuaAppSduiStickyHeaderScrollAway (ref)
	local configKey = homeConstantsModule.ConfigKey
	local pageTimer = p2.pageTimer or p2.navigation and p2.navigation.getParam("pageTimer")
	local var9 = reactModule.useMemo(function() --[[ line: 41 ]]
		-- upvalues: pageTimer (ref), sduiSharedUtilitiesModule (copy), appPage (copy)
		return pageTimer or sduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(appPage.Home)
	end, { configKey, pageTimer })
	reactModule.useEffect(function() --[[ line: 45 ]]
		-- upvalues: fetchHomePageModule (copy), var9 (ref)
		fetchHomePageModule(var9)
	end, { configKey, var9 })
	local var10 = nil
	
	if fFlagLuaAppSduiVideoThumbnail then
		local var11 = responsiveModule.usePreferredInput() == responsiveModule.Input.Touch
		var10 = reactModule.useMemo(function() --[[ line: 54 ]]
			-- upvalues: videoUtilsModule (copy), var11 (ref)
			return videoUtilsModule.FeedVideoPlaybackContext.new(var11)
		end, { var11 })
	end
	return reactModule.createElement(sduiPageEntryPoint, {
		includeNavigationHeaderBar = false,
		appPage = appPage.Home,
		configKey = configKey,
		pageTimer = var9,
		refresh = refreshHomePageModule,
		contentTag = compositionTags.ContentRegion.Body,
		pageTopPadding = p2.pageTopPadding,
		feedTopMargin = if fFlagLuaAppSduiStickyHeaderScrollAway then p2.feedTopMargin else nil,
		scrollAway = if fFlagLuaAppSduiStickyHeaderScrollAway then p2.scrollAway else nil,
		videoPlaybackContext = if fFlagLuaAppSduiVideoThumbnail then var10 else nil
	})
end)