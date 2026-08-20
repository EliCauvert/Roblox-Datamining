local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local reactModule = require(avatarExperienceProfilePictureEditor.Parent.React)
local _ = require(script.Parent.AssetPickerVirtualizedFeedView)
local _ = require(script.Parent.Parent.AssetPickerTile)
local getGridMetricsModule = require(avatarExperienceProfilePictureEditor.Utils.getGridMetrics)

return function(value) --[[ line: 33 | named "useAssetPickerVirtualizedFeedViewModel" ]]
	-- upvalues: reactModule (ref), getGridMetricsModule (ref)
	local var3, var4 = reactModule.useState(value.initialContainerWidth)
	local var5 = reactModule.useMemo(function() --[[ line: 36 ]]
		-- upvalues: getGridMetricsModule (copy), var3 (ref), value (ref)
		return getGridMetricsModule({
			containerWidth = var3,
			minTileSize = value.minTileSize,
			gap = value.gap,
			horizontalPadding = value.horizontalPadding,
			strokeInset = value.strokeInset
		})
	end, {
		var3,
		value.minTileSize,
		value.gap,
		value.horizontalPadding,
		value.strokeInset
	})
	local var6 = reactModule.useRef(nil)
	
	return {
		rows = reactModule.useMemo(function() --[[ line: 54 ]]
			-- upvalues: value (ref), var5 (ref)
			local t = {}
			
			for i, v in value.items do
				local var8 = math.floor((i - 1) / var5.itemsPerRow) + 1
				local var9 = t[var8]
				
				if var9 == nil then
					var9 = {}
					t[var8] = var9
				end
				table.insert(var9, v)
			end
			return t
		end, { value.items, var5.itemsPerRow }),
		itemsPerRow = var5.itemsPerRow,
		gap = value.gap,
		selectedId = value.selectedId,
		onSelect = value.onSelect,
		onDetailsActivated = value.onDetailsActivated,
		labels = value.labels,
		onContainerWidthChanged = reactModule.useCallback(function(p0) --[[ line: 68 ]]
			-- upvalues: var4 (ref)
			var4(p0)
		end, {}),
		onEndReached = reactModule.useCallback(function() --[[ line: 74 ]]
			-- upvalues: value (ref), var6 (ref)
			if value.hasMoreItems and not value.isLoadingMore and (not value.hasLoadMoreError and var6.current ~= value.items) then
				var6.current = value.items
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