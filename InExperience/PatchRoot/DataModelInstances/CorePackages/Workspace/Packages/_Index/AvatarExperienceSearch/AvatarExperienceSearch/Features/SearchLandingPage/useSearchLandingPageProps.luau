local AvatarExperienceSearch = script:FindFirstAncestor("AvatarExperienceSearch")
local Parent = AvatarExperienceSearch.Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local DeviceOrientationMode = require(Parent.RobloxAppEnums).DeviceOrientationMode
local IxpUtilsModule = require(Parent.IxpUtils)
local DebounceModule = require(AvatarExperienceSearch.Utils.debounce)
local NormalizeKeywordModule = require(AvatarExperienceSearch.Utils.normalizeKeyword)
local RecentSearchTermsAppStorageModule = require(AvatarExperienceSearch.Utils.RecentSearchTermsAppStorage)
local CounterModule = require(AvatarExperienceSearch.Enums.Counter)
local StatModule = require(AvatarExperienceSearch.Enums.Stat)
local SuggestedItemTypeEnumModule = require(AvatarExperienceSearch.Enums.SuggestedItemTypeEnum)
local _ = require(AvatarExperienceSearch.Components.SuggestedItemList)
local _ = require(AvatarExperienceSearch.Components.SuggestedItem)
local _ = require(script.Parent.SearchLandingPage)
local _ = require(AvatarExperienceSearch.Store.Types)
local UseRecentlyViewedSearchItemsWidgetPropsModule = require(AvatarExperienceSearch.Features.RecentlyViewedSearchItemsWidget.useRecentlyViewedSearchItemsWidgetProps)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local GetFIntAXMaxAutocompleteSearchTextLenModule = require(AvatarExperienceSearch.Flags.GetFIntAXMaxAutocompleteSearchTextLen)
local FFlagAXHideSearchTrendingChipsInAutocompleteModule = require(AvatarExperienceSearch.Flags.FFlagAXHideSearchTrendingChipsInAutocomplete)
local AXRecentlyViewedSearchItemsIXPTest = require(Parent.AXCommon).Experiments.AXRecentlyViewedSearchItemsIXPTest
local FFlagAXSearchAndCancelLogging = require(Parent.AvatarExperienceFlags).FFlagAXSearchAndCancelLogging
local FFlagAXUnifiedAutocompleteEndpoint = require(Parent.AvatarExperienceFlags).FFlagAXUnifiedAutocompleteEndpoint
local GetAutocompleteQueryKeyModule = require(AvatarExperienceSearch.Utils.getAutocompleteQueryKey)
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local SendUnifiedEventLogFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventLog
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local UnifiedLoggingElementNameEnums = AvatarExperienceAnalyticsModule.Enums.UnifiedLoggingElementNameEnums
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface

local function getRecentSearchTerms(p1)
	-- upvalues: RecentSearchTermsAppStorageModule (copy), SuggestedItemTypeEnumModule (copy)
	local List = {}
	
	for _, Text in RecentSearchTermsAppStorageModule.findTermsForQuery(p1) do
		table.insert(List, { text = Text, type = SuggestedItemTypeEnumModule.Recent })
	end
	return List
end

local function getAutocompleteTermsForQueryFromState(p2, p3)
	-- upvalues: FFlagAXUnifiedAutocompleteEndpoint (copy), GetAutocompleteQueryKeyModule (copy), NormalizeKeywordModule (copy)
	local v1 = p3[if FFlagAXUnifiedAutocompleteEndpoint then GetAutocompleteQueryKeyModule(p2) or "" else NormalizeKeywordModule(p2)]
	local List = {}
	
	if v1 and v1.entries then
		for _, entry in v1.entries do
			table.insert(List, entry.searchQuery)
		end
	end
	return List
end

local function getAutocompleteTerms(p4, AutocompleteState)
	-- upvalues: RecentSearchTermsAppStorageModule (copy), getAutocompleteTermsForQueryFromState (copy), SuggestedItemTypeEnumModule (copy)
	local t = {}
	
	for _, Text in RecentSearchTermsAppStorageModule.findTermsForQuery(p4) do
		t[Text:lower()] = true
	end
	local List = {}
	
	for _, Text1 in getAutocompleteTermsForQueryFromState(p4, AutocompleteState) do
		if not t[Text1:lower()] then
			table.insert(List, {
				text = Text1,
				type = SuggestedItemTypeEnumModule.Autocomplete
			})
		end
	end
	return List
end

local Callback = DebounceModule(function(p5, Callback: (any) -> ())
	if Callback then
		Callback(p5)
	end
end, 0.1)

return function(p5)
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), RecentSearchTermsAppStorageModule (copy), AXRecentlyViewedSearchItemsIXPTest (copy), IxpUtilsModule (copy), FFlagAXUnifiedAutocompleteEndpoint (copy), DeviceOrientationMode (copy), CounterModule (copy), GetAutocompleteQueryKeyModule (copy), NormalizeKeywordModule (copy), GetFIntAXMaxAutocompleteSearchTextLenModule (copy), Callback (copy), DashModule (copy), StatModule (copy), FFlagAXSearchAndCancelLogging (copy), SendUnifiedEventLogFunction (copy), UnifiedEventLogEnums (copy), UnifiedLoggingElementNameEnums (copy), UnifiedLoggingSurface (copy), SuggestedItemTypeEnumModule (copy), getRecentSearchTerms (copy), getAutocompleteTerms (copy), UseRecentlyViewedSearchItemsWidgetPropsModule (copy), FFlagAXHideSearchTrendingChipsInAutocompleteModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(RecentSearchTermsAppStorageModule.getTerms())
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseRefResult = ReactModule.useRef(os.clock())
	local TestVariable = if AXRecentlyViewedSearchItemsIXPTest.isEnabled() then IxpUtilsModule.readTestVariable(AXRecentlyViewedSearchItemsIXPTest.EnabledForUser) else nil
	local UseResult = ReactModule.useCallback(function(Text: string): boolean
		-- upvalues: FFlagAXUnifiedAutocompleteEndpoint (upval), p5 (copy)
		local Text1 = if FFlagAXUnifiedAutocompleteEndpoint then Text else Text:lower()
		local AutocompleteStateEntry = p5.autocompleteState and p5.autocompleteState[Text1]
		
		return if AutocompleteStateEntry and AutocompleteStateEntry.expirationTime then tick() < AutocompleteStateEntry.expirationTime else false
	end, { p5.autocompleteState })
	local UseResult1 = ReactModule.useCallback(function(SearchKeyword)
		-- upvalues: p5 (copy), DeviceOrientationMode (upval)
		local SearchUuid = p5.createSearchUuid()
		local config = {
			isKeywordSuggestionEnabled = true,
			searchKeyword = SearchKeyword
		}
		p5.setSearchType(SearchUuid)
		p5.setSearchParameters(SearchUuid, config)
		
		if p5.deviceOrientation == DeviceOrientationMode.Portrait then
			p5.setFullView()
		end
		p5.navigateToSearch(SearchUuid, config)
	end, {
		p5.createSearchUuid, p5.setSearchType, p5.setSearchParameters, p5.setFullView,
		p5.deviceOrientation, p5.navigateToSearch
	})
	local UseResult2 = ReactModule.useCallback(function(p6, Text)
		-- upvalues: p5 (copy), CounterModule (upval), UseStateResult2 (copy), RecentSearchTermsAppStorageModule (upval)
		if p5.sendCounter then
			p5.sendCounter(CounterModule.SearchRecentTermRemoved)
			
			if Text then
				p5.sendCounter(CounterModule.SearchRecentTermRemovedPosPrefix .. Text)
			end
		end
		UseStateResult2(RecentSearchTermsAppStorageModule.removeTerm(p6))
	end, { p5.searchBarRef, p5.sendCounter })
	local UseResult3 = ReactModule.useCallback(function(p6)
		-- upvalues: UseStateResult2_1 (copy), p5 (copy), FFlagAXUnifiedAutocompleteEndpoint (upval), GetAutocompleteQueryKeyModule (upval), NormalizeKeywordModule (upval), GetFIntAXMaxAutocompleteSearchTextLenModule (upval), UseResult (copy), Callback (upval)
		UseStateResult2_1(p6)
		
		if p5.searchTelemetry then
			p5.searchTelemetry.updateQuery(p6)
		end
		local AutocompleteQueryKeyModule = if FFlagAXUnifiedAutocompleteEndpoint then GetAutocompleteQueryKeyModule(p6) else NormalizeKeywordModule(p6, true)
		
		if AutocompleteQueryKeyModule and AutocompleteQueryKeyModule ~= "" and GetFIntAXMaxAutocompleteSearchTextLenModule() >= #AutocompleteQueryKeyModule and not UseResult(AutocompleteQueryKeyModule) then
			Callback(AutocompleteQueryKeyModule, p5.fetchAutocompleteSuggestions)
			
			return
		end
	end, {
		p5.autocompleteState,
		p5.fetchAutocompleteSuggestions,
		UseResult,
		p5.searchTelemetry
	})
	local UseResult4 = ReactModule.useCallback(function(p6)
		-- upvalues: DashModule (upval), p5 (copy), CounterModule (upval), UseRefResult (copy), StatModule (upval), RecentSearchTermsAppStorageModule (upval), UseResult1 (copy)
		if p6 and DashModule.trim(p6) ~= "" then
			if p5.sendCounter then
				p5.sendCounter(CounterModule.SearchSubmit)
				local ScaledClockTime = (os.clock() - UseRefResult.current) * 1000
				
				if p5.sendStats then
					p5.sendStats(StatModule.SearchTimeToSearchMs, ScaledClockTime)
				end
			end
			RecentSearchTermsAppStorageModule.addTerm(p6)
			UseResult1(p6)
			
			return
		elseif p5.sendCounter then
			p5.sendCounter(CounterModule.SearchSubmitNoQuery)
		end
	end, { UseResult1, p5.sendCounter })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: FFlagAXSearchAndCancelLogging (upval), SendUnifiedEventLogFunction (upval), UnifiedEventLogEnums (upval), UnifiedLoggingElementNameEnums (upval), UnifiedLoggingSurface (upval), p5 (copy), CounterModule (upval)
		if FFlagAXSearchAndCancelLogging then
			SendUnifiedEventLogFunction({
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
				elementName = UnifiedLoggingElementNameEnums.SEARCH_LANDING_CANCEL_BUTTON,
				surface = UnifiedLoggingSurface.SEARCH_LANDING_PAGE
			})
			
			if p5.sendCounter then
				p5.sendCounter(CounterModule.SearchCancel)
			end
			if p5.navigation then
				p5.navigation.goBack()
				
				return
			end
		else
			if p5.sendCounter then
				p5.sendCounter(CounterModule.SearchCancel)
			end
			if p5.navigation then
				p5.navigation.goBack()
			end
		end
	end, { p5.navigation, p5.sendCounter })
	local UseResult6 = ReactModule.useCallback(function(p6)
		-- upvalues: UseStateResult2_1 (copy), p5 (copy), CounterModule (upval)
		UseStateResult2_1("")
		
		if p5.searchTelemetry then
			p5.searchTelemetry.sendClearEvent(p6)
		end
		if p5.sendCounter then
			p5.sendCounter(CounterModule.SearchClear)
		end
	end, { p5.sendCounter, p5.searchTelemetry })
	local UseResult7 = ReactModule.useCallback(function(p6, Recent, Text)
		-- upvalues: p5 (copy), SuggestedItemTypeEnumModule (upval), CounterModule (upval), UseStateResult1 (copy), UseResult4 (copy)
		if p5.sendCounter then
			p5.sendCounter(if Recent == SuggestedItemTypeEnumModule.Recent then CounterModule.SearchRecentTermSelected else CounterModule.SearchAutocompleteTermSelected)
			
			if Recent == SuggestedItemTypeEnumModule.Recent and UseStateResult1 == "" or UseStateResult1 == nil then
				p5.sendCounter(CounterModule.SearchRecentTermSelectedNoQuery)
			end
			p5.sendCounter(CounterModule.SearchSuggestedTermSelectedPosPrefix .. Text)
		end
		if p5.searchTelemetry and Recent == SuggestedItemTypeEnumModule.Autocomplete then
			p5.searchTelemetry.sendAutocompleteTermClickedEvent(UseStateResult1, p6)
		end
		UseResult4(p6)
	end, {
		UseResult4,
		p5.sendCounter,
		UseStateResult1,
		p5.searchTelemetry
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: getRecentSearchTerms (upval), UseStateResult1 (copy), p5 (copy), getAutocompleteTerms (upval), UseResult7 (copy), SuggestedItemTypeEnumModule (upval), UseResult2 (copy), AXRecentlyViewedSearchItemsIXPTest (upval), TestVariable (ref), DashModule (upval)
		local AutocompleteTerms = if p5.autocompleteState then getAutocompleteTerms(UseStateResult1, p5.autocompleteState) else {}
		local List = {}
		
		for i, value in getRecentSearchTerms(UseStateResult1) do
			table.insert(List, value)
		end
		for i, autocompleteTerm in AutocompleteTerms do
			table.insert(List, autocompleteTerm)
		end
		for i, value1 in List do
			function value1.onActivate()
				-- upvalues: UseResult7 (upval), value1 (copy), i (copy)
				UseResult7(value1.text, value1.type, i)
			end
			
			if value1.type == SuggestedItemTypeEnumModule.Recent then
				function value1.onRemove()
					-- upvalues: UseResult2 (upval), value1 (copy), i (copy)
					UseResult2(value1.text, i)
				end
			end
		end
		return if AXRecentlyViewedSearchItemsIXPTest.isEnabled() and TestVariable and UseStateResult1 == "" then DashModule.slice(List, 1, 5) else List
	end, {
		UseStateResult1,
		UseStateResult,
		p5.autocompleteState,
		UseResult7,
		UseResult2
	})
	local IsUseStateResultMatch: boolean = #UseMemoResult == 0 and UseStateResult1 == ""
	local v2 = nil
	
	if AXRecentlyViewedSearchItemsIXPTest.isEnabled() then
		IxpUtilsModule.logExperimentExposure(AXRecentlyViewedSearchItemsIXPTest)
		
		if TestVariable then
			v2 = UseRecentlyViewedSearchItemsWidgetPropsModule({
				fetchSearchRecentlyViewed = p5.fetchSearchRecentlyViewed,
				toggleTryOn = p5.toggleTryOn,
				catalogAnalytics = p5.catalogAnalytics
			})
			IsUseStateResultMatch = IsUseStateResultMatch and #v2.items == 0
		end
	end
	return {
		padding = {
			top = p5.statusBarHeight or 0,
			left = if AXRecentlyViewedSearchItemsIXPTest.isEnabled() then nil else UseDesignTokensResult.Size.Size_300,
			right = if AXRecentlyViewedSearchItemsIXPTest.isEnabled() then nil else UseDesignTokensResult.Size.Size_300
		},
		onCancelSearch = UseResult5,
		onChangeSearchQuery = UseResult3,
		onSubmitSearch = UseResult4,
		onClearSearch = UseResult6,
		shouldShowEmptyState = IsUseStateResultMatch,
		hasQuery = if AXRecentlyViewedSearchItemsIXPTest.isEnabled() then if FFlagAXHideSearchTrendingChipsInAutocompleteModule then UseStateResult1 ~= "" else UseStateResult1 ~= "" elseif FFlagAXHideSearchTrendingChipsInAutocompleteModule then UseStateResult1 ~= "" else nil,
		searchBarRef = p5.searchBarRef,
		firstSuggestedItemRef = p5.firstSuggestedItemRef,
		suggestedSearchTerms = UseMemoResult,
		recentlyViewedItems = if AXRecentlyViewedSearchItemsIXPTest.isEnabled() and v2 then v2.items else nil
	}
end