local AvatarExperienceSearch = script:FindFirstAncestor("AvatarExperienceSearch")
local Parent = AvatarExperienceSearch.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local AXCommonModule = require(Parent.AXCommon)
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local FFlagAXAddSearchTrendingChips = require(Parent.AvatarExperienceFlags).FFlagAXAddSearchTrendingChips
local FFlagAXHideSearchTrendingChipsInAutocompleteModule = require(AvatarExperienceSearch.Flags.FFlagAXHideSearchTrendingChipsInAutocomplete)
local FFlagAXUnifiedAutocompleteExposureLogging = require(Parent.AvatarExperienceFlags).FFlagAXUnifiedAutocompleteExposureLogging
local FlexLayoutModule = require(AvatarExperienceSearch.Components.FlexLayout)
local SearchBarModule = require(AvatarExperienceSearch.Components.SearchBar)
local SearchViewExposureLoggerModule = require(AvatarExperienceSearch.Components.SearchViewExposureLogger)
local SuggestedItemListModule = require(AvatarExperienceSearch.Components.SuggestedItemList)
local SearchEmptyStateModule = require(AvatarExperienceSearch.Components.SearchEmptyState)
local SearchLandingPageWidgetsModule = require(AvatarExperienceSearch.Features.SearchLandingPageWidgets.SearchLandingPageWidgets)
local TrendingSearchTermsWidgetContainerModule = require(AvatarExperienceSearch.Features.TrendingSearchTermsWidget.TrendingSearchTermsWidgetContainer)
local AXRecentlyViewedSearchItemsIXPTest = AXCommonModule.Experiments.AXRecentlyViewedSearchItemsIXPTest

local function mapTokens(p1)
	-- upvalues: AXRecentlyViewedSearchItemsIXPTest (copy)
	return {
		backgroundColor = p1.Color.Surface.Surface_0.Color3,
		backgroundTransparency = p1.Color.Surface.Surface_0.Transparency,
		itemListPadding = p1.Size.Size_400,
		searchBarPadding = if AXRecentlyViewedSearchItemsIXPTest.isEnabled() then p1.Size.Size_400 else p1.Size.Size_300,
		emptyStatePadding = p1.Size.Size_1000,
		spaceBetweenSearchAndList = p1.Size.Size_200
	}
end

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), mapTokens (copy), AXRecentlyViewedSearchItemsIXPTest (copy), UseNavigationFocusFunction (copy), ReactModule (copy), FFlagAXAddSearchTrendingChips (copy), FFlagAXHideSearchTrendingChipsInAutocompleteModule (copy), FlexLayoutModule (copy), SearchBarModule (copy), FFlagAXUnifiedAutocompleteExposureLogging (copy), SearchViewExposureLoggerModule (copy), TrendingSearchTermsWidgetContainerModule (copy), SuggestedItemListModule (copy), SearchEmptyStateModule (copy), SearchLandingPageWidgetsModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction(mapTokens)
	
	if AXRecentlyViewedSearchItemsIXPTest.isEnabled() then
		local UseNavigationFocusResult = UseNavigationFocusFunction()
		ReactModule.useEffect(function()
			-- upvalues: UseNavigationFocusResult (copy), p1 (copy)
			if UseNavigationFocusResult and p1.searchBarRef and p1.searchBarRef.current then
				p1.searchBarRef.current:CaptureFocus()
			end
		end, { UseNavigationFocusResult })
	end
	local v1 = #p1.suggestedSearchTerms > 0
	local NoHasQuery: boolean = FFlagAXAddSearchTrendingChips
	
	if FFlagAXHideSearchTrendingChipsInAutocompleteModule then
		NoHasQuery = NoHasQuery and not p1.hasQuery
	end
	return ReactModule.createElement(FlexLayoutModule, {
		BorderSizePixel = 0,
		margin = 0,
		reverse = true,
		BackgroundColor3 = UseDesignTokensResult.backgroundColor,
		BackgroundTransparency = UseDesignTokensResult.backgroundTransparency,
		Size = UDim2.fromScale(1, 1),
		AutomaticSize = Enum.AutomaticSize.XY,
		padding = p1.padding,
		flexDirection = Enum.FillDirection.Vertical,
		rigidSlot = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			SearchBarFramePadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, UseDesignTokensResult.searchBarPadding),
				PaddingBottom = UDim.new(0, UseDesignTokensResult.searchBarPadding),
				PaddingLeft = UDim.new(0, UseDesignTokensResult.searchBarPadding),
				PaddingRight = UDim.new(0, UseDesignTokensResult.searchBarPadding)
			}),
			Layout = if FFlagAXAddSearchTrendingChips then ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, UseDesignTokensResult.spaceBetweenSearchAndList)
			}) else nil,
			SearchBar = ReactModule.createElement(SearchBarModule, {
				showCancelButton = true,
				autofocus = true,
				onCancel = p1.onCancelSearch,
				onClear = p1.onClearSearch,
				onChange = p1.onChangeSearchQuery,
				onSubmit = p1.onSubmitSearch,
				ref = p1.searchBarRef,
				nextSelectionDown = p1.firstSuggestedItemRef
			}),
			SearchViewExposureLogger = if FFlagAXUnifiedAutocompleteExposureLogging then ReactModule.createElement(SearchViewExposureLoggerModule) else nil,
			TrendingSearchTermsWidget = if NoHasQuery then ReactModule.createElement(TrendingSearchTermsWidgetContainerModule, { LayoutOrder = 1, onSubmitSearch = p1.onSubmitSearch }) else nil
		}),
		flexSlot = if AXRecentlyViewedSearchItemsIXPTest.isEnabled() or not v1 then if p1.shouldShowEmptyState then ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.fromScale(1, 0)
		}, {
			EmptyStatePadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, UseDesignTokensResult.emptyStatePadding),
				PaddingLeft = UDim.new(0, UseDesignTokensResult.emptyStatePadding),
				PaddingRight = UDim.new(0, UseDesignTokensResult.emptyStatePadding)
			}),
			SearchEmptyState = ReactModule.createElement(SearchEmptyStateModule)
		}) elseif AXRecentlyViewedSearchItemsIXPTest.isEnabled() then ReactModule.createElement(SearchLandingPageWidgetsModule, {
			hasQuery = p1.hasQuery,
			suggestedSearchTerms = p1.suggestedSearchTerms,
			recentlyViewedItems = p1.recentlyViewedItems,
			searchBarRef = p1.searchBarRef,
			firstSuggestedItemRef = p1.firstSuggestedItemRef
		}) else nil else ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.fromScale(1, 1)
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, UseDesignTokensResult.itemListPadding),
				PaddingRight = UDim.new(0, UseDesignTokensResult.itemListPadding)
			}),
			SuggestedItemList = ReactModule.createElement(SuggestedItemListModule, {
				items = p1.suggestedSearchTerms,
				firstSuggestedItemRef = p1.firstSuggestedItemRef,
				nextSelectionUp = p1.searchBarRef
			})
		})
	})
end