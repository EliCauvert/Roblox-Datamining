local AvatarExperienceSearch = script:FindFirstAncestor("AvatarExperienceSearch")
local Parent = AvatarExperienceSearch.Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local IxpUtilsModule = require(Parent.IxpUtils)
local GridMetrics = require(Parent.UIBlox).App.Grid.GridMetrics
local _ = require(AvatarExperienceSearch.Components.SuggestedItemList)
local RecentSearchTermsWidgetModule = require(AvatarExperienceSearch.Features.RecentSearchTermsWidget.RecentSearchTermsWidget)
local RecentlyViewedSearchItemsWidgetModule = require(AvatarExperienceSearch.Features.RecentlyViewedSearchItemsWidget.RecentlyViewedSearchItemsWidget)
local _ = require(AvatarExperienceSearch.Features.RecentlyViewedSearchItemsWidget.useRecentlyViewedSearchItemsWidgetProps)
local AXRecentlyViewedSearchItemsIXPTest = require(Parent.AXCommon).Experiments.AXRecentlyViewedSearchItemsIXPTest

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), GridMetrics (copy), IxpUtilsModule (copy), AXRecentlyViewedSearchItemsIXPTest (copy), RecentSearchTermsWidgetModule (copy), RecentlyViewedSearchItemsWidgetModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GridMetrics (upval), UseStateResult (copy), UseTokensResult (copy)
		return GridMetrics.getSmallMetrics(math.max(UseStateResult - UseTokensResult.Size.Size_400 * 2, 0), UseTokensResult.Size.Size_250)
	end, { UseStateResult })
	
	local function v16(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize.X)
	end
	
	local LayoutOrder = 1
	local LayoutOrder1 = 2
	local TestVariable = IxpUtilsModule.readTestVariable(AXRecentlyViewedSearchItemsIXPTest.EnabledForUser)
	
	if TestVariable and IxpUtilsModule.readTestVariable(AXRecentlyViewedSearchItemsIXPTest.EnabledTopVariant) then
		LayoutOrder = 2
		LayoutOrder1 = 1
	end
	return ReactModule.createElement("ScrollingFrame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		AutomaticCanvasSize = Enum.AutomaticSize.XY,
		CanvasSize = UDim2.fromScale(1, 1),
		Size = UDim2.fromScale(1, 1),
		ScrollBarThickness = 0,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		[ReactModule.Change.AbsoluteSize] = v16
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, UseTokensResult.Size.Size_600)
		}),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, UseTokensResult.Size.Size_1200)
		}),
		RecentSearchTermsWidget = if #p1.suggestedSearchTerms > 0 then ReactModule.createElement(RecentSearchTermsWidgetModule, {
			hasQuery = p1.hasQuery,
			items = p1.suggestedSearchTerms,
			firstSuggestedItemRef = if LayoutOrder == 1 then p1.firstSuggestedItemRef else UseRefResult,
			searchBarRef = p1.searchBarRef,
			LayoutOrder = LayoutOrder
		}) else nil,
		RecentlyViewedSearchItemsWidget = if TestVariable and not p1.hasQuery and p1.recentlyViewedItems and #p1.recentlyViewedItems > 0 then ReactModule.createElement(RecentlyViewedSearchItemsWidgetModule, {
			items = p1.recentlyViewedItems,
			firstSuggestedItemRef = if LayoutOrder1 == 1 then p1.firstSuggestedItemRef else UseRefResult1,
			nextSelectionDown = if LayoutOrder1 == 1 then UseRefResult else p1.searchBarRef,
			nextSelectionUp = if LayoutOrder1 == 1 then p1.searchBarRef else UseRefResult,
			itemWidth = UseMemoResult.itemWidth,
			itemsPerRow = UseMemoResult.itemsPerRow,
			LayoutOrder = LayoutOrder1
		}) else nil
	})
end