local AvatarExperienceSearch = script:FindFirstAncestor("AvatarExperienceSearch")
local Parent = AvatarExperienceSearch.Parent
local ReactModule = require(Parent.React)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local FlexLayoutModule = require(AvatarExperienceSearch.Components.FlexLayout)
local SearchBarModule = require(AvatarExperienceSearch.Components.SearchBar)
local SuggestedItemListModule = require(AvatarExperienceSearch.Components.SuggestedItemList)
local SearchEmptyStateModule = require(AvatarExperienceSearch.Components.SearchEmptyState)
local SearchLandingPageWidgetsModule = require(AvatarExperienceSearch.Features.SearchLandingPageWidgets.SearchLandingPageWidgets)
local AXRecentlyViewedSearchItemsIXPTest = require(Parent.AXCommon).Experiments.AXRecentlyViewedSearchItemsIXPTest

local function mapTokens(p1)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy), AXRecentlyViewedSearchItemsIXPTest (copy)
	return {
		backgroundColor = (if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Surface.Surface_0 else p1.Semantic.Color.Background.Default).Color3,
		backgroundTransparency = (if FFlagRenameDeprecatedUIBloxTokens then p1.Color.Surface.Surface_0 else p1.Semantic.Color.Background.Default).Transparency,
		itemListPadding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_400 else p1.Global.Space_200,
		searchBarPadding = if AXRecentlyViewedSearchItemsIXPTest.isEnabled() then if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_400 else p1.Global.Space_200 elseif FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_300 else p1.Global.Space_150,
		emptyStatePadding = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_1000 else p1.Global.Space_500,
		spaceBetweenSearchAndList = if FFlagRenameDeprecatedUIBloxTokens then p1.Size.Size_200 else p1.Global.Space_100
	}
end

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), mapTokens (copy), AXRecentlyViewedSearchItemsIXPTest (copy), UseNavigationFocusFunction (copy), ReactModule (copy), FlexLayoutModule (copy), SearchBarModule (copy), SuggestedItemListModule (copy), SearchEmptyStateModule (copy), SearchLandingPageWidgetsModule (copy)
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
			SearchBar = ReactModule.createElement(SearchBarModule, {
				showCancelButton = true,
				autofocus = true,
				onCancel = p1.onCancelSearch,
				onClear = p1.onClearSearch,
				onChange = p1.onChangeSearchQuery,
				onSubmit = p1.onSubmitSearch,
				ref = p1.searchBarRef,
				nextSelectionDown = p1.firstSuggestedItemRef
			})
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