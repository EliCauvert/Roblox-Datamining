local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local avatarExperienceUIKitModule = require(parent.AvatarExperienceUIKit)
local assetPickerErrorBodyModule = require(script.Parent.Parent.AssetPickerErrorBody)
local assetPickerTileModule = require(script.Parent.Parent.AssetPickerTile)
local view = foundationModule.View
local loading = foundationModule.Loading
local iconSize = foundationModule.Enums.IconSize
local virtualizedFeed = avatarExperienceUIKitModule.FeedComponents.VirtualizedFeed

return function(value) --[[ line: 36 | named "AssetPickerVirtualizedFeedView" ]]
	-- upvalues: reactModule (ref), view (ref), assetPickerTileModule (ref), loading (ref), iconSize (ref), assetPickerErrorBodyModule (ref), virtualizedFeed (ref)
	local function renderRow(p0) --[[ line: 37 ]]
		-- upvalues: value (ref), reactModule (copy), view (copy), assetPickerTileModule (copy)
		local t = {}
		
		for i, v in p0.item do
			t[`item-{v.id}`] = reactModule.createElement(view, {
				tag = "auto-y",
				Size = UDim2.new(1 / value.itemsPerRow, 0, 0, 0),
				LayoutOrder = i,
				padding = {
					left = UDim.new(0, value.gap / 2),
					right = UDim.new(0, value.gap / 2)
				}
			}, {
				Tile = reactModule.createElement(assetPickerTileModule, {
					item = v,
					selectedId = value.selectedId,
					onSelect = value.onSelect,
					onDetailsActivated = value.onDetailsActivated,
					labels = value.labels,
					layoutOrder = (p0.index - 1) * value.itemsPerRow + i
				})
			})
		end
		return reactModule.createElement(view, {
			tag = "row align-x-left align-y-top size-full-0 auto-y",
			LayoutOrder = p0.index,
			padding = {
				left = UDim.new(0, value.horizontalPadding - value.gap / 2),
				right = UDim.new(0, value.horizontalPadding - value.gap / 2),
				bottom = UDim.new(0, value.gap)
			}
		}, t)
	end
	
	local var6 = nil
	
	if value.isLoadingMore then
		var6 = reactModule.createElement(view, { tag = "align-x-center size-full-0 auto-y padding-large" }, {
			Loading = reactModule.createElement(loading, { size = iconSize.Medium })
		})
	elseif value.hasLoadMoreError then
		var6 = reactModule.createElement(assetPickerErrorBodyModule, { onRetry = value.onRetryLoadMore })
	end
	return reactModule.createElement(virtualizedFeed, {
		onEndReachedThreshold = 0.5,
		shouldWrapFooter = false,
		data = value.rows,
		renderItem = renderRow,
		onContainerWidthChanged = value.onContainerWidthChanged,
		onEndReached = value.onEndReached,
		ListHeaderComponent = value.listHeaderComponent,
		ListFooterComponent = var6 or value.listFooterComponent,
		LayoutOrder = value.LayoutOrder,
		Size = UDim2.fromScale(1, 1)
	})
end