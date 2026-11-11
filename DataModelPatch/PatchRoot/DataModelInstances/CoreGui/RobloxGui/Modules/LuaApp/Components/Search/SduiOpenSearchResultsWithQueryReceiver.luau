local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FFlagSignalsNavP3hMisc = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3hMisc
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(CorePackages.Workspace.Packages.RoactServiceTags)
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local AppSessionService = RoactServiceTagsModule.AppSessionService
local SearchSourceEvent = require(CorePackages.Workspace.Packages.DiscoveryTypes).SearchSourceEvent
local OpenSearchResultsWithQueryBridge = require(CorePackages.Workspace.Packages.ServerDrivenUi).OpenSearchResultsWithQueryBridge
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConfirmSearchModule = require(Modules.LuaApp.Thunks.ConfirmSearch)
local GetCurrentPageModule = if FFlagSignalsNavP3hMisc then nil else require(Modules.LuaApp.getCurrentPage)
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil

return ReactModule.memo(function()
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), AppSessionService (copy), FFlagSignalsNavP3hMisc (copy), UseSelectorFunction (copy), GetCurrentPageModule (copy), ReactModule (copy), OpenSearchResultsWithQueryBridge (copy), GetLegacyNavigationStore (copy), SearchSourceEvent (copy), ConfirmSearchModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppSessionService)
	local UseSelectorResult = if FFlagSignalsNavP3hMisc then nil else UseSelectorFunction(GetCurrentPageModule)
	ReactModule.useEffect(function()
		-- upvalues: OpenSearchResultsWithQueryBridge (upval), FFlagSignalsNavP3hMisc (upval), GetLegacyNavigationStore (upval), UseSelectorResult (copy), UseRoactServiceResult1 (copy), UseRoactServiceResult (copy), SearchSourceEvent (upval), UseDispatchResult (copy), ConfirmSearchModule (upval)
		local ConnectResult = OpenSearchResultsWithQueryBridge.connect(function(p1, SearchType)
			-- upvalues: FFlagSignalsNavP3hMisc (upval), GetLegacyNavigationStore (upval), UseSelectorResult (upval), UseRoactServiceResult1 (upval), UseRoactServiceResult (upval), SearchSourceEvent (upval), UseDispatchResult (upval), ConfirmSearchModule (upval)
			UseDispatchResult(ConfirmSearchModule(p1, {
				isAutocompleteSuggestion = false,
				isAvatarAutocompleteEnabled = false,
				allAutocompleteSuggestions = {},
				searchType = SearchType,
				pageOwner = if FFlagSignalsNavP3hMisc then GetLegacyNavigationStore(false).getCurrentPage(false).name else UseSelectorResult,
				sessionService = UseRoactServiceResult1,
				eventIngest = UseRoactServiceResult,
				sourceEvent = SearchSourceEvent.SearchDeepLink
			}))
		end)
		
		return function()
			-- upvalues: ConnectResult (copy)
			ConnectResult:disconnect()
		end
	end, {
		UseDispatchResult,
		UseRoactServiceResult,
		UseRoactServiceResult1,
		UseSelectorResult
	})
	
	return nil
end)