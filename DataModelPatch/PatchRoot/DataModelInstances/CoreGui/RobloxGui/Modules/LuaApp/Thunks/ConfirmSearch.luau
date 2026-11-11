local IXPService = game:GetService("IXPService")
local CorePackages = game:GetService("CorePackages")
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local SessionType = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SessionType
local NavigationRoduxModule = require(CorePackages.Workspace.Packages.NavigationRodux)
local NavigateSidewaysFunction = NavigationRoduxModule.Thunks.NavigateSideways
local Selectors = NavigationRoduxModule.Selectors
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local GetAppFeaturePoliciesFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local SearchSourceEvent = require(CorePackages.Workspace.Packages.DiscoveryTypes).SearchSourceEvent
local DiscoveryUtilsModule = require(CorePackages.Workspace.Packages.DiscoveryUtils)
local SearchTypes = require(CorePackages.Workspace.Packages.RobloxAppEnums).SearchTypes
local NavigateToSearchResultsFunction = require(CorePackages.Workspace.Packages.SearchResults).navigateToSearchResults
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagSduiSearchResultsPageEnabled = SharedFlagsModule.FFlagSduiSearchResultsPageEnabled
local FFlagLuaAppSduiOpenSearchResultsWithQueryAction = SharedFlagsModule.FFlagLuaAppSduiOpenSearchResultsWithQueryAction
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local FFlagSignalsNavP3hMisc = SharedFlagsModule.FFlagSignalsNavP3hMisc
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local GetLegacyNavigationStoreFunction = NavigationRoduxModule.GetLegacyNavigationStore
local OmniSearchSessionUtil = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Sessions.OmniSearchSessionUtil
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SearchUuidModule = require(Modules.LuaApp.SearchUuid)
local SearchModule = require(Modules.LuaApp.Analytics.Events.search)
local CatalogSearchEventModule = require(Modules.LuaApp.Analytics.Events.catalogSearchEvent)
local SetSearchTypeModule = require(Modules.LuaApp.Actions.SetSearchType)
local SetSearchParametersModule = require(Modules.LuaApp.Actions.SetSearchParameters)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)

local function navigateToSearch(p1, Detail, OmniSearchInfo)
	-- upvalues: IXPService (copy), AppUserLayers (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateSidewaysFunction (copy)
	IXPService:LogUserLayerExposure(AppUserLayers.OmniSearchResultsPageUXExposureLayer)
	local config = {
		name = AppPage.SearchPage,
		key = tostring(Detail),
		detail = Detail,
		extraProps = { omniSearchInfo = OmniSearchInfo }
	}
	
	if FFlagSignalsNavP3Dispatch then
		NavigationCommands.sideways(NavigationCommands.fromLegacyPage(config), false)
		
		return
	else
		p1:dispatch(NavigateSidewaysFunction(config, false))
	end
end

return function(Text, p1)
	-- upvalues: SearchTypes (copy), SearchUuidModule (copy), FFlagSignalsNavP3hMisc (copy), GetLegacyNavigationStoreFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), SetSearchTypeModule (copy), SetSearchParametersModule (copy), DiscoveryUtilsModule (copy), OmniSearchSessionUtil (copy), FFlagLuaAppSduiOpenSearchResultsWithQueryAction (copy), SearchSourceEvent (copy), SearchModule (copy), SessionType (copy), GetAppFeaturePoliciesFunction (copy), FFlagSduiSearchResultsPageEnabled (copy), NavigateToSearchResultsFunction (copy), navigateToSearch (copy), CatalogSearchEventModule (copy), NavigationUtilsModule (copy)
	return function(p2)
		-- upvalues: p1 (copy), SearchTypes (upval), Text (ref), SearchUuidModule (upval), FFlagSignalsNavP3hMisc (upval), GetLegacyNavigationStoreFunction (upval), FFlagUseNavigationSelectors (upval), Selectors (upval), SetSearchTypeModule (upval), SetSearchParametersModule (upval), DiscoveryUtilsModule (upval), OmniSearchSessionUtil (upval), FFlagLuaAppSduiOpenSearchResultsWithQueryAction (upval), SearchSourceEvent (upval), SearchModule (upval), SessionType (upval), GetAppFeaturePoliciesFunction (upval), FFlagSduiSearchResultsPageEnabled (upval), NavigateToSearchResultsFunction (upval), navigateToSearch (upval), CatalogSearchEventModule (upval), NavigationUtilsModule (upval)
		local SearchType = p1.searchType
		
		if p1.isAutocompleteSuggestion and SearchType == SearchTypes.Auto then
			SearchType = SearchTypes.Games
		end
		if Text and #Text > 1950 then
			Text = string.sub(Text, 1, 1950)
		end
		local SearchUuidModuleResult = SearchUuidModule()
		local State = p2:getState()
		local CurrentLegacyRoute = if FFlagSignalsNavP3hMisc then GetLegacyNavigationStoreFunction(false).getCurrentLegacyRoute(false) elseif FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(State) else State.Navigation.history[#State.Navigation.history]
		p2:dispatch(SetSearchTypeModule(SearchUuidModuleResult, SearchType))
		p2:dispatch(SetSearchParametersModule(SearchUuidModuleResult, { isKeywordSuggestionEnabled = true, searchKeyword = Text }))
		
		if DiscoveryUtilsModule.isSearchTypeInOmniSearch(SearchType) then
			local Uuid = OmniSearchSessionUtil.generateUuid()
			OmniSearchSessionUtil.create(p1.sessionService, Uuid, Text, SearchType, SearchUuidModuleResult, FFlagLuaAppSduiOpenSearchResultsWithQueryAction and p1.sourceEvent or SearchSourceEvent.ConfirmSearch)
			
			if SearchType ~= SearchTypes.Auto then
				SearchModule(p1.eventIngest, SearchType, "search", Text, false, CurrentLegacyRoute[#CurrentLegacyRoute].name)
			end
			p1.sessionService:RemoveSession(SessionType.StructuralIdentifier.GameSearchAutocomplete)
			local OmniSearchInfo = { omniSearchUuid = Uuid, searchKeyword = Text }
			
			if not GetAppFeaturePoliciesFunction().getSearchWithoutNavigatingEnabled() then
				if FFlagSduiSearchResultsPageEnabled then
					NavigateToSearchResultsFunction(Text, SearchUuidModuleResult, Uuid, function()
						-- upvalues: navigateToSearch (upval), p2 (copy), SearchUuidModuleResult (copy), OmniSearchInfo (copy)
						navigateToSearch(p2, SearchUuidModuleResult, OmniSearchInfo)
					end)
					
					return
				else
					navigateToSearch(p2, SearchUuidModuleResult, OmniSearchInfo)
					
					return
				end
			end
		elseif SearchType == SearchTypes.Catalog then
			if FFlagLuaAppSduiOpenSearchResultsWithQueryAction then
				if p1.topBarAnalytics then
					p1.topBarAnalytics.reportSearched("catalog", Text)
				end
			else
				p1.topBarAnalytics.reportSearched("catalog", Text)
			end
			if p1.isAvatarAutocompleteEnabled then
				CatalogSearchEventModule(p1.eventIngest, "catalog", Text, p1.isAutocompleteSuggestion, p1.pageOwner, p1.allAutocompleteSuggestions)
			end
			NavigationUtilsModule.navigateToSearch(p1.navigation, SearchUuidModuleResult, { searchKeyword = Text })
		end
	end
end