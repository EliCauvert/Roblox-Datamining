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

local function _(p1, p2)
	return p1[p2] or p1.navigation and p1.navigation.getParam(p2)
end

return reactModule.memo(function(p1)
	-- upvalues: homeConstantsModule (ref), reactModule (ref), sduiSharedUtilitiesModule (ref), appPage (ref), fetchHomePageModule (ref), fFlagLuaAppSduiVideoThumbnail (ref), responsiveModule (ref), videoUtilsModule (ref), sduiPageEntryPoint (ref), refreshHomePageModule (ref), compositionTags (ref), fFlagLuaAppSduiStickyHeaderScrollAway (ref)
	local configKey = homeConstantsModule.ConfigKey
	local pageTimer = p1.pageTimer or p1.navigation and p1.navigation.getParam("pageTimer")
	local var1 = reactModule.useMemo(function()
		-- upvalues: pageTimer (ref), sduiSharedUtilitiesModule (copy), appPage (copy)
		return pageTimer or sduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(appPage.Home)
	end, { configKey, pageTimer })
	reactModule.useEffect(function()
		-- upvalues: fetchHomePageModule (copy), var1 (ref)
		fetchHomePageModule(var1)
	end, { configKey, var1 })
	local var2 = nil
	
	if fFlagLuaAppSduiVideoThumbnail then
		local var3 = responsiveModule.usePreferredInput() == responsiveModule.Input.Touch
		var2 = reactModule.useMemo(function()
			-- upvalues: videoUtilsModule (copy), var3 (ref)
			return videoUtilsModule.FeedVideoPlaybackContext.new(var3)
		end, { var3 })
	end
	return reactModule.createElement(sduiPageEntryPoint, {
		includeNavigationHeaderBar = false,
		appPage = appPage.Home,
		configKey = configKey,
		pageTimer = var1,
		refresh = refreshHomePageModule,
		contentTag = compositionTags.ContentRegion.Body,
		pageTopPadding = p1.pageTopPadding,
		feedTopMargin = if fFlagLuaAppSduiStickyHeaderScrollAway then p1.feedTopMargin else nil,
		scrollAway = if fFlagLuaAppSduiStickyHeaderScrollAway then p1.scrollAway else nil,
		videoPlaybackContext = if fFlagLuaAppSduiVideoThumbnail then var2 else nil
	})
end)