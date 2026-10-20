local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(ViewRecycler.Core.Layout.LayoutRuntime)
local TypesModule = require(ViewRecycler.Core.Types)
local StaticPartsModule = require(ViewRecycler.Core.Layout.staticParts)

local function _(p1, p2: number)
	if p2 < 0 or p2 >= 1e999 then
		assert(false, `Layout.masonry: {p1} must be finite and non-negative`)
	end
end

return function(p1)
	-- upvalues: TypesModule (copy), DataSourceChangeTypeModule (copy), StaticPartsModule (copy)
	assert(type(p1.getItemLength) == "function", "Layout.masonry: getItemLength must be a function")
	assert(p1.crossAxisCount ~= nil ~= (p1.crossAxisItemLength ~= nil), "Layout.masonry: provide exactly one of crossAxisCount or crossAxisItemLength")
	
	if p1.crossAxisCount ~= nil then
		assert(p1.crossAxisCount > 0 and p1.crossAxisCount % 1 == 0, "Layout.masonry: crossAxisCount must be a positive integer")
	end
	if p1.crossAxisItemLength ~= nil then
		assert(p1.crossAxisItemLength > 0 and p1.crossAxisItemLength < 1e999, "Layout.masonry: crossAxisItemLength must be finite and positive")
	end
	local GetItemLengthFunction = p1.getItemLength
	local Spacing = p1.spacing or 0
	local CrossAxisSpacing = p1.crossAxisSpacing or 0
	local PaddingBefore = p1.paddingBefore or 0
	local PaddingAfter = p1.paddingAfter or 0
	
	if Spacing < 0 or Spacing >= 1e999 then
		assert(false, "Layout.masonry: spacing must be finite and non-negative")
	end
	if CrossAxisSpacing < 0 or CrossAxisSpacing >= 1e999 then
		assert(false, "Layout.masonry: crossAxisSpacing must be finite and non-negative")
	end
	if PaddingBefore < 0 or PaddingBefore >= 1e999 then
		assert(false, "Layout.masonry: paddingBefore must be finite and non-negative")
	end
	if PaddingAfter < 0 or PaddingAfter >= 1e999 then
		assert(false, "Layout.masonry: paddingAfter must be finite and non-negative")
	end
	local CrossAxisCount = p1.crossAxisCount or 1
	local List = {}
	local Tbl = {}
	local Tbl1 = {}
	local v1 = 0
	local Flag = true
	
	local function _()
		-- upvalues: Flag (ref)
		Flag = true
	end
	
	local function rebuildGeometry()
		-- upvalues: Flag (ref), Tbl (copy), Tbl1 (copy), CrossAxisCount (ref), PaddingBefore (copy), List (ref), GetItemLengthFunction (copy), CrossAxisSpacing (copy), Spacing (copy), v1 (ref), PaddingAfter (copy)
		if not Flag then return end
		table.clear(Tbl)
		table.clear(Tbl1)
		local Buffer = table.create(CrossAxisCount, PaddingBefore)
		
		for i = 1, CrossAxisCount do
			Buffer[i] = PaddingBefore
			Tbl1[i] = {}
		end
		for i1 = 1, #List do
			local ItemLength: number = GetItemLengthFunction(i1)
			
			if type(ItemLength) ~= "number" or ItemLength <= 0 or ItemLength >= 1e999 then
				assert(false, `Layout.masonry: getItemLength({i1}) must return a finite positive number`)
			end
			local CrossAxisIndex = 1
			local BufferEntry = Buffer[1]
			
			for i2 = 2, CrossAxisCount do
				local BufferEntry1 = Buffer[i2]
				
				if BufferEntry1 < BufferEntry then
					CrossAxisIndex = i2
					BufferEntry = BufferEntry1
				end
			end
			Tbl[i1] = {
				startOffset = BufferEntry,
				length = ItemLength,
				crossAxisIndex = CrossAxisIndex,
				crossAxisCount = CrossAxisCount,
				crossAxisSpacing = CrossAxisSpacing
			}
			table.insert(Tbl1[CrossAxisIndex], i1)
			Buffer[CrossAxisIndex] = BufferEntry + ItemLength + Spacing
		end
		if #List == 0 then
			v1 = 0
			Flag = false
			
			return
		end
		local Largest: number = PaddingBefore
		
		for i3 = 1, CrossAxisCount do
			Largest = math.max(Largest, Buffer[i3])
		end
		v1 = Largest - Spacing + PaddingAfter
		Flag = false
	end
	
	local function firstIntersectingInColumn(p2, p3, p4)
		-- upvalues: Tbl (copy)
		if #p2 == 0 then
			return nil, nil
		end
		local v2 = 1
		local CountP4 = #p2
		while v2 < CountP4 do
			local CountPRatio = (v2 + CountP4) // 2
			local Entry = Tbl[p2[CountPRatio]]
			
			if p3 < Entry.startOffset + Entry.length then
				CountP4 = CountPRatio
			else
				v2 = CountPRatio + 1
			end
		end
		local v3: number = v2
		local Entry = Tbl[p2[v3]]
		
		if Entry.startOffset + Entry.length <= p3 or p4 <= Entry.startOffset then
			return nil, nil
		end
		local v4: number = v3
		local CountP41 = #p2
		while v4 < CountP41 do
			local CountPRatio = (v4 + CountP41 + 1) // 2
			
			if Tbl[p2[CountPRatio]].startOffset < p4 then
				v4 = CountPRatio
			else
				CountP41 = CountPRatio - 1
			end
		end
		return p2[v3], p2[v4]
	end
	
	return {
		getItemCount = function(): number
			-- upvalues: List (ref)
			return #List
		end,
		getContentLength = function()
			-- upvalues: rebuildGeometry (copy), v1 (ref)
			rebuildGeometry()
			
			return v1
		end,
		getIntersectingIndexRange = function(p5, p6)
			-- upvalues: rebuildGeometry (copy), List (ref), TypesModule (upval), CrossAxisCount (ref), firstIntersectingInColumn (copy), Tbl1 (copy)
			rebuildGeometry()
			
			if #List == 0 or p6 <= p5 then
				return TypesModule.EMPTY_INDEX_RANGE
			end
			local Smallest: number? = nil
			local Largest: number? = nil
			
			for i = 1, CrossAxisCount do
				local FirstIntersectingInColumnResult, FirstIntersectingInColumnResult2 = firstIntersectingInColumn(Tbl1[i], p5, p6)
				
				if FirstIntersectingInColumnResult ~= nil then
					if Smallest == nil then
						Smallest = FirstIntersectingInColumnResult
					else
						Smallest = math.min(Smallest, FirstIntersectingInColumnResult)
					end
					if Largest == nil then
						Largest = FirstIntersectingInColumnResult2
					else
						Largest = math.max(Largest, FirstIntersectingInColumnResult2)
					end
				end
			end
			return if Smallest == nil then TypesModule.EMPTY_INDEX_RANGE else { firstIndex = Smallest, lastIndex = Largest }
		end,
		expandIndexRange = function(p7, p8, p9)
			-- upvalues: StaticPartsModule (upval), List (ref)
			return StaticPartsModule.expandItemRange(p7, p8, p9 or p8, #List)
		end,
		getItemLayout = function(p7)
			-- upvalues: rebuildGeometry (copy), Tbl (copy)
			rebuildGeometry()
			local Entry = Tbl[p7]
			
			if Entry == nil then
				assert(false, `Layout.masonry: item index {p7} is out of bounds`)
			end
			return Entry
		end,
		updateItemMeasurement = StaticPartsModule.updateItemMeasurementNoop,
		requiresItemMeasurement = StaticPartsModule.requiresItemMeasurementFalse,
		applyDataSourceChange = function(p7): boolean
			-- upvalues: DataSourceChangeTypeModule (upval), List (ref), Flag (ref)
			if p7.type == DataSourceChangeTypeModule.Reset then
				List = table.clone(p7.keys)
			elseif p7.type == DataSourceChangeTypeModule.Insert then
				for i, key in p7.keys do
					table.insert(List, p7.index + i - 1, key)
				end
			elseif p7.type == DataSourceChangeTypeModule.Remove then
				for _, key1 in p7.keys do
					assert(List[p7.index] == key1, "Layout.masonry: remove keys do not match current order")
					table.remove(List, p7.index)
				end
			elseif p7.type == DataSourceChangeTypeModule.Move then
				assert(List[p7.fromIndex] == p7.key, "Layout.masonry: move key does not match current order")
				table.remove(List, p7.fromIndex)
				table.insert(List, p7.toIndex, p7.key)
			elseif p7.type == DataSourceChangeTypeModule.Reorder then
				List = table.clone(p7.keys)
			end
			Flag = true
			
			return true
		end,
		setViewportCrossAxisLength = function(p8): boolean
			-- upvalues: p1 (copy), CrossAxisSpacing (copy), CrossAxisCount (ref), Flag (ref)
			if p1.crossAxisItemLength == nil then
				return false
			end
			local Largest = math.max(1, (p8 + CrossAxisSpacing) // (p1.crossAxisItemLength + CrossAxisSpacing))
			
			if Largest == CrossAxisCount then
				return false
			else
				CrossAxisCount = Largest
				Flag = true
				
				return true
			end
		end,
		destroy = StaticPartsModule.noop
	}
end