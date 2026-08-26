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

local function _(p1, p2)
	return p1[p2] or p1.navigation and p1.navigation.getParam(p2)
end

return reactModule.memo(function(p1)
	-- upvalues: chartsConstantsModule (ref), usePageScopeRef (ref), reactModule (ref), getSduiClientPageScope (ref), sduiSurfaceLoadTimeTracker (ref), fetchChartsPageModule (ref), sduiPageEntryPoint (ref), appPage (ref), compositionTags (ref), fFlagLuaAppSduiStickyHeaderScrollAway (ref)
	local configKey = chartsConstantsModule.ConfigKey
	local pageTimer = p1.pageTimer or p1.navigation and p1.navigation.getParam("pageTimer")
	usePageScopeRef(configKey)
	local var1 = reactModule.useMemo(function()
		-- upvalues: pageTimer (ref), getSduiClientPageScope (copy), configKey (ref), sduiSurfaceLoadTimeTracker (copy), chartsConstantsModule (copy)
		if pageTimer then
			getSduiClientPageScope(configKey).set(sduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, pageTimer)
			
			return pageTimer
		end
		local var2 = sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(configKey, {
			eventName = chartsConstantsModule.SurfaceLoadTimeEventName,
			metadata = { page = "mount" }
		})
		var2.start("mount")
		getSduiClientPageScope(configKey).set(sduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, var2)
		
		return var2
	end, { configKey, pageTimer })
	reactModule.useEffect(function()
		-- upvalues: fetchChartsPageModule (copy), var1 (ref)
		fetchChartsPageModule(var1)
	end, { configKey, var1 })
	
	return reactModule.createElement(sduiPageEntryPoint, {
		includeNavigationHeaderBar = false,
		appPage = appPage.Games,
		configKey = configKey,
		pageTimer = var1,
		refresh = reactModule.useCallback(function()
			-- upvalues: sduiSurfaceLoadTimeTracker (copy), configKey (ref), chartsConstantsModule (copy), fetchChartsPageModule (copy)
			local var2 = sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(configKey, {
				eventName = chartsConstantsModule.SurfaceLoadTimeEventName,
				metadata = { page = "refresh" }
			})
			var2.start("refresh")
			
			return fetchChartsPageModule(var2, true)
		end, { configKey }),
		contentTag = compositionTags.ContentRegion.Body,
		stickyContentTag = compositionTags.ContentRegion.Header,
		pageTopPadding = p1.pageTopPadding,
		feedTopMargin = if fFlagLuaAppSduiStickyHeaderScrollAway then p1.feedTopMargin else nil,
		scrollAway = if fFlagLuaAppSduiStickyHeaderScrollAway then p1.scrollAway else nil
	})
end)