local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local reactModule = require(avatarExperienceProfilePictureEditor.Parent.React)
local _ = require(script.Parent.AssetPickerVirtualizedFeedView)
local _ = require(script.Parent.AssetPickerTile)
local getGridMetricsModule = require(avatarExperienceProfilePictureEditor.Utils.getGridMetrics)

return function(value)
	-- upvalues: reactModule (ref), getGridMetricsModule (ref)
	local var1, var2 = reactModule.useState(value.initialContainerWidth)
	local var3 = reactModule.useMemo(function()
		-- upvalues: getGridMetricsModule (copy), var1 (ref), value (ref)
		return getGridMetricsModule({
			containerWidth = var1,
			minTileSize = value.minTileSize,
			gap = value.gap,
			horizontalPadding = value.horizontalPadding,
			strokeInset = value.strokeInset
		})
	end, {
		var1,
		value.minTileSize,
		value.gap,
		value.horizontalPadding,
		value.strokeInset
	})
	local var4 = reactModule.useRef(nil)
	
	return {
		rows = reactModule.useMemo(function()
			-- upvalues: value (ref), var3 (ref)
			local t = {}
			
			for i, v in value.items do
				local var5 = math.floor((i - 1) / var3.itemsPerRow) + 1
				local var6 = t[var5]
				
				if var6 == nil then
					var6 = {}
					t[var5] = var6
				end
				table.insert(var6, v)
			end
			return t
		end, { value.items, var3.itemsPerRow }),
		itemsPerRow = var3.itemsPerRow,
		gap = value.gap,
		selectedId = value.selectedId,
		onSelect = value.onSelect,
		onDetailsActivated = value.onDetailsActivated,
		labels = value.labels,
		onContainerWidthChanged = reactModule.useCallback(function(p1)
			-- upvalues: var2 (ref)
			var2(p1)
		end, {}),
		onEndReached = reactModule.useCallback(function()
			-- upvalues: value (ref), var4 (ref)
			if value.hasMoreItems and not value.isLoadingMore and (not value.hasLoadMoreError and var4.current ~= value.items) then
				var4.current = value.items
				value.onMoreItems()
				
				return
			end
		end, {
			value.items,
			value.hasMoreItems,
			value.isLoadingMore,
			value.hasLoadMoreError,
			value.onMoreItems
		}),
		isLoadingMore = value.isLoadingMore,
		hasLoadMoreError = value.hasLoadMoreError,
		onRetryLoadMore = value.onRetryLoadMore,
		listHeaderComponent = value.listHeaderComponent,
		listFooterComponent = value.listFooterComponent,
		horizontalPadding = value.horizontalPadding + value.strokeInset,
		LayoutOrder = value.LayoutOrder
	}
end