local Home = script:FindFirstAncestor("Home")
local Parent = Home.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local _ = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SortDeeplinkFailureCounter = require(Parent.DiscoveryAnalytics).Events.sortDeeplinkFailureCounter
local BuildHomeSortDetailPageEntryModule = require(Home.HomeSortDetailPage.buildHomeSortDetailPageEntry)
local FetchHomeSortDetailModule = require(Home.HomeSortDetailPage.fetchHomeSortDetail)
local GetHomeSortDetailPageKeyModule = require(Home.HomeSortDetailPage.getHomeSortDetailPageKey)
local HomeConstantsModule = require(Home.HomeConstants)
local HomeSortDetailConstantsModule = require(Home.HomeSortDetailPage.HomeSortDetailConstants)
local HomeSortDetailScopeFieldsModule = require(Home.HomeSortDetailPage.HomeSortDetailScopeFields)
local FetchHomePageModule = require(Home.fetchHomePage)
local RefreshHomePageModule = require(Home.refreshHomePage)
local SduiPageWrapperEntryPoint = SduiSharedUtilitiesModule.SduiPageWrapperEntryPoint
local SduiSurfaceLoadTimeTracker = SduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local UiStatus = SduiSharedUtilitiesModule.UiStatus
local UseInputDataFunction = SduiSharedUtilitiesModule.useInputData
local UsePageScopeRefFunction = SduiSharedUtilitiesModule.usePageScopeRef
local UseUiStatusFunction = SduiSharedUtilitiesModule.useUiStatus
local FFlagLuaAppSduiHomeSortDetailPageContext = require(Parent.SharedFlags).FFlagLuaAppSduiHomeSortDetailPageContext

local function _(p1, p2) --[[ Line: 47 | Named "getFromPropsOrNavigationParams" ]]
	return p1[p2] or p1.navigation and p1.navigation.getParam(p2)
end

return ReactModule.memo(function(p1) --[[ Line: 51 | Named "HomeSortDetailPage" ]]
	-- upvalues: GetHomeSortDetailPageKeyModule (copy), UseInputDataFunction (copy), HomeConstantsModule (copy), UseUiStatusFunction (copy), ReactModule (copy), UsePageScopeRefFunction (copy), SduiSharedUtilitiesModule (copy), HomeSortDetailScopeFieldsModule (copy), SduiSurfaceLoadTimeTracker (copy), HomeSortDetailConstantsModule (copy), LoggingProtocolModule (copy), SortDeeplinkFailureCounter (copy), FetchHomePageModule (copy), UiStatus (copy), BuildHomeSortDetailPageEntryModule (copy), FetchHomeSortDetailModule (copy), RefreshHomePageModule (copy), SduiPageWrapperEntryPoint (copy), FFlagLuaAppSduiHomeSortDetailPageContext (copy), AppPage (copy)
	local SortId = p1.sortId or p1.navigation and p1.navigation.getParam("sortId")
	local SortIndex = p1.sortIndex or p1.navigation and p1.navigation.getParam("sortIndex")
	local HomeSortDetailPageKeyModule = GetHomeSortDetailPageKeyModule(SortId, SortIndex)
	local PageTimer = p1.pageTimer or p1.navigation and p1.navigation.getParam("pageTimer")
	local UseInputDataResult = UseInputDataFunction(HomeConstantsModule.ConfigKey, HomeConstantsModule.ContentIdentifier)
	local UseUiStatusResult = UseUiStatusFunction(HomeConstantsModule.ConfigKey)
	local UseUiStatusResult1 = UseUiStatusFunction(HomeSortDetailPageKeyModule)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	UsePageScopeRefFunction(HomeSortDetailPageKeyModule)
	ReactModule.useMemo(function() --[[ Line: 64 ]]
		-- upvalues: SduiSharedUtilitiesModule (upval), HomeSortDetailPageKeyModule (copy), HomeSortDetailScopeFieldsModule (upval), SortId (copy), SortIndex (copy)
		local SduiClientPageScope = SduiSharedUtilitiesModule.getSduiClientPageScope(HomeSortDetailPageKeyModule)
		SduiClientPageScope.set(HomeSortDetailScopeFieldsModule.SelectedSortId, SortId)
		SduiClientPageScope.set(HomeSortDetailScopeFieldsModule.SelectedSortIndex, SortIndex)
	end, { HomeSortDetailPageKeyModule, SortId, SortIndex })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 70 ]]
		-- upvalues: PageTimer (copy), SduiSurfaceLoadTimeTracker (upval), HomeSortDetailConstantsModule (upval), SduiSharedUtilitiesModule (upval), HomeSortDetailPageKeyModule (copy)
		local PageTimer1 = PageTimer or SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(HomeSortDetailConstantsModule.SurfaceKey, {
			eventName = HomeSortDetailConstantsModule.SurfaceLoadTimeEventName,
			metadata = { page = "mount" }
		})
		SduiSharedUtilitiesModule.getSduiClientPageScope(HomeSortDetailPageKeyModule).set(SduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, PageTimer1)
		
		return PageTimer1
	end, { HomeSortDetailPageKeyModule, PageTimer })
	local UseResult = ReactModule.useCallback(function(Reason) --[[ Line: 83 ]]
		-- upvalues: UseRefResult1 (copy), LoggingProtocolModule (upval), SortDeeplinkFailureCounter (upval), SortId (copy), p1 (copy)
		if UseRefResult1.current then return end
		UseRefResult1.current = true
		LoggingProtocolModule.default:logRobloxTelemetryCounter(SortDeeplinkFailureCounter, 1, { isOmni = true, reason = Reason, sortName = SortId })
		
		if p1.onSortUnavailable then
			p1.onSortUnavailable()
		end
	end, { p1.onSortUnavailable, SortId })
	ReactModule.useEffect(function() --[[ Line: 98 ]]
		-- upvalues: FetchHomePageModule (upval), SduiSharedUtilitiesModule (upval), HomeConstantsModule (upval)
		FetchHomePageModule(SduiSharedUtilitiesModule.SduiLoadTimer.createLoadTimer(HomeConstantsModule.ConfigKey))
	end, {})
	ReactModule.useEffect(function() --[[ Line: 103 ]]
		-- upvalues: SortId (copy), UseResult (copy), UseUiStatusResult (copy), UiStatus (upval), UseInputDataResult (copy), BuildHomeSortDetailPageEntryModule (upval), SortIndex (copy), UseRefResult (copy), HomeSortDetailPageKeyModule (copy), FetchHomeSortDetailModule (upval), UseMemoResult (copy)
		if SortId == nil then
			UseResult("InvalidSort")
			
			return
		end
		if UseUiStatusResult == UiStatus.Error then
			UseResult("SortTokenFetchFailed")
			
			return
		end
		if UseUiStatusResult ~= UiStatus.Resolved or UseInputDataResult == nil then return end
		if BuildHomeSortDetailPageEntryModule(SortId, SortIndex) == nil then
			UseResult("InvalidSort")
			
			return
		end
		if UseRefResult.current ~= HomeSortDetailPageKeyModule then
			UseRefResult.current = HomeSortDetailPageKeyModule
			
			if FetchHomeSortDetailModule(SortId, SortIndex, UseMemoResult) == nil then
				UseResult("SortTokenFetchFailed")
			end
		end
	end, {
		HomeSortDetailPageKeyModule, UseInputDataResult, UseUiStatusResult,
		UseMemoResult, UseResult, SortId, SortIndex
	})
	ReactModule.useEffect(function() --[[ Line: 141 ]]
		-- upvalues: UseUiStatusResult1 (copy), UiStatus (upval), UseResult (copy), UseUiStatusResult (copy), UseInputDataResult (copy), SortId (copy), BuildHomeSortDetailPageEntryModule (upval), SortIndex (copy), SduiSharedUtilitiesModule (upval), HomeSortDetailPageKeyModule (copy)
		if UseUiStatusResult1 == UiStatus.Error then
			UseResult("SortTokenFetchFailed")
			
			return
		end
		if UseUiStatusResult1 ~= UiStatus.Resolved or UseUiStatusResult ~= UiStatus.Resolved or UseInputDataResult == nil or SortId == nil then return end
		local HasRootConfig = SduiSharedUtilitiesModule.getSduiApiStore().getRootConfig(HomeSortDetailPageKeyModule, false) ~= nil
		
		if BuildHomeSortDetailPageEntryModule(SortId, SortIndex) == nil or not HasRootConfig then
			UseResult("InvalidSort")
		end
	end, {
		HomeSortDetailPageKeyModule, UseUiStatusResult1, UseInputDataResult,
		UseUiStatusResult, UseResult, SortId, SortIndex
	})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 173 ]]
		-- upvalues: SortId (copy), SduiSurfaceLoadTimeTracker (upval), HomeSortDetailConstantsModule (upval), RefreshHomePageModule (upval)
		if SortId == nil then
			return nil
		end
		local LoadTimerWithSurfaceLoadTime = SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(HomeSortDetailConstantsModule.SurfaceKey, {
			eventName = HomeSortDetailConstantsModule.SurfaceLoadTimeEventName,
			metadata = { page = "refresh" }
		})
		LoadTimerWithSurfaceLoadTime.start("refresh")
		local RefreshHomePageModuleResult = RefreshHomePageModule()
		
		if RefreshHomePageModuleResult then
			return RefreshHomePageModuleResult:finally(function() --[[ Line: 188 ]]
				-- upvalues: LoadTimerWithSurfaceLoadTime (copy)
				LoadTimerWithSurfaceLoadTime.logRefreshComplete()
			end)
		else
			LoadTimerWithSurfaceLoadTime.logRefreshComplete()
			
			return nil
		end
	end, { SortId })
	
	return if SortId == nil then nil else ReactModule.createElement(SduiPageWrapperEntryPoint, {
		appPage = FFlagLuaAppSduiHomeSortDetailPageContext and p1.pageContext or AppPage.Home,
		routeName = AppPage.GamesList,
		configKey = HomeSortDetailPageKeyModule,
		contentIdentifier = HomeSortDetailConstantsModule.Identifier,
		pageTimer = UseMemoResult,
		refresh = UseResult1,
		additionalAnalyticsData = { pageContext = p1.pageContext or AppPage.Home },
		pageTopPadding = p1.pageTopPadding
	})
end)