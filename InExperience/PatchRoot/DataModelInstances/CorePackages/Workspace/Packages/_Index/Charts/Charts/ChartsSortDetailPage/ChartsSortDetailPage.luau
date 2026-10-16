local Charts = script:FindFirstAncestor("Charts")
local Parent = Charts.Parent
local _ = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local CompositionTags = require(Parent.AppComposition).CompositionTags
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiPageEntryPoint = SduiSharedUtilitiesModule.SduiPageEntryPoint
local SduiSurfaceLoadTimeTracker = SduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local GetSduiClientPageScopeFunction = SduiSharedUtilitiesModule.getSduiClientPageScope
local UsePageScopeRefFunction = SduiSharedUtilitiesModule.usePageScopeRef
local ChartsConstantsModule = require(Charts.ChartsPage.ChartsConstants)
local ChartsPageScopeFieldsModule = require(Charts.ChartsPage.ChartsPageScopeFields)
local ChartsSortDetailConstantsModule = require(Charts.ChartsSortDetailPage.ChartsSortDetailConstants)
local ChartsSortDetailScopeFieldsModule = require(Charts.ChartsSortDetailPage.ChartsSortDetailScopeFields)
local FetchChartsSortDetailModule = require(Charts.ChartsSortDetailPage.fetchChartsSortDetail)
local GetChartsSortDetailPageKeyModule = require(Charts.ChartsSortDetailPage.getChartsSortDetailPageKey)

local function _(p1, p2) --[[ Line: 34 | Named "getFromPropsOrNavigationParams" ]]
	return p1[p2] or p1.navigation and p1.navigation.getParam(p2)
end

return ReactModule.memo(function(p1) --[[ Line: 38 | Named "ChartsSortDetailPage" ]]
	-- upvalues: ReactModule (copy), GetSduiClientPageScopeFunction (copy), ChartsConstantsModule (copy), ChartsPageScopeFieldsModule (copy), GetChartsSortDetailPageKeyModule (copy), UsePageScopeRefFunction (copy), ChartsSortDetailScopeFieldsModule (copy), SduiSurfaceLoadTimeTracker (copy), ChartsSortDetailConstantsModule (copy), FetchChartsSortDetailModule (copy), SduiPageEntryPoint (copy), AppPage (copy), CompositionTags (copy)
	local SortId = p1.sortId or p1.navigation and p1.navigation.getParam("sortId")
	local ChartsSortDetailPageKeyModule = GetChartsSortDetailPageKeyModule(SortId, nil, (ReactModule.useMemo(function() --[[ Line: 43 ]]
		-- upvalues: GetSduiClientPageScopeFunction (upval), ChartsConstantsModule (upval), ChartsPageScopeFieldsModule (upval)
		return GetSduiClientPageScopeFunction(ChartsConstantsModule.ConfigKey).get(ChartsPageScopeFieldsModule.FilterSelections)
	end, {})))
	local PageTimer = p1.pageTimer or p1.navigation and p1.navigation.getParam("pageTimer")
	UsePageScopeRefFunction(ChartsSortDetailPageKeyModule)
	ReactModule.useMemo(function() --[[ Line: 50 ]]
		-- upvalues: GetSduiClientPageScopeFunction (upval), ChartsSortDetailPageKeyModule (copy), ChartsSortDetailScopeFieldsModule (upval), SortId (copy)
		GetSduiClientPageScopeFunction(ChartsSortDetailPageKeyModule).set(ChartsSortDetailScopeFieldsModule.SelectedSortId, SortId)
	end, { ChartsSortDetailPageKeyModule, SortId })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 54 ]]
		-- upvalues: PageTimer (copy), SduiSurfaceLoadTimeTracker (upval), ChartsSortDetailPageKeyModule (copy), ChartsSortDetailConstantsModule (upval), GetSduiClientPageScopeFunction (upval)
		local PageTimer1 = PageTimer or SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(ChartsSortDetailPageKeyModule, {
			eventName = ChartsSortDetailConstantsModule.SurfaceLoadTimeEventName,
			metadata = { page = "mount" }
		})
		GetSduiClientPageScopeFunction(ChartsSortDetailPageKeyModule).set(SduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, PageTimer1)
		
		return PageTimer1
	end, { ChartsSortDetailPageKeyModule, PageTimer })
	ReactModule.useEffect(function() --[[ Line: 66 ]]
		-- upvalues: SortId (copy), FetchChartsSortDetailModule (upval), UseMemoResult (copy)
		if SortId then
			FetchChartsSortDetailModule(SortId, UseMemoResult)
		end
	end, { SortId, UseMemoResult })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 72 ]]
		-- upvalues: SortId (copy), SduiSurfaceLoadTimeTracker (upval), ChartsSortDetailPageKeyModule (copy), ChartsSortDetailConstantsModule (upval), FetchChartsSortDetailModule (upval)
		if SortId then
			local LoadTimerWithSurfaceLoadTime = SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(ChartsSortDetailPageKeyModule, {
				eventName = ChartsSortDetailConstantsModule.SurfaceLoadTimeEventName,
				metadata = { page = "refresh" }
			})
			LoadTimerWithSurfaceLoadTime.start("refresh")
			FetchChartsSortDetailModule(SortId, LoadTimerWithSurfaceLoadTime)
		end
	end, { SortId, ChartsSortDetailPageKeyModule })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 85 ]]
		-- upvalues: p1 (copy)
		return if p1.pageContext then { pageContext = p1.pageContext } else nil
	end, { p1.pageContext })
	
	return if SortId == nil then nil else ReactModule.createElement(SduiPageEntryPoint, {
		includeNavigationHeaderBar = false,
		appPage = p1.pageContext or AppPage.Games,
		routeName = AppPage.GamesList,
		configKey = ChartsSortDetailPageKeyModule,
		pageTimer = UseMemoResult,
		refresh = UseResult,
		contentTag = CompositionTags.ContentRegion.Body,
		stickyContentTag = CompositionTags.ContentRegion.Header,
		additionalAnalyticsData = UseMemoResult1,
		pageTopPadding = p1.pageTopPadding
	})
end)