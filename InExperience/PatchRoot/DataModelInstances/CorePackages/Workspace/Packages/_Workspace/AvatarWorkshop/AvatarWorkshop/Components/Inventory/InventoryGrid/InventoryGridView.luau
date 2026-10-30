local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ItemCardModule = require(AvatarWorkshop.Components.ItemCard.ItemCard)
local VirtualizedGridModule = require(AvatarWorkshop.Components.VirtualizedGrid.VirtualizedGrid)
local _ = require(script.Parent.InventoryGridTypes)
local InputSize = FoundationModule.Enums.InputSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

local function renderItem(p1)
	-- upvalues: ReactModule (copy), ItemCardModule (copy)
	return ReactModule.createElement(ItemCardModule, {
		showDetails = false,
		image = p1.image,
		isSelected = p1.isSelected,
		onActivated = p1.onActivated
	})
end

local function keyExtractor(p1)
	return p1.id
end

local function renderFooter(p1, p2)
	-- upvalues: ReactModule (copy), FoundationModule (copy), InputSize (copy)
	return if p1.isLoadingNextPage then ReactModule.createElement(FoundationModule.View, { tag = "align-x-center size-full-0 auto-y padding-medium" }, {
		Loading = ReactModule.createElement(FoundationModule.Loading)
	}) elseif p1.hasNextPageError then ReactModule.createElement(FoundationModule.View, {
		tag = "col align-x-center gap-small size-full-0 auto-y padding-medium"
	}, {
		Message = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-body-small content-muted",
			LayoutOrder = 1,
			Text = p2.loadMoreItemsError
		}),
		Retry = ReactModule.createElement(FoundationModule.Button, {
			testId = "--avatar-workshop-inventorygrid-button-retry-next-page",
			LayoutOrder = 2,
			size = InputSize.Small,
			text = p2.tryAgain,
			onActivated = p1.onRetry
		})
	}) else nil
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy), VirtualizedGridModule (copy), renderItem (copy), keyExtractor (copy), renderFooter (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		loadItemsError = "Feature.AvatarWorkshop.Message.LoadItemsError",
		loadMoreItemsError = "Feature.AvatarWorkshop.Message.LoadMoreItemsError",
		noItemsOwned = "Feature.AvatarWorkshop.Message.NoItemsOwned",
		tryAgain = "Feature.AvatarWorkshop.Action.TryAgain"
	})
	
	return if p1.hasFetchError then ReactModule.createElement(FoundationModule.View, {
		tag = "size-full padding-large",
		testId = "InventoryGridView"
	}, {
		ErrorState = ReactModule.createElement(FoundationModule.Empty, {
			text = UseLocalizationResult.loadItemsError,
			button = {
				text = UseLocalizationResult.tryAgain,
				onActivated = p1.onRetry
			}
		})
	}) elseif p1.isLoadingInitialPage then ReactModule.createElement(FoundationModule.View, {
		tag = "align-x-center align-y-center size-full",
		testId = "InventoryGridView"
	}, {
		Loading = ReactModule.createElement(FoundationModule.Loading)
	}) elseif p1.isEmpty then ReactModule.createElement(FoundationModule.View, {
		tag = "size-full padding-large",
		testId = "InventoryGridView"
	}, {
		EmptyState = ReactModule.createElement(FoundationModule.Empty, { text = UseLocalizationResult.noItemsOwned })
	}) else ReactModule.createElement(FoundationModule.View, {
		tag = "size-full padding-x-large",
		testId = "InventoryGridView"
	}, {
		Grid = ReactModule.createElement(VirtualizedGridModule, {
			data = p1.items,
			fallbackNumColumns = p1.fallbackNumColumns,
			minItemWidth = p1.minItemWidth,
			minColumns = p1.minColumns,
			lastMeasuredGridWidth = p1.lastMeasuredGridWidth,
			onGridWidthChanged = p1.onGridWidthChanged,
			rowGap = p1.rowGap,
			columnGap = p1.columnGap,
			contentPaddingTop = p1.contentPaddingY,
			contentPaddingBottom = p1.contentPaddingY,
			renderItem = renderItem,
			keyExtractor = keyExtractor,
			onEndReached = p1.onEndReached,
			ListFooterSlot = renderFooter(p1, UseLocalizationResult)
		})
	})
end