local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local RetrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local TModule = require(CorePackages.Packages.t)
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UsePreviousFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.usePrevious
local UseScreenSizeFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useScreenSize
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local DiscoveryUtilsModule = require(CorePackages.Workspace.Packages.DiscoveryUtils)
local ValidatePropsFunction = DiscoveryUtilsModule.validateProps
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local SetSearchInGamesStatusFunction = Modules.LuaApp.Actions.SetSearchInGamesStatus
local SearchRetrievalStatus = Modules.LuaApp.Enum.SearchRetrievalStatus
local ApiFetchGameSearchResultsFunction = Modules.LuaApp.Thunks.Search.ApiFetchGameSearchResults
local RemoveTextSearchResultsFunction = Modules.LuaApp.Actions.RemoveTextSearchResults
local Modules1 = game:GetService("CoreGui").RobloxGui.Modules
local GamesSearchOmniFeedModule = require(Modules1.LuaApp.Components.Search.GamesSearchOmniFeed)
local GetAutoFetchingStatusModule = require(Modules1.LuaApp.Thunks.Search.getAutoFetchingStatus)
local RemoveSearchInGamesModule = require(Modules1.LuaApp.Actions.RemoveSearchInGames)
local FFlagAppIaScrollAway = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAppIaScrollAway
local LuaAppSearchNoResultsIconAlignment = game:DefineFastFlag("LuaAppSearchNoResultsIconAlignment", false)
local StrictInterfaceResult = TModule.strictInterface({
	searchUuid = TModule.string,
	omniSearchUuid = TModule.optional(TModule.string),
	searchParameters = TModule.table,
	onScrollDirectionChanged = TModule.optional(TModule.callback),
	isRoutedFromAutoSearch = TModule.optional(TModule.boolean),
	canvasTopPadding = if FFlagAppIaScrollAway then TModule.optional(TModule.number) else nil
})

return function(p1)
	-- upvalues: ValidatePropsFunction (copy), StrictInterfaceResult (copy), ReactModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseDispatchFunction (copy), UseScreenSizeFunction (copy), UseLocalizationFunction (copy), LuaAppSearchNoResultsIconAlignment (copy), UseSelectorFunction (copy), GetAutoFetchingStatusModule (copy), SearchRetrievalStatus (copy), AppPage (copy), ApiFetchGameSearchResultsFunction (copy), RemoveSearchInGamesModule (copy), SetSearchInGamesStatusFunction (copy), RemoveTextSearchResultsFunction (copy), UsePreviousFunction (copy), EmptyState (copy), DiscoveryUtilsModule (copy), DiscoveryTypesModule (copy), GamesSearchOmniFeedModule (copy), FFlagAppIaScrollAway (copy), LoadingStateContainer (copy), RetrievalStatus (copy)
	ValidatePropsFunction(StrictInterfaceResult, p1)
	local SearchUuid = p1.searchUuid
	local OmniSearchUuid = p1.omniSearchUuid
	local SearchParameters = p1.searchParameters
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseDispatchResult = UseDispatchFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		failedMessage = "Feature.EmptyStatePage.Message.NoInternet",
		noResultsText = if LuaAppSearchNoResultsIconAlignment then "CommonUI.Controls.NoResultsFound" else "Feature.GamePage.LabelNoSearchResults"
	})
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy), GetAutoFetchingStatusModule (upval), SearchParameters (copy), SearchUuid (copy), SearchRetrievalStatus (upval)
		local AutoFetchingStatusModule = if p1.isRoutedFromAutoSearch then GetAutoFetchingStatusModule(p2, SearchParameters.searchKeyword) else p2.RequestsStatus.SearchesInGamesStatus[SearchUuid] or SearchRetrievalStatus.NotStarted
		
		if AutoFetchingStatusModule == SearchRetrievalStatus.Removed then
			AutoFetchingStatusModule = SearchRetrievalStatus.NotStarted
		end
		return AutoFetchingStatusModule
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: SearchUuid (copy)
		return p2.Search.SearchesInGames[SearchUuid]
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		-- upvalues: AppPage (upval), SearchUuid (copy)
		return p2.Personalization.OrderedOmniItems[AppPage.SearchPage] and p2.Personalization.OrderedOmniItems[AppPage.SearchPage][SearchUuid] and p2.Personalization.OrderedOmniItems[AppPage.SearchPage][SearchUuid].allItems or nil
	end)
	local PaginationMethod = UseSelectorResult1 and UseSelectorResult1.paginationMethod
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseSelectorResult (copy), SearchRetrievalStatus (upval), UseStateResult2 (copy), UseDispatchResult (copy), ApiFetchGameSearchResultsFunction (upval), UseRoactServiceResult (copy), SearchParameters (copy), SearchUuid (copy), OmniSearchUuid (copy)
		if not p1.isRoutedFromAutoSearch then
			UseDispatchResult(ApiFetchGameSearchResultsFunction(UseRoactServiceResult, {
				isAppend = false,
				searchKeyword = SearchParameters.searchKeyword,
				searchUuid = SearchUuid,
				omniSearchUuid = OmniSearchUuid
			})):catch(function(Err)
				warn(`Error fetching game search results: {Err}`)
			end)
			
			return
		end
		if UseSelectorResult == SearchRetrievalStatus.Done then
			UseStateResult2(true)
		end
	end, {
		p1.isRoutedFromAutoSearch, UseSelectorResult, SearchUuid, OmniSearchUuid,
		SearchParameters.searchKeyword, UseRoactServiceResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), RemoveSearchInGamesModule (upval), SearchUuid (copy), SetSearchInGamesStatusFunction (upval), SearchRetrievalStatus (upval), RemoveTextSearchResultsFunction (upval)
		return function()
			-- upvalues: UseDispatchResult (upval), RemoveSearchInGamesModule (upval), SearchUuid (upval), SetSearchInGamesStatusFunction (upval), SearchRetrievalStatus (upval), RemoveTextSearchResultsFunction (upval)
			UseDispatchResult(RemoveSearchInGamesModule(SearchUuid))
			UseDispatchResult(SetSearchInGamesStatusFunction(SearchUuid, SearchRetrievalStatus.Removed))
			UseDispatchResult(RemoveTextSearchResultsFunction(SearchUuid))
		end
	end, { SearchUuid })
	local UsePreviousResult = UsePreviousFunction(UseSelectorResult)
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), UsePreviousResult (copy), SearchRetrievalStatus (upval), UseStateResult2 (copy)
		if UseSelectorResult ~= UsePreviousResult then
			if UseSelectorResult == SearchRetrievalStatus.Done then
				UseStateResult2(true)
				
				return
			end
			if UseSelectorResult == SearchRetrievalStatus.NotStarted or UseSelectorResult == SearchRetrievalStatus.Failed then
				UseStateResult2(false)
			end
		end
	end, { UseSelectorResult, UsePreviousResult })
	local NoResultsText = UseLocalizationResult.noResultsText
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseSelectorResult2 (copy), LuaAppSearchNoResultsIconAlignment (upval), ReactModule (upval), EmptyState (upval), NoResultsText (copy), DiscoveryUtilsModule (upval), UseScreenSizeResult (copy), DiscoveryTypesModule (upval), GamesSearchOmniFeedModule (upval), SearchUuid (copy), OmniSearchUuid (copy), UseSelectorResult1 (copy), p1 (copy), PaginationMethod (copy), FFlagAppIaScrollAway (upval)
		if UseSelectorResult2 and #UseSelectorResult2 ~= 0 then
			return (ReactModule.createElement(GamesSearchOmniFeedModule, {
				searchUuid = SearchUuid,
				omniSearchUuid = OmniSearchUuid,
				createEndOfScrollElement = not UseSelectorResult1.hasMoreRows,
				onScrollDirectionChanged = p1.onScrollDirectionChanged,
				paginationMethod = PaginationMethod,
				canvasTopPadding = if FFlagAppIaScrollAway then p1.canvasTopPadding else nil
			}))
		elseif LuaAppSearchNoResultsIconAlignment then
			return ReactModule.createElement(EmptyState, { text = NoResultsText })
		else
			local PageSideMargin = DiscoveryUtilsModule.getPageSideMargin(UseScreenSizeResult.X)
			
			return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				Padding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, DiscoveryTypesModule.Constants.GAME_GRID_PADDING),
					PaddingLeft = UDim.new(0, PageSideMargin),
					PaddingRight = UDim.new(0, PageSideMargin)
				}),
				NoResultsView = ReactModule.createElement(EmptyState, { text = NoResultsText })
			})
		end
	end, {
		UseSelectorResult1, SearchUuid, OmniSearchUuid, p1.onScrollDirectionChanged,
		UseScreenSizeResult, NoResultsText, PaginationMethod, UseSelectorResult2
	})
	local FailedMessage = UseLocalizationResult.failedMessage
	
	return ReactModule.createElement(LoadingStateContainer, {
		dataStatus = RetrievalStatus.fromRawValue(UseSelectorResult),
		renderOnLoading = UseStateResult and UseResult1 or nil,
		renderOnFailed = ReactModule.useCallback(function()
			-- upvalues: ReactModule (upval), EmptyState (upval), UseResult (copy), FailedMessage (copy)
			return ReactModule.createElement(EmptyState, { onActivated = UseResult, text = FailedMessage })
		end, { UseResult, FailedMessage }),
		renderOnLoaded = UseResult1
	})
end