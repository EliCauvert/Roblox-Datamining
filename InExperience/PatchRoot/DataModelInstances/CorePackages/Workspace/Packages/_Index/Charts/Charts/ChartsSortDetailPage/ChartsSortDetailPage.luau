local charts = script:FindFirstAncestor("Charts")
local parent = charts.Parent
local _ = require(parent.Navigation)
local reactModule = require(parent.React)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local compositionTags = require(parent.AppComposition).CompositionTags
local appPage = robloxAppEnumsModule.AppPage
local sduiPageEntryPoint = sduiSharedUtilitiesModule.SduiPageEntryPoint
local sduiSurfaceLoadTimeTracker = sduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local getSduiClientPageScope = sduiSharedUtilitiesModule.getSduiClientPageScope
local usePageScopeRef = sduiSharedUtilitiesModule.usePageScopeRef
local chartsConstantsModule = require(charts.ChartsPage.ChartsConstants)
local chartsPageScopeFieldsModule = require(charts.ChartsPage.ChartsPageScopeFields)
local chartsSortDetailConstantsModule = require(charts.ChartsSortDetailPage.ChartsSortDetailConstants)
local chartsSortDetailScopeFieldsModule = require(charts.ChartsSortDetailPage.ChartsSortDetailScopeFields)
local fetchChartsSortDetailModule = require(charts.ChartsSortDetailPage.fetchChartsSortDetail)
local getChartsSortDetailPageKeyModule = require(charts.ChartsSortDetailPage.getChartsSortDetailPageKey)
local fFlagLuaAppSduiGameSortDropDown = require(parent.SharedFlags).FFlagLuaAppSduiGameSortDropDown

local function _(p1, p2)
	return p1[p2] or p1.navigation and p1.navigation.getParam(p2)
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), getSduiClientPageScope (ref), chartsConstantsModule (ref), chartsPageScopeFieldsModule (ref), getChartsSortDetailPageKeyModule (ref), usePageScopeRef (ref), fFlagLuaAppSduiGameSortDropDown (ref), chartsSortDetailScopeFieldsModule (ref), sduiSurfaceLoadTimeTracker (ref), chartsSortDetailConstantsModule (ref), fetchChartsSortDetailModule (ref), sduiPageEntryPoint (ref), appPage (ref), compositionTags (ref)
	local sortId = p1.sortId or p1.navigation and p1.navigation.getParam("sortId")
	local var1 = getChartsSortDetailPageKeyModule(sortId, nil, reactModule.useMemo(function()
		-- upvalues: getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy)
		return getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)
	end, {}))
	local pageTimer = p1.pageTimer or p1.navigation and p1.navigation.getParam("pageTimer")
	usePageScopeRef(var1)
	
	if fFlagLuaAppSduiGameSortDropDown then
		reactModule.useMemo(function()
			-- upvalues: getSduiClientPageScope (copy), var1 (ref), chartsSortDetailScopeFieldsModule (copy), sortId (ref)
			getSduiClientPageScope(var1).set(chartsSortDetailScopeFieldsModule.SelectedSortId, sortId)
		end, { var1, sortId })
	end
	local var2 = reactModule.useMemo(function()
		-- upvalues: pageTimer (ref), sduiSurfaceLoadTimeTracker (copy), var1 (ref), chartsSortDetailConstantsModule (copy), getSduiClientPageScope (copy)
		local pageTimer_1 = pageTimer or sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(var1, {
			eventName = chartsSortDetailConstantsModule.SurfaceLoadTimeEventName,
			metadata = { page = "mount" }
		})
		getSduiClientPageScope(var1).set(sduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, pageTimer_1)
		
		return pageTimer_1
	end, { var1, pageTimer })
	reactModule.useEffect(function()
		-- upvalues: sortId (ref), fetchChartsSortDetailModule (copy), var2 (ref)
		if sortId then
			fetchChartsSortDetailModule(sortId, var2)
		end
	end, { sortId, var2 })
	
	return if sortId == nil then nil else reactModule.createElement(sduiPageEntryPoint, {
		includeNavigationHeaderBar = false,
		appPage = p1.pageContext or appPage.Games,
		routeName = appPage.GamesList,
		configKey = var1,
		pageTimer = var2,
		refresh = reactModule.useCallback(function()
			-- upvalues: sortId (ref), sduiSurfaceLoadTimeTracker (copy), var1 (ref), chartsSortDetailConstantsModule (copy), fetchChartsSortDetailModule (copy)
			if sortId then
				local var3 = sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(var1, {
					eventName = chartsSortDetailConstantsModule.SurfaceLoadTimeEventName,
					metadata = { page = "refresh" }
				})
				var3.start("refresh")
				fetchChartsSortDetailModule(sortId, var3)
			end
		end, { sortId, var1 }),
		contentTag = compositionTags.ContentRegion.Body,
		stickyContentTag = compositionTags.ContentRegion.Header,
		additionalAnalyticsData = reactModule.useMemo(function()
			-- upvalues: p1 (ref)
			return if p1.pageContext then { pageContext = p1.pageContext } else nil
		end, { p1.pageContext }),
		pageTopPadding = p1.pageTopPadding
	})
end)