local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local ReactModule = require(AvatarExperienceProfilePictureEditor.Parent.React)
local _ = require(script.Parent.VirtualizedFeedView)
local _ = require(script.Parent.AssetPickerTile)
local GetGridMetricsModule = require(AvatarExperienceProfilePictureEditor.Utils.getGridMetrics)

return function(Frame) --[[ Line: 33 | Named "useAssetPickerVirtualizedFeedViewModel" ]]
	-- upvalues: ReactModule (copy), GetGridMetricsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Frame.initialContainerWidth)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 36 ]]
		-- upvalues: GetGridMetricsModule (upval), UseStateResult (copy), Frame (copy)
		return GetGridMetricsModule({
			containerWidth = UseStateResult,
			minTileSize = Frame.minTileSize,
			gap = Frame.gap,
			horizontalPadding = Frame.horizontalPadding,
			strokeInset = Frame.strokeInset
		})
	end, {
		UseStateResult,
		Frame.minTileSize,
		Frame.gap,
		Frame.horizontalPadding,
		Frame.strokeInset
	})
	local UseRefResult = ReactModule.useRef(nil)
	
	return {
		rows = ReactModule.useMemo(function() --[[ Line: 54 ]]
			-- upvalues: Frame (copy), UseMemoResult (copy)
			local t = {}
			
			for i, item in Frame.items do
				local NewFloored = math.floor((i - 1) / UseMemoResult.itemsPerRow) + 1
				local List = t[NewFloored]
				
				if List == nil then
					List = {}
					t[NewFloored] = List
				end
				table.insert(List, item)
			end
			return t
		end, { Frame.items, UseMemoResult.itemsPerRow }),
		itemsPerRow = UseMemoResult.itemsPerRow,
		gap = Frame.gap,
		selectedId = Frame.selectedId,
		onSelect = Frame.onSelect,
		onDetailsActivated = Frame.onDetailsActivated,
		labels = Frame.labels,
		onContainerWidthChanged = ReactModule.useCallback(function(p1) --[[ Line: 68 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(p1)
		end, {}),
		onEndReached = ReactModule.useCallback(function() --[[ Line: 74 ]]
			-- upvalues: Frame (copy), UseRefResult (copy)
			if Frame.hasMoreItems and not Frame.isLoadingMore and not Frame.hasLoadMoreError and UseRefResult.current ~= Frame.items then
				UseRefResult.current = Frame.items
				Frame.onMoreItems()
				
				return
			end
		end, {
			Frame.items,
			Frame.hasMoreItems,
			Frame.isLoadingMore,
			Frame.hasLoadMoreError,
			Frame.onMoreItems
		}),
		isLoadingMore = Frame.isLoadingMore,
		hasLoadMoreError = Frame.hasLoadMoreError,
		onRetryLoadMore = Frame.onRetryLoadMore,
		listHeaderComponent = Frame.listHeaderComponent,
		listFooterComponent = Frame.listFooterComponent,
		horizontalPadding = Frame.horizontalPadding + Frame.strokeInset,
		LayoutOrder = Frame.LayoutOrder
	}
end