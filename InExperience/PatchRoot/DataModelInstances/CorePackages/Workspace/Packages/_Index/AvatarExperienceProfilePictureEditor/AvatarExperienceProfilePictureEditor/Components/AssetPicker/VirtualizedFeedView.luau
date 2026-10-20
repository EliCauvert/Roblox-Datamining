local Parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local AssetPickerErrorBodyModule = require(script.Parent.AssetPickerErrorBody)
local AssetPickerTileModule = require(script.Parent.AssetPickerTile)
local View = FoundationModule.View
local Loading = FoundationModule.Loading
local IconSize = FoundationModule.Enums.IconSize
local VirtualizedFeed = require(Parent.AvatarExperienceUIKit).FeedComponents.VirtualizedFeed

return function(Frame)
	-- upvalues: ReactModule (copy), View (copy), AssetPickerTileModule (copy), Loading (copy), IconSize (copy), AssetPickerErrorBodyModule (copy), VirtualizedFeed (copy)
	return ReactModule.createElement(VirtualizedFeed, {
		onEndReachedThreshold = 0.5,
		shouldWrapFooter = false,
		data = Frame.rows,
		renderItem = function(p1)
			-- upvalues: Frame (copy), ReactModule (upval), View (upval), AssetPickerTileModule (upval)
			local Elements = {}
			
			for LayoutOrder, Item in p1.item do
				Elements[`item-{Item.id}`] = ReactModule.createElement(View, {
					tag = "auto-y",
					Size = UDim2.new(1 / Frame.itemsPerRow, 0, 0, 0),
					LayoutOrder = LayoutOrder,
					padding = {
						left = UDim.new(0, Frame.gap / 2),
						right = UDim.new(0, Frame.gap / 2)
					}
				}, {
					Tile = ReactModule.createElement(AssetPickerTileModule, {
						item = Item,
						selectedId = Frame.selectedId,
						onSelect = Frame.onSelect,
						onDetailsActivated = Frame.onDetailsActivated,
						labels = Frame.labels,
						layoutOrder = (p1.index - 1) * Frame.itemsPerRow + LayoutOrder
					})
				})
			end
			return ReactModule.createElement(View, {
				tag = "row align-x-left align-y-top size-full-0 auto-y",
				LayoutOrder = p1.index,
				padding = {
					left = UDim.new(0, Frame.horizontalPadding - Frame.gap / 2),
					right = UDim.new(0, Frame.horizontalPadding - Frame.gap / 2),
					bottom = UDim.new(0, Frame.gap)
				}
			}, Elements)
		end,
		onContainerWidthChanged = Frame.onContainerWidthChanged,
		onEndReached = Frame.onEndReached,
		ListHeaderComponent = Frame.listHeaderComponent,
		ListFooterComponent = (if Frame.isLoadingMore then ReactModule.createElement(View, { tag = "align-x-center size-full-0 auto-y padding-large" }, {
			Loading = ReactModule.createElement(Loading, { size = IconSize.Medium })
		}) elseif Frame.hasLoadMoreError then ReactModule.createElement(AssetPickerErrorBodyModule, { onRetry = Frame.onRetryLoadMore }) else nil) or Frame.listFooterComponent,
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.fromScale(1, 1)
	})
end