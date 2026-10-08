local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Layout.LayoutRuntime)
local typesModule = require(viewRecycler.Core.Types)
local staticPartsModule = require(viewRecycler.Core.Layout.staticParts)

local function _(p1, p2)
	if p2 < 0 or p2 >= 1e999 then
		assert(false, `Layout.masonry: {p1} must be finite and non-negative`)
	end
end

return function(p1)
	-- upvalues: typesModule (ref), dataSourceChangeTypeModule (ref), staticPartsModule (ref)
	assert(type(p1.getItemLength) == "function", "Layout.masonry: getItemLength must be a function")
	assert(p1.crossAxisCount ~= nil ~= (p1.crossAxisItemLength ~= nil), "Layout.masonry: provide exactly one of crossAxisCount or crossAxisItemLength")
	
	if p1.crossAxisCount ~= nil then
		assert(p1.crossAxisCount > 0 and p1.crossAxisCount % 1 == 0, "Layout.masonry: crossAxisCount must be a positive integer")
	end
	if p1.crossAxisItemLength ~= nil then
		assert(p1.crossAxisItemLength > 0 and p1.crossAxisItemLength < 1e999, "Layout.masonry: crossAxisItemLength must be finite and positive")
	end
	local getItemLength = p1.getItemLength
	local spacing = p1.spacing or 0
	local crossAxisSpacing = p1.crossAxisSpacing or 0
	local paddingBefore = p1.paddingBefore or 0
	local paddingAfter = p1.paddingAfter or 0
	
	if spacing < 0 or spacing >= 1e999 then
		assert(false, "Layout.masonry: spacing must be finite and non-negative")
	end
	if crossAxisSpacing < 0 or crossAxisSpacing >= 1e999 then
		assert(false, "Layout.masonry: crossAxisSpacing must be finite and non-negative")
	end
	if paddingBefore < 0 or paddingBefore >= 1e999 then
		assert(false, "Layout.masonry: paddingBefore must be finite and non-negative")
	end
	if paddingAfter < 0 or paddingAfter >= 1e999 then
		assert(false, "Layout.masonry: paddingAfter must be finite and non-negative")
	end
	local crossAxisCount = p1.crossAxisCount or 1
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var1 = 0
	local var2 = true
	
	local function _()
		-- upvalues: var2 (write)
		var2 = true
	end
	
	local function rebuildGeometry()
		-- upvalues: var2 (write), t_1 (ref), t_2 (ref), crossAxisCount (write), paddingBefore (ref), t (write), getItemLength (ref), crossAxisSpacing (ref), spacing (ref), var1 (write), paddingAfter (ref)
		if not var2 then return end
		table.clear(t_1)
		table.clear(t_2)
		local list = table.create(crossAxisCount, paddingBefore)
		
		for i = 1, crossAxisCount do
			list[i] = paddingBefore
			t_2[i] = {}
		end
		local var3
		for i_2 = 1, #t do
			var3 = getItemLength(i_2)
			
			if type(var3) ~= "number" or var3 <= 0 or var3 >= 1e999 then
				assert(false, `Layout.masonry: getItemLength({i_2}) must return a finite positive number`)
			end
			local var4 = 1
			local var5 = list[1]
			
			for i_1 = 2, crossAxisCount do
				local var6 = list[i_1]
				
				if var6 < var5 then
					var4 = i_1
					var5 = var6
				end
			end
			t_1[i_2] = {
				startOffset = var5,
				length = var3,
				crossAxisIndex = var4,
				crossAxisCount = crossAxisCount,
				crossAxisSpacing = crossAxisSpacing
			}
			table.insert(t_2[var4], i_2)
			list[var4] = var5 + var3 + spacing
		end
		if #t == 0 then
			var1 = 0
			var2 = false
			
			return
		end
		local var7 = paddingBefore
		
		for var3 = 1, crossAxisCount do
			var7 = math.max(var7, list[var3])
		end
		var1 = var7 - spacing + paddingAfter
		var2 = false
	end
	
	local function firstIntersectingInColumn(p2, p3, p4)
		-- upvalues: t_1 (ref)
		if #p2 == 0 then
			return nil, nil
		end
		local var8 = 1
		local p3Count = #p2
		while var8 < p3Count do
			local var9 = (var8 + p3Count) // 2
			local var10 = t_1[p2[var9]]
			
			if p3 < var10.startOffset + var10.length then
				p3Count = var9
			else
				var8 = var9 + 1
			end
		end
		local var11 = t_1[p2[var8]]
		
		if var11.startOffset + var11.length <= p3 or p4 <= var11.startOffset then
			return nil, nil
		end
		var8 = var8
		local p3Count_1 = #p2
		while var8 < p3Count_1 do
			local var12 = (var8 + p3Count_1 + 1) // 2
			
			if t_1[p2[var12]].startOffset < p4 then
				var8 = var12
			else
				p3Count_1 = var12 - 1
			end
		end
		return p2[var8], p2[var8]
	end
	
	return {
		getItemCount = function()
			-- upvalues: t (write)
			return #t
		end,
		getContentLength = function()
			-- upvalues: rebuildGeometry (ref), var1 (write)
			rebuildGeometry()
			
			return var1
		end,
		getIntersectingIndexRange = function(p5, p6)
			-- upvalues: rebuildGeometry (ref), t (write), typesModule (copy), crossAxisCount (write), firstIntersectingInColumn (ref), t_2 (ref)
			rebuildGeometry()
			
			if #t == 0 or p6 <= p5 then
				return typesModule.EMPTY_INDEX_RANGE
			end
			local var13 = nil
			local var14 = nil
			
			for i = 1, crossAxisCount do
				local var15, var16 = firstIntersectingInColumn(t_2[i], p5, p6)
				
				if var15 ~= nil then
					var13 = if var13 == nil then var15 else math.min(var13, var15)
					var14 = if var14 == nil then var16 else math.max(var14, var16)
				end
			end
			return if var13 == nil then typesModule.EMPTY_INDEX_RANGE else { firstIndex = var13, lastIndex = var14 }
		end,
		expandIndexRange = function(p7, p8, p9)
			-- upvalues: staticPartsModule (copy), t (write)
			return staticPartsModule.expandItemRange(p7, p8, p9 or p8, #t)
		end,
		getItemLayout = function(p7)
			-- upvalues: rebuildGeometry (ref), t_1 (ref)
			rebuildGeometry()
			local var17 = t_1[p7]
			
			if var17 == nil then
				assert(false, `Layout.masonry: item index {p7} is out of bounds`)
			end
			return var17
		end,
		updateItemMeasurement = staticPartsModule.updateItemMeasurementNoop,
		requiresItemMeasurement = staticPartsModule.requiresItemMeasurementFalse,
		applyDataSourceChange = function(p7)
			-- upvalues: dataSourceChangeTypeModule (copy), t (write), var2 (write)
			if p7.type == dataSourceChangeTypeModule.Reset then
				t = table.clone(p7.keys)
			elseif p7.type == dataSourceChangeTypeModule.Insert then
				for i, v in p7.keys do
					table.insert(t, p7.index + i - 1, v)
				end
			elseif p7.type == dataSourceChangeTypeModule.Remove then
				for i, v in p7.keys do
					assert(t[p7.index] == v, "Layout.masonry: remove keys do not match current order")
					table.remove(t, p7.index)
				end
			elseif p7.type == dataSourceChangeTypeModule.Move then
				assert(t[p7.fromIndex] == p7.key, "Layout.masonry: move key does not match current order")
				table.remove(t, p7.fromIndex)
				table.insert(t, p7.toIndex, p7.key)
			elseif p7.type == dataSourceChangeTypeModule.Reorder then
				t = table.clone(p7.keys)
			end
			var2 = true
			
			return true
		end,
		setViewportCrossAxisLength = function(vectorA)
			-- upvalues: p1 (ref), crossAxisSpacing (ref), crossAxisCount (write), var2 (write)
			if p1.crossAxisItemLength == nil then
				return false
			end
			local maxValue = math.max(1, (vectorA + crossAxisSpacing) // (p1.crossAxisItemLength + crossAxisSpacing))
			
			if maxValue == crossAxisCount then
				return false
			end
			crossAxisCount = maxValue
			var2 = true
			
			return true
		end,
		destroy = staticPartsModule.noop
	}
end