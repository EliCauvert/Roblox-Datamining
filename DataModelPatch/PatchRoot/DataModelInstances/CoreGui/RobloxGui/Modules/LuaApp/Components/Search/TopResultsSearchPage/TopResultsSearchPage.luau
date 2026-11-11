local CorePackages = game:GetService("CorePackages")
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local ReactModule = require(CorePackages.Packages.React)
local PromiseModule = require(CorePackages.Packages.Promise)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local RetrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local ServerDrivenUiModule = require(CorePackages.Workspace.Packages.ServerDrivenUi)
local UseCollectionLayoutConfigFunction = require(CorePackages.Workspace.Packages.CollectionViews).useCollectionLayoutConfig
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local RemoveSduiRootConfigFunction = require(CorePackages.Workspace.Packages.ServerDrivenUi).RemoveSduiRootConfig
local RemoveTextSearchResultsFunction = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Actions.RemoveTextSearchResults
local GetTopSearchResultsFetchNameFunction = require(CorePackages.Workspace.Packages.DiscoveryUtils).getTopSearchResultsFetchName
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OmniFeedViewLoadMoreModule = require(Modules.Personalization.OmniFeed.FeedViews.OmniFeedViewLoadMore)
local ApiFetchTopSearchResultsModule = require(Modules.LuaApp.Thunks.Search.ApiFetchTopSearchResults.ApiFetchTopSearchResults)
local RemoveSearchInGamesModule = require(Modules.LuaApp.Actions.RemoveSearchInGames)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagRenameDeprecatedUIBloxTokens = SharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagLuaAppLayoutParamsInContext = SharedFlagsModule.FFlagLuaAppLayoutParamsInContext
local FFlagSduiSearchResultsPageEnabled = SharedFlagsModule.FFlagSduiSearchResultsPageEnabled
local SearchPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage.SearchPage
local IconsStatusOofXlarge = UIBloxModule.App.ImageSet.Images["icons/status/oof_xlarge"]

return function(p1)
	-- upvalues: FFlagSduiSearchResultsPageEnabled (copy), CorePackages (copy), UseDesignTokensFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), FFlagAppIaScrollAway (copy), ReactModule (copy), UseLocalizationFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseDispatchFunction (copy), ApiFetchTopSearchResultsModule (copy), PromiseModule (copy), RemoveSduiRootConfigFunction (copy), SearchPage (copy), RemoveSearchInGamesModule (copy), RemoveTextSearchResultsFunction (copy), UseSelectorFunction (copy), PerformFetch (copy), GetTopSearchResultsFetchNameFunction (copy), RetrievalStatus (copy), FFlagLuaAppLayoutParamsInContext (copy), UseCollectionLayoutConfigFunction (copy), ServerDrivenUiModule (copy), LoadingStateContainer (copy), EmptyState (copy), OmniFeedViewLoadMoreModule (copy), IconsStatusOofXlarge (copy)
	if FFlagSduiSearchResultsPageEnabled then
		local SduiSearchResultsPage = require(CorePackages.Workspace.Packages.SearchResults).SduiSearchResultsPage
		local UseDesignTokensResult = UseDesignTokensFunction()
		
		return ReactModule.createElement(SduiSearchResultsPage, {
			searchKeyword = p1.searchParameters.searchKeyword,
			searchUuid = p1.searchUuid,
			globalSessionId = p1.omniSearchUuid,
			pageTopPadding = ((if FFlagAppIaScrollAway then p1.canvasTopPadding else nil) or 0) + (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_600 else UseDesignTokensResult.Global.Size_300)
		})
	end
	local UseLocalizationResult = UseLocalizationFunction({
		requestFailed = "Feature.Toast.NetworkingError.SomethingIsWrong",
		noResultsFound = "CommonUI.Controls.NoResultsFound"
	})
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), ApiFetchTopSearchResultsModule (upval), UseRoactServiceResult (copy), p1 (copy), PromiseModule (upval)
		return UseDispatchResult(ApiFetchTopSearchResultsModule(UseRoactServiceResult, {
			searchVertical = "blended",
			keyword = p1.searchParameters.searchKeyword,
			searchUuid = p1.searchUuid,
			omniSearchUuid = p1.omniSearchUuid
		})):catch(function()
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve()
		end)
	end, {
		p1.searchParameters.searchKeyword,
		p1.searchUuid,
		p1.omniSearchUuid
	})
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), RemoveSduiRootConfigFunction (upval), SearchPage (upval), p1 (copy), RemoveSearchInGamesModule (upval), RemoveTextSearchResultsFunction (upval)
		return function()
			-- upvalues: UseDispatchResult (upval), RemoveSduiRootConfigFunction (upval), SearchPage (upval), p1 (upval), RemoveSearchInGamesModule (upval), RemoveTextSearchResultsFunction (upval)
			UseDispatchResult(RemoveSduiRootConfigFunction(`{SearchPage}_{p1.searchUuid}`))
			UseDispatchResult(RemoveSearchInGamesModule(p1.searchUuid))
			UseDispatchResult(RemoveTextSearchResultsFunction(p1.searchUuid))
		end
	end, { p1.searchUuid, UseDispatchResult })
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: PerformFetch (upval), GetTopSearchResultsFetchNameFunction (upval), p1 (copy), RetrievalStatus (upval)
		return RetrievalStatus.fromRawValue((PerformFetch.GetStatus(p2, GetTopSearchResultsFetchNameFunction("blended", p1.searchUuid))))
	end)
	local IsUseSelectorResultMatch = UseSelectorResult == RetrievalStatus.Done
	local UseStateResult, UseStateResult2 = ReactModule.useState(IsUseSelectorResultMatch)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), IsUseSelectorResultMatch (copy), UseStateResult2 (copy)
		if not UseStateResult and IsUseSelectorResultMatch then
			UseStateResult2(true)
		end
	end, { UseStateResult, IsUseSelectorResultMatch })
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: SearchPage (upval), p1 (copy)
		local OrderedOmniItemEntry = p2.Personalization.OrderedOmniItems[SearchPage] and p2.Personalization.OrderedOmniItems[SearchPage][p1.searchUuid] or nil
		
		return OrderedOmniItemEntry and OrderedOmniItemEntry.allItems or {}
	end)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Size600 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_600 else UseDesignTokensResult.Global.Size_300
	local v1 = nil
	local v2 = nil
	local UseRefResult = nil
	
	if FFlagLuaAppLayoutParamsInContext then
		v1, v36 = ReactModule.useState(nil)
	else
		UseRefResult = ReactModule.useRef(nil)
	end
	local UseCollectionLayoutConfigResult = if FFlagLuaAppLayoutParamsInContext then UseCollectionLayoutConfigFunction(v1) else nil
	local UseSduiContextFromRoduxAndProcessConfigsResult = ServerDrivenUiModule.useSduiContextFromRoduxAndProcessConfigs(SearchPage, if FFlagLuaAppLayoutParamsInContext then UseCollectionLayoutConfigResult else nil, `{SearchPage}_{p1.searchUuid}`)
	
	return ReactModule.createElement(LoadingStateContainer, {
		dataStatus = if UseStateResult then RetrievalStatus.Done else UseSelectorResult,
		renderOnFailed = function()
			-- upvalues: ReactModule (upval), EmptyState (upval), UseResult (copy), UseLocalizationResult (copy)
			return ReactModule.createElement(EmptyState, {
				onActivated = UseResult,
				text = UseLocalizationResult.requestFailed
			})
		end,
		renderOnLoaded = function()
			-- upvalues: UseSelectorResult1 (copy), ReactModule (upval), OmniFeedViewLoadMoreModule (upval), Size600 (copy), SearchPage (upval), UseResult (copy), p1 (copy), FFlagLuaAppLayoutParamsInContext (upval), v2 (ref), UseRefResult (ref), FFlagAppIaScrollAway (upval), UseSduiContextFromRoduxAndProcessConfigsResult (copy), EmptyState (upval), IconsStatusOofXlarge (upval), UseLocalizationResult (copy)
			return if UseSelectorResult1 and #UseSelectorResult1 > 0 then ReactModule.createElement(OmniFeedViewLoadMoreModule, {
				createEndOfScrollElement = true,
				impressionsTag = "TOPSEARCHRESULTS_FEEDITEM_IMPRESSIONS",
				analyticsContext = "TOPSEARCH_OMNIFEED",
				topPadding = Size600,
				pageContext = SearchPage,
				refresh = UseResult,
				omniFeedItems = UseSelectorResult1,
				onScrollDirectionChanged = p1.onScrollDirectionChanged,
				scrollingFrameRef = if FFlagLuaAppLayoutParamsInContext then v2 else UseRefResult,
				canvasTopPadding = if FFlagAppIaScrollAway then p1.canvasTopPadding else nil,
				sduiContext = UseSduiContextFromRoduxAndProcessConfigsResult
			}) else ReactModule.createElement(EmptyState, {
				icon = IconsStatusOofXlarge,
				text = UseLocalizationResult.noResultsFound
			})
		end
	})
end