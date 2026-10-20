local Charts = script:FindFirstAncestor("Charts")
local Parent = Charts.Parent
local _ = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local CompositionTags = require(Parent.AppComposition).CompositionTags
local FFlagAppThemeHalloween2026HomeBackground = require(Parent.SharedFlags).FFlagAppThemeHalloween2026HomeBackground
local SduiPageEntryPoint = SduiSharedUtilitiesModule.SduiPageEntryPoint
local SduiSurfaceLoadTimeTracker = SduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local GetSduiClientPageScopeFunction = SduiSharedUtilitiesModule.getSduiClientPageScope
local UsePageScopeRefFunction = SduiSharedUtilitiesModule.usePageScopeRef
local FetchChartsPageModule = require(Charts.ChartsPage.fetchChartsPage)
local ChartsConstantsModule = require(Charts.ChartsPage.ChartsConstants)

local function _(p1, p2)
	return p1[p2] or p1.navigation and p1.navigation.getParam(p2)
end

return ReactModule.memo(function(p1)
	-- upvalues: ChartsConstantsModule (copy), UsePageScopeRefFunction (copy), ReactModule (copy), GetSduiClientPageScopeFunction (copy), SduiSurfaceLoadTimeTracker (copy), FetchChartsPageModule (copy), SduiPageEntryPoint (copy), AppPage (copy), CompositionTags (copy), FFlagAppThemeHalloween2026HomeBackground (copy)
	local ConfigKey = ChartsConstantsModule.ConfigKey
	local PageTimer = p1.pageTimer or p1.navigation and p1.navigation.getParam("pageTimer")
	UsePageScopeRefFunction(ConfigKey)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PageTimer (copy), GetSduiClientPageScopeFunction (upval), ConfigKey (copy), SduiSurfaceLoadTimeTracker (upval), ChartsConstantsModule (upval)
		if PageTimer then
			GetSduiClientPageScopeFunction(ConfigKey).set(SduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, PageTimer)
			
			return PageTimer
		else
			local LoadTimerWithSurfaceLoadTime = SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(ConfigKey, {
				eventName = ChartsConstantsModule.SurfaceLoadTimeEventName,
				metadata = { page = "mount" }
			})
			LoadTimerWithSurfaceLoadTime.start("mount")
			GetSduiClientPageScopeFunction(ConfigKey).set(SduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, LoadTimerWithSurfaceLoadTime)
			
			return LoadTimerWithSurfaceLoadTime
		end
	end, { ConfigKey, PageTimer })
	ReactModule.useEffect(function()
		-- upvalues: FetchChartsPageModule (upval), UseMemoResult (copy)
		FetchChartsPageModule(UseMemoResult)
	end, { ConfigKey, UseMemoResult })
	
	return ReactModule.createElement(SduiPageEntryPoint, {
		includeNavigationHeaderBar = false,
		appPage = AppPage.Games,
		configKey = ConfigKey,
		pageTimer = UseMemoResult,
		refresh = ReactModule.useCallback(function()
			-- upvalues: SduiSurfaceLoadTimeTracker (upval), ConfigKey (copy), ChartsConstantsModule (upval), FetchChartsPageModule (upval)
			local LoadTimerWithSurfaceLoadTime = SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(ConfigKey, {
				eventName = ChartsConstantsModule.SurfaceLoadTimeEventName,
				metadata = { page = "refresh" }
			})
			LoadTimerWithSurfaceLoadTime.start("refresh")
			
			return FetchChartsPageModule(LoadTimerWithSurfaceLoadTime, true)
		end, { ConfigKey }),
		contentTag = CompositionTags.ContentRegion.Body,
		stickyContentTag = CompositionTags.ContentRegion.Header,
		scrollPerformanceIntervalName = ChartsConstantsModule.ScrollPerformanceIntervalName,
		pageTopPadding = p1.pageTopPadding,
		feedTopMargin = p1.feedTopMargin,
		scrollAway = p1.scrollAway,
		backgroundStyle = if FFlagAppThemeHalloween2026HomeBackground then p1.backgroundStyle else nil,
		feedBackgroundStyle = if FFlagAppThemeHalloween2026HomeBackground then p1.backgroundStyle else nil
	})
end)