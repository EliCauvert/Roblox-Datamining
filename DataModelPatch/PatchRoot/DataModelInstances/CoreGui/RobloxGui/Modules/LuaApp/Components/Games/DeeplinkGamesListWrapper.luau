local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local GameSortGroups = require(CorePackages.Workspace.Packages.DiscoveryTypes).GameSortGroups
local LoggingProtocolModule = require(CorePackages.Workspace.Packages.LoggingProtocol)
local NavigateBackFunction = require(CorePackages.Workspace.Packages.NavigationRodux).Thunks.NavigateBack
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local TopicContentsReducer = require(CorePackages.Workspace.Packages.TopicContentsRodux).TopicContentsReducer
local RefreshExpiringSortTokensFunction = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Thunks.Games.RefreshExpiringSortTokens
local FetchStatusRoduxModule = require(CorePackages.Workspace.Packages.FetchStatusRodux)
local FetchStatusReducer = FetchStatusRoduxModule.FetchStatusReducer
local FetchStatusNamespace = FetchStatusRoduxModule.FetchStatusNamespace
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local RetrievalStatus1 = UIBloxModule.App.Loading.Enum.RetrievalStatus
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local GamesListModule = require(Modules.LuaApp.Components.Games.GamesList)
local SduiChartsSortDetailPageModule = require(Modules.Personalization.Games.SduiChartsSortDetailPage)
local GetChartsSortDetailPageKeyFunction = require(CorePackages.Workspace.Packages.Charts).getChartsSortDetailPageKey
local SduiSharedUtilitiesModule = require(CorePackages.Workspace.Packages.SduiSharedUtilities)
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local UseUiStatusFunction = SduiSharedUtilitiesModule.useUiStatus
local UiStatus = SduiSharedUtilitiesModule.UiStatus
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local SortDeeplinkFailureCounter = require(CorePackages.Workspace.Packages.DiscoveryAnalytics).Events.sortDeeplinkFailureCounter
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationPropsFunction = require(CorePackages.Workspace.Packages.RobloxAppNavigation).useNavigationProps
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local LuaAppDeeplinkGamesListWrapperFixBackgroundColor = game:DefineFastFlag("LuaAppDeeplinkGamesListWrapperFixBackgroundColor", false)
local LuaAppSortDeeplinkFetchingTimeoutInSec = game:DefineFastInt("LuaAppSortDeeplinkFetchingTimeoutInSec", 10)

local function _(p1, List)
	if not List then
		return nil
	end
	for i, value in List do
		if tostring(value.topicId) == p1 then
			return i
		end
	end
	return nil
end

local function DeeplinkGamesListWrapper()
	-- upvalues: UseNavigationPropsFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseTokensFunction (copy), UseSelectorFunction (copy), TopicContentsReducer (copy), AppPage (copy), FetchStatusNamespace (copy), GameSortGroups (copy), FetchStatusReducer (copy), RetrievalStatus (copy), ReactModule (copy), RefreshExpiringSortTokensFunction (copy), LoggingProtocolModule (copy), SortDeeplinkFailureCounter (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), LuaAppSortDeeplinkFetchingTimeoutInSec (copy), LoadingStateContainer (copy), RetrievalStatus1 (copy), GamesListModule (copy), LuaAppDeeplinkGamesListWrapperFixBackgroundColor (copy)
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(_, p2)
		return { isOmni = p2.isOmni, sortName = p2.sortName }
	end)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseTokensResult = UseTokensFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: TopicContentsReducer (upval)
		return p2.Personalization[TopicContentsReducer.key]
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: UseNavigationPropsResult (copy), AppPage (upval)
		return if UseNavigationPropsResult.isOmni then p2.OmniRecommendations and (p2.OmniRecommendations[AppPage.Home] and p2.OmniRecommendations[AppPage.Home].sorts) else nil
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		-- upvalues: TopicContentsReducer (upval), UseNavigationPropsResult (copy), FetchStatusNamespace (upval), AppPage (upval), GameSortGroups (upval), FetchStatusReducer (upval), RetrievalStatus (upval)
		if p2.Personalization[TopicContentsReducer.key][UseNavigationPropsResult.sortName] then
			return RetrievalStatus.Done
		end
		local OmniRecommendations = nil
		local Home = nil
		if UseNavigationPropsResult.isOmni then
			OmniRecommendations = FetchStatusNamespace.OmniRecommendations
			Home = AppPage.Home
		else
			OmniRecommendations = FetchStatusNamespace.GameSortToken
			Home = GameSortGroups.GamesList
		end
		return p2.Personalization[FetchStatusReducer.key][OmniRecommendations][Home]
	end)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			task.cancel(UseRefResult.current)
			UseRefResult.current = nil
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult2 (copy), RetrievalStatus (upval), UseNavigationPropsResult (copy), UseDispatchResult (copy), RefreshExpiringSortTokensFunction (upval), UseRoactServiceResult (copy), GameSortGroups (upval), UseResult (copy), UseSelectorResult (copy), LoggingProtocolModule (upval), SortDeeplinkFailureCounter (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateBackFunction (upval)
		if UseSelectorResult2 == RetrievalStatus.NotStarted then
			if not UseNavigationPropsResult.isOmni then
				UseDispatchResult(RefreshExpiringSortTokensFunction(UseRoactServiceResult, { GameSortGroups.GamesList }))
				
				return
			end
		elseif UseSelectorResult2 == RetrievalStatus.Done then
			UseResult()
			
			if not UseSelectorResult[UseNavigationPropsResult.sortName] then
				LoggingProtocolModule.default:logRobloxTelemetryCounter(SortDeeplinkFailureCounter, 1, {
					reason = "InvalidSort",
					sortName = UseNavigationPropsResult.sortName,
					isOmni = UseNavigationPropsResult.isOmni
				})
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.back()
					
					return
				else
					UseDispatchResult(NavigateBackFunction())
					
					return
				end
			end
		elseif UseSelectorResult2 == RetrievalStatus.Failed then
			UseResult()
			LoggingProtocolModule.default:logRobloxTelemetryCounter(SortDeeplinkFailureCounter, 1, {
				reason = "SortTokenFetchFailed",
				sortName = UseNavigationPropsResult.sortName,
				isOmni = UseNavigationPropsResult.isOmni
			})
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.back()
				
				return
			end
			UseDispatchResult(NavigateBackFunction())
		end
	end, {
		UseNavigationPropsResult.sortName, UseNavigationPropsResult.isOmni,
		UseSelectorResult2, UseSelectorResult, UseDispatchResult,
		UseRoactServiceResult, UseResult
	})
	ReactModule.useEffect(function()
		-- upvalues: LuaAppSortDeeplinkFetchingTimeoutInSec (upval), UseRefResult (copy), LoggingProtocolModule (upval), SortDeeplinkFailureCounter (upval), UseNavigationPropsResult (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval), UseResult (copy)
		if LuaAppSortDeeplinkFetchingTimeoutInSec >= 0 then
			UseRefResult.current = task.delay(LuaAppSortDeeplinkFetchingTimeoutInSec, function()
				-- upvalues: LoggingProtocolModule (upval), SortDeeplinkFailureCounter (upval), UseNavigationPropsResult (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateBackFunction (upval)
				LoggingProtocolModule.default:logRobloxTelemetryCounter(SortDeeplinkFailureCounter, 1, {
					reason = "SortTokenFetchTimeout",
					sortName = UseNavigationPropsResult.sortName,
					isOmni = UseNavigationPropsResult.isOmni
				})
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.back()
					
					return
				else
					UseDispatchResult(NavigateBackFunction())
				end
			end)
		end
		return function()
			-- upvalues: UseResult (upval)
			UseResult()
		end
	end, {
		UseNavigationPropsResult.sortName,
		UseNavigationPropsResult.isOmni,
		UseDispatchResult,
		UseResult
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseNavigationPropsResult (copy), UseSelectorResult1 (copy)
		local SortName = UseNavigationPropsResult.sortName
		
		if not UseSelectorResult1 then
			return nil
		end
		for i, value in UseSelectorResult1 do
			if tostring(value.topicId) == SortName then
				return i
			end
		end
		return nil
	end, { UseNavigationPropsResult.sortName, UseSelectorResult1 })
	local Element = ReactModule.createElement(LoadingStateContainer, {
		dataStatus = RetrievalStatus1.fromRawValue(UseSelectorResult2),
		renderOnLoaded = function()
			-- upvalues: ReactModule (upval), GamesListModule (upval), UseNavigationPropsResult (copy), UseMemoResult (copy)
			return ReactModule.createElement(GamesListModule, {
				pageContext = "Deeplink",
				initialSortName = UseNavigationPropsResult.sortName,
				initialSortIndex = UseMemoResult,
				isOmni = UseNavigationPropsResult.isOmni
			})
		end
	})
	local Surface0 = if LuaAppDeeplinkGamesListWrapperFixBackgroundColor then UseTokensResult.Color.Surface.Surface_0 else nil
	
	return if LuaAppDeeplinkGamesListWrapperFixBackgroundColor then ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Surface0.Color3,
		BackgroundTransparency = Surface0.Transparency
	}, { GamesList = Element }) else Element
end

local function SduiChartsDeeplinkRedirectGuard(p2)
	-- upvalues: GetChartsSortDetailPageKeyFunction (copy), UseUiStatusFunction (copy), ReactModule (copy), GetSduiApiStoreFunction (copy), SignalsReactModule (copy), UseDispatchFunction (copy), UiStatus (copy), LoggingProtocolModule (copy), SortDeeplinkFailureCounter (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), LuaAppSortDeeplinkFetchingTimeoutInSec (copy), SduiChartsSortDetailPageModule (copy)
	local SortId = p2.sortId
	local ChartsSortDetailPageKey = GetChartsSortDetailPageKeyFunction(SortId)
	local UseUiStatusResult = UseUiStatusFunction(ChartsSortDetailPageKey)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p3): boolean
		-- upvalues: GetSduiApiStoreFunction (upval), ChartsSortDetailPageKey (copy)
		return GetSduiApiStoreFunction().getRootConfig(ChartsSortDetailPageKey, p3) ~= nil
	end, { ChartsSortDetailPageKey })))
	local UseDispatchResult = UseDispatchFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			task.cancel(UseRefResult.current)
			UseRefResult.current = nil
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseUiStatusResult (copy), UiStatus (upval), UseResult (copy), LoggingProtocolModule (upval), SortDeeplinkFailureCounter (upval), SortId (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval), UseSignalStateResult (copy)
		if UseUiStatusResult == UiStatus.Error then
			UseResult()
			LoggingProtocolModule.default:logRobloxTelemetryCounter(SortDeeplinkFailureCounter, 1, {
				reason = "SortTokenFetchFailed",
				isOmni = false,
				sortName = SortId
			})
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.back()
				
				return
			else
				UseDispatchResult(NavigateBackFunction())
				
				return
			end
		elseif UseUiStatusResult == UiStatus.Resolved and not UseSignalStateResult then
			UseResult()
			LoggingProtocolModule.default:logRobloxTelemetryCounter(SortDeeplinkFailureCounter, 1, {
				reason = "InvalidSort",
				isOmni = false,
				sortName = SortId
			})
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.back()
				
				return
			else
				UseDispatchResult(NavigateBackFunction())
				
				return
			end
		elseif UseUiStatusResult == UiStatus.Resolved and UseSignalStateResult then
			UseResult()
		end
	end, {
		UseUiStatusResult,
		UseSignalStateResult,
		SortId,
		UseDispatchResult,
		UseResult
	})
	ReactModule.useEffect(function()
		-- upvalues: LuaAppSortDeeplinkFetchingTimeoutInSec (upval), UseRefResult (copy), LoggingProtocolModule (upval), SortDeeplinkFailureCounter (upval), SortId (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval), UseResult (copy)
		if LuaAppSortDeeplinkFetchingTimeoutInSec >= 0 then
			UseRefResult.current = task.delay(LuaAppSortDeeplinkFetchingTimeoutInSec, function()
				-- upvalues: LoggingProtocolModule (upval), SortDeeplinkFailureCounter (upval), SortId (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateBackFunction (upval)
				LoggingProtocolModule.default:logRobloxTelemetryCounter(SortDeeplinkFailureCounter, 1, {
					reason = "SortTokenFetchTimeout",
					isOmni = false,
					sortName = SortId
				})
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.back()
					
					return
				else
					UseDispatchResult(NavigateBackFunction())
				end
			end)
		end
		return function()
			-- upvalues: UseResult (upval)
			UseResult()
		end
	end, { SortId, UseDispatchResult, UseResult })
	
	return ReactModule.createElement(SduiChartsSortDetailPageModule, { pageContext = "Deeplink", sortId = SortId })
end

return if SharedFlagsModule.FFlagLuaAppChartsAppPage then function()
	-- upvalues: UseNavigationPropsFunction (copy), ReactModule (copy), SduiChartsDeeplinkRedirectGuard (copy), DeeplinkGamesListWrapper (copy)
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(_, p2)
		return { isOmni = p2.isOmni, sortName = p2.sortName }
	end)
	
	return if UseNavigationPropsResult.isOmni then ReactModule.createElement(DeeplinkGamesListWrapper) else ReactModule.createElement(SduiChartsDeeplinkRedirectGuard, { sortId = UseNavigationPropsResult.sortName })
end else DeeplinkGamesListWrapper