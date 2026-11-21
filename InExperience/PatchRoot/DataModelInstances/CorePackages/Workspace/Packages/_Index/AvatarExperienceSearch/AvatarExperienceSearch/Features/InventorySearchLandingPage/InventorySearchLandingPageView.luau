local AvatarExperienceSearch = script:FindFirstAncestor("AvatarExperienceSearch")
local Parent = AvatarExperienceSearch.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local WidgetHeader = require(Parent.AvatarExperienceUIKit).WidgetComponents.WidgetHeader
local FlexLayoutModule = require(AvatarExperienceSearch.Components.FlexLayout)
local SearchBarModule = require(AvatarExperienceSearch.Components.SearchBar)
local SearchEmptyStateModule = require(AvatarExperienceSearch.Components.SearchEmptyState)
local SuggestedItemListModule = require(AvatarExperienceSearch.Components.SuggestedItemList)

local function mapTokens(p1)
	return {
		backgroundColor = p1.Color.Surface.Surface_0.Color3,
		backgroundTransparency = p1.Color.Surface.Surface_0.Transparency,
		recentTermsPadding = p1.Size.Size_400,
		recentTermsHeaderMargin = p1.Size.Size_300,
		emptyStatePadding = p1.Size.Size_1000
	}
end

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), mapTokens (copy), ReactModule (copy), FlexLayoutModule (copy), View (copy), SearchBarModule (copy), WidgetHeader (copy), SuggestedItemListModule (copy), SearchEmptyStateModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction(mapTokens)
	
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
		rigidSlot = ReactModule.createElement(View, {
			tag = "size-full-0 auto-xy padding-medium",
			LayoutOrder = 0
		}, {
			SearchBar = ReactModule.createElement(SearchBarModule, {
				showCancelButton = true,
				useTopBarInputBackground = true,
				autofocus = true,
				text = p1.initialQuery,
				placeholder = p1.placeholder,
				onCancel = p1.onCancel,
				onClear = p1.onClearQuery,
				onChange = p1.onChangeQuery,
				onSubmit = p1.onSubmitQuery,
				ref = p1.searchBarRef,
				nextSelectionDown = p1.firstRecentTermRef
			})
		}),
		flexSlot = if #p1.recentTerms > 0 then ReactModule.createElement(FlexLayoutModule, {
			reverse = true,
			Size = UDim2.fromScale(1, 1),
			AutomaticSize = Enum.AutomaticSize.None,
			margin = if p1.hasQuery then 0 else UseDesignTokensResult.recentTermsHeaderMargin,
			padding = {
				left = UseDesignTokensResult.recentTermsPadding,
				right = UseDesignTokensResult.recentTermsPadding
			},
			flexDirection = Enum.FillDirection.Vertical,
			rigidSlot = ReactModule.createElement(View, { tag = "size-full-0 auto-y" }, {
				RecentSearchesHeader = if p1.hasQuery then nil else ReactModule.createElement(WidgetHeader, { titleText = p1.recentSearchesTitle })
			}),
			flexSlot = ReactModule.createElement(SuggestedItemListModule, {
				items = p1.recentTerms,
				firstSuggestedItemRef = p1.firstRecentTermRef,
				nextSelectionUp = p1.searchBarRef
			})
		}) elseif p1.shouldShowEmptyState then ReactModule.createElement(View, {
			tag = "size-full-0 auto-xy",
			padding = {
				top = UDim.new(0, UseDesignTokensResult.emptyStatePadding),
				left = UDim.new(0, UseDesignTokensResult.emptyStatePadding),
				right = UDim.new(0, UseDesignTokensResult.emptyStatePadding)
			}
		}, {
			SearchEmptyState = ReactModule.createElement(SearchEmptyStateModule)
		}) else nil
	})
end