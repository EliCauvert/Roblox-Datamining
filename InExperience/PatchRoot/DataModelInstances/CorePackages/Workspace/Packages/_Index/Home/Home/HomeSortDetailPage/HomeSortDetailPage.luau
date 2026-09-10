local home = script:FindFirstAncestor("Home")
local parent = home.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local loggingProtocolModule = require(parent.LoggingProtocol)
local _ = require(parent.Navigation)
local reactModule = require(parent.React)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sortDeeplinkFailureCounter = require(parent.DiscoveryAnalytics).Events.sortDeeplinkFailureCounter
local buildHomeSortDetailPageEntryModule = require(home.HomeSortDetailPage.buildHomeSortDetailPageEntry)
local fetchHomeSortDetailModule = require(home.HomeSortDetailPage.fetchHomeSortDetail)
local getHomeSortDetailPageKeyModule = require(home.HomeSortDetailPage.getHomeSortDetailPageKey)
local homeConstantsModule = require(home.HomeConstants)
local homeSortDetailConstantsModule = require(home.HomeSortDetailPage.HomeSortDetailConstants)
local homeSortDetailScopeFieldsModule = require(home.HomeSortDetailPage.HomeSortDetailScopeFields)
local fetchHomePageModule = require(home.fetchHomePage)
local refreshHomePageModule = require(home.refreshHomePage)
local sduiPageWrapperEntryPoint = sduiSharedUtilitiesModule.SduiPageWrapperEntryPoint
local sduiSurfaceLoadTimeTracker = sduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local uiStatus = sduiSharedUtilitiesModule.UiStatus
local useInputData = sduiSharedUtilitiesModule.useInputData
local usePageScopeRef = sduiSharedUtilitiesModule.usePageScopeRef
local useUiStatus = sduiSharedUtilitiesModule.useUiStatus
local _ = {
	InvalidSort = "InvalidSort",
	SortTokenFetchFailed = "SortTokenFetchFailed"
}

local function _(p1, p2)
	return p1[p2] or p1.navigation and p1.navigation.getParam(p2)
end

return reactModule.memo(function(p1)
	-- upvalues: getHomeSortDetailPageKeyModule (ref), useInputData (ref), homeConstantsModule (ref), useUiStatus (ref), reactModule (ref), usePageScopeRef (ref), sduiSharedUtilitiesModule (ref), homeSortDetailScopeFieldsModule (ref), sduiSurfaceLoadTimeTracker (ref), homeSortDetailConstantsModule (ref), loggingProtocolModule (ref), sortDeeplinkFailureCounter (ref), fetchHomePageModule (ref), uiStatus (ref), buildHomeSortDetailPageEntryModule (ref), fetchHomeSortDetailModule (ref), refreshHomePageModule (ref), sduiPageWrapperEntryPoint (ref), appPage (ref)
	local sortId = p1.sortId or p1.navigation and p1.navigation.getParam("sortId")
	local sortIndex = p1.sortIndex or p1.navigation and p1.navigation.getParam("sortIndex")
	local var1 = getHomeSortDetailPageKeyModule(sortId, sortIndex)
	local pageTimer = p1.pageTimer or p1.navigation and p1.navigation.getParam("pageTimer")
	local var2 = useInputData(homeConstantsModule.ConfigKey, homeConstantsModule.ContentIdentifier)
	local var3 = useUiStatus(homeConstantsModule.ConfigKey)
	local var4 = useUiStatus(var1)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(false)
	usePageScopeRef(var1)
	reactModule.useMemo(function()
		-- upvalues: sduiSharedUtilitiesModule (copy), var1 (ref), homeSortDetailScopeFieldsModule (copy), sortId (ref), sortIndex (ref)
		local sduiClientPageScope = sduiSharedUtilitiesModule.getSduiClientPageScope(var1)
		sduiClientPageScope.set(homeSortDetailScopeFieldsModule.SelectedSortId, sortId)
		sduiClientPageScope.set(homeSortDetailScopeFieldsModule.SelectedSortIndex, sortIndex)
	end, { var1, sortId, sortIndex })
	local var7 = reactModule.useMemo(function()
		-- upvalues: pageTimer (ref), sduiSurfaceLoadTimeTracker (copy), homeSortDetailConstantsModule (copy), sduiSharedUtilitiesModule (copy), var1 (ref)
		local pageTimer_1 = pageTimer or sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(homeSortDetailConstantsModule.SurfaceKey, {
			eventName = homeSortDetailConstantsModule.SurfaceLoadTimeEventName,
			metadata = { page = "mount" }
		})
		sduiSharedUtilitiesModule.getSduiClientPageScope(var1).set(sduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, pageTimer_1)
		
		return pageTimer_1
	end, { var1, pageTimer })
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref), loggingProtocolModule (copy), sortDeeplinkFailureCounter (copy), sortId (ref), p1 (ref)
		if var6.current then return end
		var6.current = true
		loggingProtocolModule.default:logRobloxTelemetryCounter(sortDeeplinkFailureCounter, 1, { isOmni = true, reason = p2, sortName = sortId })
		
		if p1.onSortUnavailable then
			p1.onSortUnavailable()
		end
	end, { p1.onSortUnavailable, sortId })
	reactModule.useEffect(function()
		-- upvalues: fetchHomePageModule (copy), sduiSharedUtilitiesModule (copy), homeConstantsModule (copy)
		fetchHomePageModule(sduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(homeConstantsModule.ConfigKey))
	end, {})
	reactModule.useEffect(function()
		-- upvalues: sortId (ref), var8 (ref), var3 (ref), uiStatus (copy), var2 (ref), buildHomeSortDetailPageEntryModule (copy), sortIndex (ref), var5 (ref), var1 (ref), fetchHomeSortDetailModule (copy), var7 (ref)
		if sortId == nil then
			var8("InvalidSort")
			
			return
		elseif var3 == uiStatus.Error then
			var8("SortTokenFetchFailed")
			
			return
		elseif var3 ~= uiStatus.Resolved or var2 == nil then return end
		if buildHomeSortDetailPageEntryModule(sortId, sortIndex) == nil then
			var8("InvalidSort")
			
			return
		elseif var5.current ~= var1 then
			var5.current = var1
			
			if fetchHomeSortDetailModule(sortId, sortIndex, var7) == nil then
				var8("SortTokenFetchFailed")
			end
		end
	end, {
		var1, var2, var3, var7, var8, sortId, sortIndex
	})
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), uiStatus (copy), var8 (ref), var3 (ref), var2 (ref), sortId (ref), buildHomeSortDetailPageEntryModule (copy), sortIndex (ref), sduiSharedUtilitiesModule (copy), var1 (ref)
		if var4 == uiStatus.Error then
			var8("SortTokenFetchFailed")
			
			return
		elseif var4 ~= uiStatus.Resolved or var3 ~= uiStatus.Resolved or (var2 == nil or sortId == nil) then return end
		if buildHomeSortDetailPageEntryModule(sortId, sortIndex) == nil or not (sduiSharedUtilitiesModule.getSduiApiStore().getRootConfig(var1, false) ~= nil) then
			var8("InvalidSort")
		end
	end, {
		var1, var4, var2, var3, var8, sortId, sortIndex
	})
	
	return if sortId == nil then nil else reactModule.createElement(sduiPageWrapperEntryPoint, {
		appPage = appPage.Home,
		routeName = appPage.GamesList,
		configKey = var1,
		contentIdentifier = homeSortDetailConstantsModule.Identifier,
		pageTimer = var7,
		refresh = reactModule.useCallback(function()
			-- upvalues: sortId (ref), sduiSurfaceLoadTimeTracker (copy), homeSortDetailConstantsModule (copy), refreshHomePageModule (copy)
			if sortId == nil then
				return nil
			end
			local var9 = sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(homeSortDetailConstantsModule.SurfaceKey, {
				eventName = homeSortDetailConstantsModule.SurfaceLoadTimeEventName,
				metadata = { page = "refresh" }
			})
			var9.start("refresh")
			local var10 = refreshHomePageModule()
			
			if var10 then
				return var10:finally(function()
					-- upvalues: var9 (ref)
					var9.logRefreshComplete()
				end)
			end
			var9.logRefreshComplete()
			
			return nil
		end, { sortId }),
		additionalAnalyticsData = { pageContext = p1.pageContext or appPage.Home },
		pageTopPadding = p1.pageTopPadding
	})
end)