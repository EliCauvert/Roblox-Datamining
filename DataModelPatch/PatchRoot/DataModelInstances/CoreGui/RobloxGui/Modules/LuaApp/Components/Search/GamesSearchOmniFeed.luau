local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local _ = require(CorePackages.Workspace.Packages.AppCommonLib)
local FeedScrollFunction = require(CorePackages.Workspace.Packages.ScrollTelemetry).feedScroll
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local Context = require(CorePackages.Workspace.Packages.DiscoveryAnalytics).Constants.Context
local ServerDrivenUiModule = require(CorePackages.Workspace.Packages.ServerDrivenUi)
local UseCollectionLayoutConfigFunction = require(CorePackages.Workspace.Packages.CollectionViews).useCollectionLayoutConfig
local OmniFeedTypes = require(CorePackages.Workspace.Packages.DiscoveryTypes).OmniFeedTypes
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local FetchDataWithErrorToastsFunction = Modules.LuaApp.Thunks.FetchDataWithErrorToasts
local SearchRetrievalStatus = Modules.LuaApp.Enum.SearchRetrievalStatus
local ApiFetchGameSearchResultsFunction = Modules.LuaApp.Thunks.Search.ApiFetchGameSearchResults
local PaginationMethod = Modules.LuaApp.Enum.PaginationMethod
local OmniFeedViewLoadMoreModule = require(game:GetService("CoreGui").RobloxGui.Modules.Personalization.OmniFeed.FeedViews.OmniFeedViewLoadMore)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagLuaAppLayoutParamsInContext = SharedFlagsModule.FFlagLuaAppLayoutParamsInContext

return function(p1)
	-- upvalues: AppPage (copy), FFlagLuaAppLayoutParamsInContext (copy), ReactModule (copy), UseLocalizationFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), AppEventIngestService (copy), UseSelectorFunction (copy), UseDispatchFunction (copy), FetchDataWithErrorToastsFunction (copy), ApiFetchGameSearchResultsFunction (copy), MutedErrorFunction (copy), FeedScrollFunction (copy), PaginationMethod (copy), UseCollectionLayoutConfigFunction (copy), ServerDrivenUiModule (copy), OmniFeedViewLoadMoreModule (copy), Context (copy), SearchRetrievalStatus (copy), OmniFeedTypes (copy), FFlagAppIaScrollAway (copy)
	local SearchPage = AppPage.SearchPage
	local UseRefResult = if FFlagLuaAppLayoutParamsInContext then nil else ReactModule.useRef(nil)
	local v1 = nil
	local v2 = nil
	
	if FFlagLuaAppLayoutParamsInContext then
		v1, v19 = ReactModule.useState(nil)
	end
	local UseLocalizationResult = UseLocalizationFunction({
		loadMoreButtonText = "Search.GlobalSearch.Action.LoadMore"
	})
	local SearchUuid = p1.searchUuid
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppEventIngestService)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: SearchUuid (copy)
		return p2.Search.SearchesInGames[SearchUuid]
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: SearchUuid (copy)
		return if SearchUuid and p2.SearchesParameters[SearchUuid] then p2.SearchesParameters[SearchUuid].searchKeyword else nil
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		-- upvalues: SearchUuid (copy)
		return p2.RequestsStatus.SearchesInGamesStatus[SearchUuid]
	end)
	local UseSelectorResult3 = UseSelectorFunction(function(p2)
		-- upvalues: SearchPage (copy), SearchUuid (copy)
		return p2.Personalization.OrderedOmniItems[SearchPage] and p2.Personalization.OrderedOmniItems[SearchPage][SearchUuid] or nil
	end)
	local AllItems = UseSelectorResult3 and UseSelectorResult3.allItems or {}
	local UseSelectorResult4 = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)
	local UseDispatchResult = UseDispatchFunction()
	
	local function v31()
		-- upvalues: UseDispatchResult (copy), FetchDataWithErrorToastsFunction (upval), ApiFetchGameSearchResultsFunction (upval), UseRoactServiceResult (copy), UseSelectorResult1 (copy), p1 (copy)
		return UseDispatchResult(FetchDataWithErrorToastsFunction(ApiFetchGameSearchResultsFunction(UseRoactServiceResult, {
			isAppend = true,
			searchKeyword = UseSelectorResult1,
			searchUuid = p1.searchUuid,
			omniSearchUuid = p1.omniSearchUuid
		})))
	end
	
	local HasMoreRows = p1.paginationMethod == PaginationMethod.Button and UseSelectorResult.hasMoreRows
	local UseCollectionLayoutConfigResult = if FFlagLuaAppLayoutParamsInContext then UseCollectionLayoutConfigFunction(v1) else nil
	
	return ReactModule.createElement(OmniFeedViewLoadMoreModule, {
		impressionsTag = "SEARCHRESULTS_FEEDITEM_IMPRESSIONS",
		pageContext = SearchPage,
		refresh = ReactModule.useCallback(function()
			-- upvalues: UseDispatchResult (copy), FetchDataWithErrorToastsFunction (upval), ApiFetchGameSearchResultsFunction (upval), UseRoactServiceResult (copy), UseSelectorResult1 (copy), SearchUuid (copy), p1 (copy)
			return UseDispatchResult(FetchDataWithErrorToastsFunction(ApiFetchGameSearchResultsFunction(UseRoactServiceResult, {
				isAppend = false,
				searchKeyword = UseSelectorResult1,
				searchUuid = SearchUuid,
				omniSearchUuid = p1.omniSearchUuid
			})))
		end, {
			UseDispatchResult,
			UseRoactServiceResult,
			UseSelectorResult1,
			SearchUuid,
			p1.omniSearchUuid
		}),
		omniFeedItems = AllItems,
		scrollingFrameRef = if FFlagLuaAppLayoutParamsInContext then v2 else UseRefResult,
		analyticsContext = Context.SearchExperienceTile,
		loadNext = UseSelectorResult.hasMoreRows and UseSelectorResult2 ~= SearchRetrievalStatus.Fetching and v31 or nil,
		createEndOfScrollElement = p1.createEndOfScrollElement,
		onScrollDirectionChanged = p1.onScrollDirectionChanged,
		topPadding = if AllItems[1] and AllItems[1].treatmentType == OmniFeedTypes.SearchGameGrid then 26 else 0,
		sendScrollEvent = function(Distance, ScrollDuration, StartPos)
			-- upvalues: FFlagLuaAppLayoutParamsInContext (upval), v1 (ref), UseRefResult (copy), MutedErrorFunction (upval), UseSelectorResult4 (copy), FeedScrollFunction (upval), UseRoactServiceResult1 (copy), SearchPage (copy)
			local Current = if FFlagLuaAppLayoutParamsInContext then v1 else UseRefResult.current
			local ScrollingDirection = if Current then Current.ScrollingDirection else nil
			
			if ScrollingDirection then
				local X = 0
				
				if Current then
					if ScrollingDirection == Enum.ScrollingDirection.X then
						X = Current.AbsoluteSize.X
					elseif ScrollingDirection == Enum.ScrollingDirection.Y then
						X = Current.AbsoluteSize.Y
					else
						MutedErrorFunction(`Direction {ScrollingDirection.Name} is an unsupported option for feedScroll event`)
					end
				end
				FeedScrollFunction(UseRoactServiceResult1, SearchPage, ScrollingDirection, {
					distance = Distance,
					screenSizeX = UseSelectorResult4.X,
					screenSizeY = UseSelectorResult4.Y,
					scrollAreaSize = X,
					scrollDepth = if X > 0 then Distance / X else nil,
					startDepth = if X > 0 then StartPos / X else nil,
					startPos = StartPos,
					scrollDuration = ScrollDuration
				})
			end
		end,
		hasNextPage = HasMoreRows,
		loadMoreButtonText = if HasMoreRows and UseSelectorResult2 ~= SearchRetrievalStatus.Fetching and v31 then UseLocalizationResult.loadMoreButtonText else nil,
		canvasTopPadding = if FFlagAppIaScrollAway then p1.canvasTopPadding else nil,
		sduiContext = ServerDrivenUiModule.useSduiContextFromRoduxAndProcessConfigs(SearchPage, if FFlagLuaAppLayoutParamsInContext then UseCollectionLayoutConfigResult else nil, `{SearchPage}_{SearchUuid}`)
	})
end