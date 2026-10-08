local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local averagePropagationModule = require(viewRecycler.Core.Layout.Policies.AveragePropagation)
local collapsedEstimatedTreeModule = require(viewRecycler.Core.Layout.SizeTree.CollapsedEstimatedTree)
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local detachedMeasurementCacheModule = require(viewRecycler.Core.Layout.Policies.DetachedMeasurementCache)
local _ = require(viewRecycler.Core.Layout.LayoutRuntime)
local typesModule = require(viewRecycler.Core.Types)
local staticPartsModule = require(viewRecycler.Core.Layout.staticParts)
local var1 = require(viewRecycler.Internal.createDebugLogger)("Layout.measured")

return function(p1)
	-- upvalues: averagePropagationModule (ref), detachedMeasurementCacheModule (ref), collapsedEstimatedTreeModule (ref), typesModule (ref), var1 (ref), dataSourceChangeTypeModule (ref), staticPartsModule (ref)
	p1 = p1 or {}
	local estimatedItemLength = p1.estimatedItemLength or 50
	local estimationPolicy = p1.estimationPolicy or averagePropagationModule.new({ initialAverage = estimatedItemLength })
	local var2 = detachedMeasurementCacheModule.new(p1.detachedMeasurementCapacity)
	local var3 = collapsedEstimatedTreeModule.new(estimatedItemLength)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var4 = 0
	local var5 = 0
	local var6 = nil
	local var7 = 0
	local var8 = 0
	
	local function _()
		-- upvalues: var5 (write), var4 (write), estimatedItemLength (ref)
		return if var5 > 0 then var4 / var5 else estimatedItemLength
	end
	
	local _ = function(p2, p3)
		-- upvalues: t (ref), var4 (write), var5 (write)
		t[p2] = p3
		var4 += p3
		var5 += 1
	end
	
	local _ = function(p2)
		-- upvalues: var2 (ref), t (ref), var4 (write), var5 (write)
		local var9 = var2.take(p2)
		
		if var9 ~= nil then
			t[p2] = var9
			var4 += var9
			var5 += 1
		end
	end
	
	local _ = function(p2)
		-- upvalues: t (ref), var4 (write), var5 (write), var2 (ref)
		local var9 = t[p2]
		
		if var9 == nil then
			return
		end
		t[p2] = nil
		var4 -= var9
		var5 -= 1
		var2.put(p2, var9)
	end
	
	local function getItemCount()
		-- upvalues: var3 (ref)
		return var3.length()
	end
	
	local function getContentLength()
		-- upvalues: var3 (ref)
		return var3.totalSum()
	end
	
	local function getItemLayout(p2)
		-- upvalues: var6 (write), var7 (write), var8 (write), var3 (ref)
		return if var6 == p2 then { startOffset = var7, length = var8 } else {
			startOffset = var3.prefixSum(p2),
			length = var3.getSize(p2)
		}
	end
	
	local function getItemLayouts(p2, p3, p4)
		-- upvalues: var3 (ref)
		var3.fillRange(p2, p3, p4)
	end
	
	local function getIntersectingIndexRange(p2, p3)
		-- upvalues: var3 (ref), var6 (write), typesModule (copy), var7 (write), var8 (write)
		local var9 = var3.length()
		
		if var9 == 0 or p3 <= p2 then
			var6 = nil
			
			return typesModule.EMPTY_INDEX_RANGE
		end
		local var10, var11, var12 = var3.entryAtPrefixSum(p2)
		local clampedValue = math.clamp(var10, 1, var9)
		
		if var10 == clampedValue then
			var6 = clampedValue
			var7 = var11
			var8 = var12
		else
			var6 = nil
		end
		local clampedValue_1 = math.clamp(var3.indexAtPrefixSum(p3), clampedValue, var9)
		
		if p3 <= var3.prefixSum(clampedValue_1) then
			clampedValue_1 -= 1
		end
		return if clampedValue_1 < clampedValue then typesModule.EMPTY_INDEX_RANGE else { firstIndex = clampedValue, lastIndex = clampedValue_1 }
	end
	
	local function updateItemMeasurement(p2)
		-- upvalues: t_2 (write), var1 (copy), t (ref), var6 (write), var4 (write), var5 (write), var3 (ref), estimationPolicy (ref), estimatedItemLength (ref)
		local itemIndex = p2.itemIndex
		local itemKey = p2.itemKey
		local length = p2.length
		
		if t_2[itemIndex] ~= itemKey then
			var1("measurement DROPPED key=%s index=%d (index now holds %s)", itemKey, itemIndex, tostring(t_2[itemIndex]))
			
			return { accepted = false, geometryChanged = false }
		end
		local var9 = t[itemKey]
		
		if var9 == length then
			return { accepted = true, geometryChanged = false }
		end
		var6 = nil
		
		if var9 == nil then
			t[itemKey] = length
			var4 += length
			var5 += 1
		else
			var4 += length - var9
			t[itemKey] = length
		end
		local var10 = var3.getSize(itemIndex) ~= length and true
		var3.update(itemIndex, length)
		
		if estimationPolicy.recordMeasurementAndShouldUpdateEstimates(if var5 > 0 then var4 / var5 else estimatedItemLength) then
			var10 = var3.setEstimatedItemLength(if var5 > 0 then var4 / var5 else estimatedItemLength) or var10
		end
		var1("measurement key=%s index=%d length=%.1f (avg=%.2f, changed=%s)", itemKey, itemIndex, length, if var5 > 0 then var4 / var5 else estimatedItemLength, tostring(var10))
		
		return { accepted = true, geometryChanged = var10 }
	end
	
	local function requiresItemMeasurement()
		return true
	end
	
	local _ = function(p2)
		-- upvalues: t_2 (write), var3 (ref), t (ref)
		t_2 = p2
		var3.buildFromMeasurements(#p2, function(p3)
			-- upvalues: t (copy), p2 (ref)
			return t[p2[p3]]
		end)
	end
	
	local function applyReset(value)
		-- upvalues: t_1 (write), var2 (ref), t (ref), var4 (write), var5 (write), t_2 (write), var3 (ref)
		local valueCount = #value
		local list = table.create(valueCount)
		local t_3 = {}
		
		for i = 1, valueCount do
			local var9 = value[i]
			
			if t_3[var9] ~= nil then
				error(`Layout.measured: duplicate key "{var45}"`, 2)
			end
			list[i] = var9
			t_3[var9] = true
		end
		for i_1 in t_3 do
			if t_1[i_1] == nil then
				local var10 = var2.take(i_1)
				
				if var10 ~= nil then
					t[i_1] = var10
					var4 += var10
					var5 += 1
				end
			end
		end
		for i_2, v in t_2 do
			if t_3[v] == nil then
				local var11 = t[v]
				
				if var11 ~= nil then
					t[v] = nil
					var4 -= var11
					var5 -= 1
					var2.put(v, var11)
				end
			end
		end
		t_1 = t_3
		t_2 = list
		var3.buildFromMeasurements(#list, function(p2)
			-- upvalues: t (copy), list (ref)
			return t[list[p2]]
		end)
	end
	
	local function applyInsert(p2, p3)
		-- upvalues: t_1 (write), var2 (ref), t (ref), var4 (write), var5 (write), var3 (ref), t_2 (write)
		local var12
		local p16Count = #p3
		local t_3 = {}
		
		for i = 0, p16Count - 1 do
			var12 = p3[i + 1]
			
			if t_1[var12] ~= nil or t_3[var12] ~= nil then
				error(`Layout.measured: duplicate key "{var50}"`, 2)
			end
			t_3[var12] = true
		end
		for var12, v in p3 do
			local var13 = var2.take(v)
			
			if var13 ~= nil then
				t[v] = var13
				var4 += var13
				var5 += 1
			end
			t_1[v] = true
		end
		if var3.prefersIncremental(p16Count) then
			for var12, v_1 in p3 do
				local var14 = p2 + var12 - 1
				table.insert(t_2, var14, v_1)
				var3.insert(var14, t[v_1])
			end
			return
		else
			local t_2Count = #t_2
			local list = table.create(t_2Count + p16Count)
			table.move(t_2, 1, p2 - 1, 1, list)
			
			for i_3, v_1 in p3 do
				list[p2 + i_3 - 1] = v_1
			end
			table.move(t_2, p2, t_2Count, p2 + p16Count, list)
			t_2 = list
			var3.buildFromMeasurements(#list, function(p4)
				-- upvalues: t (copy), list (ref)
				return t[list[p4]]
			end)
		end
	end
	
	local function applyRemove(p4, p5)
		-- upvalues: t_2 (write), t_1 (write), t (ref), var4 (write), var5 (write), var2 (ref), var3 (ref)
		local p19Count = #p5
		
		for i = p4, p4 + p19Count - 1 do
			local var15 = t_2[i]
			assert(var15 == p5[i - p4 + 1], "Layout.measured: remove keys do not match current order")
			t_1[var15] = nil
			local var16 = t[var15]
			
			if var16 ~= nil then
				t[var15] = nil
				var4 -= var16
				var5 -= 1
				var2.put(var15, var16)
			end
		end
		if var3.prefersIncremental(p19Count) then
			for _ = 1, p19Count do
				table.remove(t_2, p4)
				var3.remove(p4)
			end
			return
		else
			local t_2Count = #t_2
			local list = table.create(t_2Count - p19Count)
			table.move(t_2, 1, p4 - 1, 1, list)
			table.move(t_2, p4 + p19Count, t_2Count, p4, list)
			t_2 = list
			var3.buildFromMeasurements(#list, function(p6)
				-- upvalues: t (copy), list (ref)
				return t[list[p6]]
			end)
		end
	end
	
	local _ = function(p6, p7, p8)
		-- upvalues: t_2 (write), var3 (ref), t (ref)
		assert(t_2[p6] == p8, "Layout.measured: move key does not match current order")
		table.remove(t_2, p6)
		var3.remove(p6)
		table.insert(t_2, p7, p8)
		var3.insert(p7, t[p8])
	end
	
	local function applyReorder(p6)
		-- upvalues: t_2 (write), t_1 (write), var3 (ref), t (ref)
		assert(#p6 == #t_2, "Layout.measured: reorder must contain every active key")
		local t_3 = {}
		
		for i, v in p6 do
			assert(t_1[v] == true and t_3[v] == nil, "Layout.measured: reorder must contain every active key once")
			t_3[v] = true
		end
		local cloned = table.clone(p6)
		t_2 = cloned
		var3.buildFromMeasurements(#cloned, function(p7)
			-- upvalues: t (copy), cloned (ref)
			return t[cloned[p7]]
		end)
	end
	
	return {
		getItemCount = getItemCount,
		getContentLength = getContentLength,
		getIntersectingIndexRange = getIntersectingIndexRange,
		expandIndexRange = function(p7, p8, p9)
			-- upvalues: staticPartsModule (copy), var3 (ref)
			return staticPartsModule.expandItemRange(p7, p8, p9 or p8, var3.length())
		end,
		getItemLayout = getItemLayout,
		getItemLayouts = getItemLayouts,
		updateItemMeasurement = updateItemMeasurement,
		requiresItemMeasurement = requiresItemMeasurement,
		applyDataSourceChange = function(p7)
			-- upvalues: var6 (write), dataSourceChangeTypeModule (copy), applyReset (ref), applyInsert (ref), applyRemove (ref), t_2 (write), var3 (ref), t (ref), applyReorder (ref)
			var6 = nil
			local var17 = true
			
			if p7.type == dataSourceChangeTypeModule.Reset then
				applyReset(p7.keys)
				
				return var17
			elseif p7.type == dataSourceChangeTypeModule.Insert then
				applyInsert(p7.index, p7.keys)
				
				return var17
			elseif p7.type == dataSourceChangeTypeModule.Remove then
				applyRemove(p7.index, p7.keys)
				
				return var17
			elseif p7.type == dataSourceChangeTypeModule.Update then
				var17 = false
				
				return var17
			elseif p7.type == dataSourceChangeTypeModule.Move then
				local fromIndex = p7.fromIndex
				local toIndex = p7.toIndex
				local key = p7.key
				assert(t_2[fromIndex] == key, "Layout.measured: move key does not match current order")
				table.remove(t_2, fromIndex)
				var3.remove(fromIndex)
				table.insert(t_2, toIndex, key)
				var3.insert(toIndex, t[key])
				
				return var17
			elseif p7.type == dataSourceChangeTypeModule.Reorder then
				applyReorder(p7.keys)
			end
			return var17
		end,
		setViewportCrossAxisLength = staticPartsModule.geometryUnchanged,
		destroy = function() end
	}
end