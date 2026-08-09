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
local fetchChartsSortDetailModule = require(charts.ChartsSortDetailPage.fetchChartsSortDetail)
local getChartsSortDetailPageKeyModule = require(charts.ChartsSortDetailPage.getChartsSortDetailPageKey)

local function _(p0, p1) --[[ line: 33 | named "getFromPropsOrNavigationParams" ]]
	return p0[p1] or p0.navigation and p0.navigation.getParam(p1)
end

return reactModule.memo(function(p2) --[[ line: 37 | named "ChartsSortDetailPage" ]]
	-- upvalues: reactModule (ref), getSduiClientPageScope (ref), chartsConstantsModule (ref), chartsPageScopeFieldsModule (ref), getChartsSortDetailPageKeyModule (ref), usePageScopeRef (ref), sduiSurfaceLoadTimeTracker (ref), chartsSortDetailConstantsModule (ref), fetchChartsSortDetailModule (ref), sduiPageEntryPoint (ref), appPage (ref), compositionTags (ref)
	local sortId = p2.sortId or p2.navigation and p2.navigation.getParam("sortId")
	local var10 = getChartsSortDetailPageKeyModule(sortId, nil, reactModule.useMemo(function() --[[ line: 42 ]]
		-- upvalues: getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy)
		return getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)
	end, {}))
	local pageTimer = p2.pageTimer or p2.navigation and p2.navigation.getParam("pageTimer")
	usePageScopeRef(var10)
	local var12 = reactModule.useMemo(function() --[[ line: 49 ]]
		-- upvalues: pageTimer (ref), sduiSurfaceLoadTimeTracker (copy), var10 (ref), chartsSortDetailConstantsModule (copy), getSduiClientPageScope (copy)
		local pageTimer_1 = pageTimer or sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(var10, {
			eventName = chartsSortDetailConstantsModule.SurfaceLoadTimeEventName,
			metadata = { page = "mount" }
		})
		getSduiClientPageScope(var10).set(sduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, pageTimer_1)
		
		return pageTimer_1
	end, { var10, pageTimer })
	reactModule.useEffect(function() --[[ line: 61 ]]
		-- upvalues: sortId (ref), fetchChartsSortDetailModule (copy), var12 (ref)
		if sortId then
			fetchChartsSortDetailModule(sortId, var12)
		end
	end, { sortId, var12 })
	
	return if sortId == nil then nil else reactModule.createElement(sduiPageEntryPoint, {
		includeNavigationHeaderBar = false,
		appPage = p2.pageContext or appPage.Games,
		routeName = appPage.GamesList,
		configKey = var10,
		pageTimer = var12,
		refresh = reactModule.useCallback(function() --[[ line: 67 ]]
			-- upvalues: sortId (ref), sduiSurfaceLoadTimeTracker (copy), var10 (ref), chartsSortDetailConstantsModule (copy), fetchChartsSortDetailModule (copy)
			if sortId then
				local var14 = sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(var10, {
					eventName = chartsSortDetailConstantsModule.SurfaceLoadTimeEventName,
					metadata = { page = "refresh" }
				})
				var14.start("refresh")
				fetchChartsSortDetailModule(sortId, var14)
			end
		end, { sortId, var10 }),
		contentTag = compositionTags.ContentRegion.Body,
		stickyContentTag = compositionTags.ContentRegion.Header,
		additionalAnalyticsData = reactModule.useMemo(function() --[[ line: 80 ]]
			-- upvalues: p2 (ref)
			return if p2.pageContext then { pageContext = p2.pageContext } else nil
		end, { p2.pageContext }),
		pageTopPadding = p2.pageTopPadding
	})
end)