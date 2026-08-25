local charts = script:FindFirstAncestor("Charts")
local parent = charts.Parent
local _ = require(parent.Navigation)
local reactModule = require(parent.React)
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local compositionTags = require(parent.AppComposition).CompositionTags
local fFlagLuaAppSduiStickyHeaderScrollAway = require(parent.SharedFlags).FFlagLuaAppSduiStickyHeaderScrollAway
local sduiPageEntryPoint = sduiSharedUtilitiesModule.SduiPageEntryPoint
local sduiSurfaceLoadTimeTracker = sduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local getSduiClientPageScope = sduiSharedUtilitiesModule.getSduiClientPageScope
local usePageScopeRef = sduiSharedUtilitiesModule.usePageScopeRef
local fetchChartsPageModule = require(charts.ChartsPage.fetchChartsPage)
local chartsConstantsModule = require(charts.ChartsPage.ChartsConstants)

local function _(p0, p1)
	return p0[p1] or p0.navigation and p0.navigation.getParam(p1)
end

return reactModule.memo(function(p2)
	-- upvalues: chartsConstantsModule (ref), usePageScopeRef (ref), reactModule (ref), getSduiClientPageScope (ref), sduiSurfaceLoadTimeTracker (ref), fetchChartsPageModule (ref), sduiPageEntryPoint (ref), appPage (ref), compositionTags (ref), fFlagLuaAppSduiStickyHeaderScrollAway (ref)
	local configKey = chartsConstantsModule.ConfigKey
	local pageTimer = p2.pageTimer or p2.navigation and p2.navigation.getParam("pageTimer")
	usePageScopeRef(configKey)
	local var6 = reactModule.useMemo(function()
		-- upvalues: pageTimer (ref), getSduiClientPageScope (copy), configKey (ref), sduiSurfaceLoadTimeTracker (copy), chartsConstantsModule (copy)
		if pageTimer then
			getSduiClientPageScope(configKey).set(sduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, pageTimer)
			
			return pageTimer
		end
		local var7 = sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(configKey, {
			eventName = chartsConstantsModule.SurfaceLoadTimeEventName,
			metadata = { page = "mount" }
		})
		var7.start("mount")
		getSduiClientPageScope(configKey).set(sduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, var7)
		
		return var7
	end, { configKey, pageTimer })
	reactModule.useEffect(function()
		-- upvalues: fetchChartsPageModule (copy), var6 (ref)
		fetchChartsPageModule(var6)
	end, { configKey, var6 })
	
	return reactModule.createElement(sduiPageEntryPoint, {
		includeNavigationHeaderBar = false,
		appPage = appPage.Games,
		configKey = configKey,
		pageTimer = var6,
		refresh = reactModule.useCallback(function()
			-- upvalues: sduiSurfaceLoadTimeTracker (copy), configKey (ref), chartsConstantsModule (copy), fetchChartsPageModule (copy)
			local var8 = sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(configKey, {
				eventName = chartsConstantsModule.SurfaceLoadTimeEventName,
				metadata = { page = "refresh" }
			})
			var8.start("refresh")
			
			return fetchChartsPageModule(var8, true)
		end, { configKey }),
		contentTag = compositionTags.ContentRegion.Body,
		stickyContentTag = compositionTags.ContentRegion.Header,
		pageTopPadding = p2.pageTopPadding,
		feedTopMargin = if fFlagLuaAppSduiStickyHeaderScrollAway then p2.feedTopMargin else nil,
		scrollAway = if fFlagLuaAppSduiStickyHeaderScrollAway then p2.scrollAway else nil
	})
end)