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

local function _(p0, p1) --[[ line: 36 | named "getFromPropsOrNavigationParams" ]]
	return p0[p1] or p0.navigation and p0.navigation.getParam(p1)
end

return reactModule.memo(function(p2) --[[ line: 40 | named "ChartsSortDetailPage" ]]
	-- upvalues: reactModule (ref), getSduiClientPageScope (ref), chartsConstantsModule (ref), chartsPageScopeFieldsModule (ref), getChartsSortDetailPageKeyModule (ref), usePageScopeRef (ref), fFlagLuaAppSduiGameSortDropDown (ref), chartsSortDetailScopeFieldsModule (ref), sduiSurfaceLoadTimeTracker (ref), chartsSortDetailConstantsModule (ref), fetchChartsSortDetailModule (ref), sduiPageEntryPoint (ref), appPage (ref), compositionTags (ref)
	local sortId = p2.sortId or p2.navigation and p2.navigation.getParam("sortId")
	local var11 = getChartsSortDetailPageKeyModule(sortId, nil, reactModule.useMemo(function() --[[ line: 45 ]]
		-- upvalues: getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy)
		return getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)
	end, {}))
	local pageTimer = p2.pageTimer or p2.navigation and p2.navigation.getParam("pageTimer")
	usePageScopeRef(var11)
	
	if fFlagLuaAppSduiGameSortDropDown then
		reactModule.useMemo(function() --[[ line: 56 ]]
			-- upvalues: getSduiClientPageScope (copy), var11 (ref), chartsSortDetailScopeFieldsModule (copy), sortId (ref)
			getSduiClientPageScope(var11).set(chartsSortDetailScopeFieldsModule.SelectedSortId, sortId)
		end, { var11, sortId })
	end
	local var13 = reactModule.useMemo(function() --[[ line: 61 ]]
		-- upvalues: pageTimer (ref), sduiSurfaceLoadTimeTracker (copy), var11 (ref), chartsSortDetailConstantsModule (copy), getSduiClientPageScope (copy)
		local pageTimer_1 = pageTimer or sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(var11, {
			eventName = chartsSortDetailConstantsModule.SurfaceLoadTimeEventName,
			metadata = { page = "mount" }
		})
		getSduiClientPageScope(var11).set(sduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, pageTimer_1)
		
		return pageTimer_1
	end, { var11, pageTimer })
	reactModule.useEffect(function() --[[ line: 73 ]]
		-- upvalues: sortId (ref), fetchChartsSortDetailModule (copy), var13 (ref)
		if sortId then
			fetchChartsSortDetailModule(sortId, var13)
		end
	end, { sortId, var13 })
	
	return if sortId == nil then nil else reactModule.createElement(sduiPageEntryPoint, {
		includeNavigationHeaderBar = false,
		appPage = p2.pageContext or appPage.Games,
		routeName = appPage.GamesList,
		configKey = var11,
		pageTimer = var13,
		refresh = reactModule.useCallback(function() --[[ line: 79 ]]
			-- upvalues: sortId (ref), sduiSurfaceLoadTimeTracker (copy), var11 (ref), chartsSortDetailConstantsModule (copy), fetchChartsSortDetailModule (copy)
			if sortId then
				local var15 = sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(var11, {
					eventName = chartsSortDetailConstantsModule.SurfaceLoadTimeEventName,
					metadata = { page = "refresh" }
				})
				var15.start("refresh")
				fetchChartsSortDetailModule(sortId, var15)
			end
		end, { sortId, var11 }),
		contentTag = compositionTags.ContentRegion.Body,
		stickyContentTag = compositionTags.ContentRegion.Header,
		additionalAnalyticsData = reactModule.useMemo(function() --[[ line: 92 ]]
			-- upvalues: p2 (ref)
			return if p2.pageContext then { pageContext = p2.pageContext } else nil
		end, { p2.pageContext }),
		pageTopPadding = p2.pageTopPadding
	})
end)