local Parent = script:FindFirstAncestor("AvatarWorkshop").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FlatList = require(Parent.VirtualizedList).FlatList
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function _(p1, p2, p3)
	local Largest = math.max(p3.minimumItemsPerRow, (math.floor((p1 + p2) / (p3.minimumItemWidth + p2))))
	
	return {
		itemsPerRow = Largest,
		itemWidth = math.floor((p1 - (Largest - 1) * p2) / Largest)
	}
end

local function chunkIntoRows(p1, ItemsPerRow: number)
	local Buffer = table.create((math.ceil(math.max(#p1, 1) / ItemsPerRow)))
	
	for i = 1, #p1, ItemsPerRow do
		table.insert(Buffer, { unpack(p1, i, (math.min(i + ItemsPerRow - 1, #p1))) })
	end
	return Buffer
end

return function(p2)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), chunkIntoRows (copy), FoundationModule (copy), FlatList (copy)
	local UseTokensResult = UseTokensFunction()
	local MinItemWidth = p2.minItemWidth
	local MinColumns = p2.minColumns or 1
	local FallbackNumColumns = p2.fallbackNumColumns or 3
	local ColumnGap = p2.columnGap or UseTokensResult.Gap.Small
	local RowGap = p2.rowGap or UseTokensResult.Gap.Small
	local ContentPaddingTop = p2.contentPaddingTop or UseTokensResult.Padding.XSmall
	local ContentPaddingBottom = p2.contentPaddingBottom
	local HasListFooterSlot = p2.ListFooterSlot ~= nil
	local ScaledXSmall = UseTokensResult.Padding.XSmall * 2
	local KeyExtractorFunction = p2.keyExtractor
	local UseStateResult, UseStateResult2 = ReactModule.useState(p2.lastMeasuredGridWidth or 0)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy), p2 (copy)
		local X = Frame.AbsoluteSize.X
		
		if X == 0 then return end
		UseStateResult2(X)
		
		if p2.onGridWidthChanged then
			p2.onGridWidthChanged(X)
		end
	end, { p2.onGridWidthChanged })
	local IsUseStateResultMatch: boolean = MinItemWidth ~= nil and UseStateResult == 0
	local ItemsPerRow = nil
	
	if MinItemWidth == nil or UseStateResult <= 0 then
		ItemsPerRow = FallbackNumColumns
	else
		local UseStateResultDelta = UseStateResult - ScaledXSmall
		local config = {
			minimumItemWidth = MinItemWidth,
			minimumItemsPerRow = MinColumns
		}
		local Largest = math.max(config.minimumItemsPerRow, (math.floor((UseStateResultDelta + ColumnGap) / (config.minimumItemWidth + ColumnGap))))
		ItemsPerRow = ({
			itemsPerRow = Largest,
			itemWidth = math.floor((UseStateResultDelta - (Largest - 1) * ColumnGap) / Largest)
		}).itemsPerRow
	end
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: chunkIntoRows (upval), p2 (copy), ItemsPerRow (copy)
		return (chunkIntoRows(p2.data, ItemsPerRow))
	end, { p2.data, ItemsPerRow })
	local UseResult1 = ReactModule.useCallback(function(p3)
		-- upvalues: ItemsPerRow (copy), UseMemoResult (copy), KeyExtractorFunction (copy), ReactModule (upval), FoundationModule (upval), p2 (copy), ColumnGap (copy), ContentPaddingTop (copy), HasListFooterSlot (copy), ContentPaddingBottom (copy), RowGap (copy)
		local Item = p3.item
		local Index: number = p3.index
		local ScaledIndex = (Index - 1) * ItemsPerRow
		local IsIndexMatch = Index == #UseMemoResult
		local Elements = {}
		
		for LayoutOrder, value in Item do
			local NewScaledIndex = ScaledIndex + LayoutOrder
			Elements[if KeyExtractorFunction then KeyExtractorFunction(value, NewScaledIndex) else `Item{NewScaledIndex}`] = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = LayoutOrder }, { Cell = p2.renderItem(value, NewScaledIndex) })
		end
		for i = #Item + 1, ItemsPerRow do
			Elements[`Filler{i}`] = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0", LayoutOrder = i })
		end
		return ReactModule.createElement(FoundationModule.View, {
			tag = "row flex-x-fill size-full-0 auto-y padding-x-xsmall",
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, ColumnGap)
			},
			padding = {
				top = if Index == 1 then UDim.new(0, ContentPaddingTop) else UDim.new(0, 0),
				bottom = if IsIndexMatch and not HasListFooterSlot and ContentPaddingBottom ~= nil then UDim.new(0, ContentPaddingBottom) else UDim.new(0, RowGap)
			},
			LayoutOrder = Index
		}, Elements)
	end, {
		UseMemoResult, ItemsPerRow, ColumnGap, RowGap, ContentPaddingTop,
		ContentPaddingBottom, HasListFooterSlot, p2.renderItem, KeyExtractorFunction
	})
	local UseResult2 = ReactModule.useCallback(function(Entry, p4: number)
		-- upvalues: KeyExtractorFunction (copy), ItemsPerRow (copy)
		local Entry1 = Entry[1]
		
		return if Entry1 == nil or not KeyExtractorFunction then `Row{p4}` else KeyExtractorFunction(Entry1, (p4 - 1) * ItemsPerRow + 1)
	end, { KeyExtractorFunction, ItemsPerRow })
	local Element = if p2.ListFooterSlot then ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y",
		padding = {
			bottom = UDim.new(0, ContentPaddingBottom or UseTokensResult.Padding.Medium)
		}
	}, { Footer = p2.ListFooterSlot }) else nil
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full clip",
		onAbsoluteSizeChanged = UseResult
	}, {
		List = if IsUseStateResultMatch then nil else ReactModule.createElement(FlatList, {
			data = UseMemoResult,
			renderItem = UseResult1,
			keyExtractor = UseResult2,
			ListEmptyComponent = p2.ListEmptySlot,
			ListHeaderComponent = p2.ListHeaderSlot,
			ListFooterComponent = Element,
			onEndReached = p2.onEndReached,
			onEndReachedThreshold = p2.onEndReachedThreshold or 2,
			windowSize = p2.windowSize or 10,
			initialNumToRender = p2.initialNumToRender or 8,
			maxToRenderPerBatch = p2.maxToRenderPerBatch or 1,
			updateCellsBatchingPeriod = p2.updateCellsBatchingPeriod or 30,
			contentContainerStyle = { BackgroundTransparency = 1, BorderSizePixel = 0 },
			style = {
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				BorderSizePixel = 0,
				ClipsDescendants = false
			}
		})
	})
end