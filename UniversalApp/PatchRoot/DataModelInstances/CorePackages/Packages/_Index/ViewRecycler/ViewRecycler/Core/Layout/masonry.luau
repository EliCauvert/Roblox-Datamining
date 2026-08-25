local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Layout.LayoutRuntime)
local typesModule = require(viewRecycler.Core.Types)
local staticPartsModule = require(viewRecycler.Core.Layout.staticParts)

local function _(p0, p1)
	if p1 < 0 or p1 >= 1e999 then
		assert(false, `Layout.masonry: {p0} must be finite and non-negative`)
	end
end

return function(p2)
	-- upvalues: typesModule (ref), dataSourceChangeTypeModule (ref), staticPartsModule (ref)
	assert(type(p2.getItemLength) == "function", "Layout.masonry: getItemLength must be a function")
	assert(p2.crossAxisCount ~= nil ~= (p2.crossAxisItemLength ~= nil), "Layout.masonry: provide exactly one of crossAxisCount or crossAxisItemLength")
	
	if p2.crossAxisCount ~= nil then
		assert(p2.crossAxisCount > 0 and p2.crossAxisCount % 1 == 0, "Layout.masonry: crossAxisCount must be a positive integer")
	end
	if p2.crossAxisItemLength ~= nil then
		assert(p2.crossAxisItemLength > 0 and p2.crossAxisItemLength < 1e999, "Layout.masonry: crossAxisItemLength must be finite and positive")
	end
	local getItemLength = p2.getItemLength
	local spacing = p2.spacing or 0
	local crossAxisSpacing = p2.crossAxisSpacing or 0
	local paddingBefore = p2.paddingBefore or 0
	local paddingAfter = p2.paddingAfter or 0
	
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
	local crossAxisCount = p2.crossAxisCount or 1
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var12 = 0
	local var13 = true
	
	local function _()
		-- upvalues: var13 (write)
		var13 = true
	end
	
	local function rebuildGeometry()
		-- upvalues: var13 (write), t_1 (ref), t_2 (ref), crossAxisCount (write), paddingBefore (ref), t (write), getItemLength (ref), crossAxisSpacing (ref), spacing (ref), var12 (write), paddingAfter (ref)
		if not var13 then return end
		table.clear(t_1)
		table.clear(t_2)
		local list = table.create(crossAxisCount, paddingBefore)
		
		for i = 1, crossAxisCount do
			list[i] = paddingBefore
			t_2[i] = {}
		end
		local var17
		for i_2 = 1, #t do
			var17 = getItemLength(i_2)
			
			if type(var17) ~= "number" or var17 <= 0 or var17 >= 1e999 then
				assert(false, `Layout.masonry: getItemLength({i_2}) must return a finite positive number`)
			end
			local var18 = 1
			local var19 = list[1]
			
			for i_1 = 2, crossAxisCount do
				local var20 = list[i_1]
				
				if var20 < var19 then
					var18 = i_1
					var19 = var20
				end
			end
			t_1[i_2] = {
				startOffset = var19,
				length = var17,
				crossAxisIndex = var18,
				crossAxisCount = crossAxisCount,
				crossAxisSpacing = crossAxisSpacing
			}
			table.insert(t_2[var18], i_2)
			list[var18] = var19 + var17 + spacing
		end
		if #t == 0 then
			var12 = 0
			var13 = false
			
			return
		end
		local var21 = paddingBefore
		
		for var17 = 1, crossAxisCount do
			var21 = math.max(var21, list[var17])
		end
		var12 = var21 - spacing + paddingAfter
		var13 = false
	end
	
	local function firstIntersectingInColumn(p3, p4, p5)
		-- upvalues: t_1 (ref)
		if #p3 == 0 then
			return nil, nil
		end
		local var22 = 1
		local p3Count = #p3
		while var22 < p3Count do
			local var24 = (var22 + p3Count) // 2
			local var25 = t_1[p3[var24]]
			
			if p4 < var25.startOffset + var25.length then
				p3Count = var24
			else
				var22 = var24 + 1
			end
		end
		local var26 = t_1[p3[var22]]
		
		if var26.startOffset + var26.length <= p4 or p5 <= var26.startOffset then
			return nil, nil
		end
		var22 = var22
		local p3Count_1 = #p3
		while var22 < p3Count_1 do
			local var28 = (var22 + p3Count_1 + 1) // 2
			
			if t_1[p3[var28]].startOffset < p5 then
				var22 = var28
			else
				p3Count_1 = var28 - 1
			end
		end
		return p3[var22], p3[var22]
	end
	
	return {
		getItemCount = function()
			-- upvalues: t (write)
			return #t
		end,
		getContentLength = function()
			-- upvalues: rebuildGeometry (ref), var12 (write)
			rebuildGeometry()
			
			return var12
		end,
		getIntersectingIndexRange = function(p6, p7)
			-- upvalues: rebuildGeometry (ref), t (write), typesModule (copy), crossAxisCount (write), firstIntersectingInColumn (ref), t_2 (ref)
			rebuildGeometry()
			
			if #t == 0 or p7 <= p6 then
				return typesModule.EMPTY_INDEX_RANGE
			end
			local var29 = nil
			local var30 = nil
			
			for i = 1, crossAxisCount do
				local var31, var32 = firstIntersectingInColumn(t_2[i], p6, p7)
				
				if var31 ~= nil then
					var29 = if var29 == nil then var31 else math.min(var29, var31)
					var30 = if var30 == nil then var32 else math.max(var30, var32)
				end
			end
			return if var29 == nil then typesModule.EMPTY_INDEX_RANGE else { firstIndex = var29, lastIndex = var30 }
		end,
		expandIndexRange = function(p8, p9, p10)
			-- upvalues: staticPartsModule (copy), t (write)
			return staticPartsModule.expandItemRange(p8, p9, p10 or p9, #t)
		end,
		getItemLayout = function(p11)
			-- upvalues: rebuildGeometry (ref), t_1 (ref)
			rebuildGeometry()
			local var33 = t_1[p11]
			
			if var33 == nil then
				assert(false, `Layout.masonry: item index {p11} is out of bounds`)
			end
			return var33
		end,
		updateItemMeasurement = staticPartsModule.updateItemMeasurementNoop,
		requiresItemMeasurement = staticPartsModule.requiresItemMeasurementFalse,
		applyDataSourceChange = function(p12)
			-- upvalues: dataSourceChangeTypeModule (copy), t (write), var13 (write)
			if p12.type == dataSourceChangeTypeModule.Reset then
				t = table.clone(p12.keys)
			elseif p12.type == dataSourceChangeTypeModule.Insert then
				for i, v in p12.keys do
					table.insert(t, p12.index + i - 1, v)
				end
			elseif p12.type == dataSourceChangeTypeModule.Remove then
				for i, v in p12.keys do
					assert(t[p12.index] == v, "Layout.masonry: remove keys do not match current order")
					table.remove(t, p12.index)
				end
			elseif p12.type == dataSourceChangeTypeModule.Move then
				assert(t[p12.fromIndex] == p12.key, "Layout.masonry: move key does not match current order")
				table.remove(t, p12.fromIndex)
				table.insert(t, p12.toIndex, p12.key)
			elseif p12.type == dataSourceChangeTypeModule.Reorder then
				t = table.clone(p12.keys)
			end
			var13 = true
			
			return true
		end,
		setViewportCrossAxisLength = function(vectorA)
			-- upvalues: p2 (ref), crossAxisSpacing (ref), crossAxisCount (write), var13 (write)
			if p2.crossAxisItemLength == nil then
				return false
			end
			local maxValue = math.max(1, (vectorA + crossAxisSpacing) // (p2.crossAxisItemLength + crossAxisSpacing))
			
			if maxValue == crossAxisCount then
				return false
			end
			crossAxisCount = maxValue
			var13 = true
			
			return true
		end,
		destroy = staticPartsModule.noop
	}
end