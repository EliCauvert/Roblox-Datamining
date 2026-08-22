local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local averagePropagationModule = require(viewRecycler.Core.Layout.Policies.AveragePropagation)
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local detachedMeasurementCacheModule = require(viewRecycler.Core.Layout.Policies.DetachedMeasurementCache)
local _ = require(viewRecycler.Core.Layout.LayoutRuntime)
local orderStatisticTreeModule = require(viewRecycler.Core.Layout.SizeTree.OrderStatisticTree)
local typesModule = require(viewRecycler.Core.Types)
local staticPartsModule = require(viewRecycler.Core.Layout.staticParts)
local var7 = require(viewRecycler.Internal.createDebugLogger)("Layout.measured")

return function(p0) --[[ line: 45 | named "measured" ]]
	-- upvalues: averagePropagationModule (ref), detachedMeasurementCacheModule (ref), orderStatisticTreeModule (ref), typesModule (ref), var7 (ref), dataSourceChangeTypeModule (ref), staticPartsModule (ref)
	p0 = p0 or {}
	local estimatedItemLength = p0.estimatedItemLength or 50
	local estimationPolicy = p0.estimationPolicy or averagePropagationModule.new({ initialAverage = estimatedItemLength })
	local var11 = detachedMeasurementCacheModule.new(p0.detachedMeasurementCapacity)
	local var12 = orderStatisticTreeModule.new(estimatedItemLength)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var16 = 0
	local var17 = 0
	local var18 = nil
	local var19 = 0
	local var20 = 0
	
	local function _() --[[ line: 62 | named "average" ]]
		-- upvalues: var17 (write), var16 (write), estimatedItemLength (ref)
		return if var17 > 0 then var16 / var17 else estimatedItemLength
	end
	
	local _ = function(p1, p2) --[[ line: 66 | named "addActiveMeasurement" ]]
		-- upvalues: t (ref), var16 (write), var17 (write)
		t[p1] = p2
		var16 += p2
		var17 += 1
	end
	
	local _ = function(p3) --[[ line: 72 | named "restoreActiveMeasurement" ]]
		-- upvalues: var11 (ref), t (ref), var16 (write), var17 (write)
		local var32 = var11.take(p3)
		
		if var32 ~= nil then
			t[p3] = var32
			var16 += var32
			var17 += 1
		end
	end
	
	local _ = function(p4) --[[ line: 79 | named "detachActiveMeasurement" ]]
		-- upvalues: t (ref), var16 (write), var17 (write), var11 (ref)
		local var33 = t[p4]
		
		if var33 == nil then
			return
		end
		t[p4] = nil
		var16 -= var33
		var17 -= 1
		var11.put(p4, var33)
	end
	
	local function getItemCount() --[[ line: 90 ]]
		-- upvalues: var12 (ref)
		return var12.length()
	end
	
	local function getContentLength() --[[ line: 94 ]]
		-- upvalues: var12 (ref)
		return var12.totalSum()
	end
	
	local function getItemLayout(p5) --[[ line: 98 ]]
		-- upvalues: var18 (write), var19 (write), var20 (write), var12 (ref)
		return if var18 == p5 then { startOffset = var19, length = var20 } else {
			startOffset = var12.prefixSum(p5),
			length = var12.getSize(p5)
		}
	end
	
	local function getItemLayouts(p6, p7, p8) --[[ line: 111 ]]
		-- upvalues: var12 (ref)
		var12.fillRange(p6, p7, p8)
	end
	
	local function getIntersectingIndexRange(p9, p10) --[[ line: 115 ]]
		-- upvalues: var12 (ref), var18 (write), typesModule (copy), var19 (write), var20 (write)
		local var34 = var12.length()
		
		if var34 == 0 or p10 <= p9 then
			var18 = nil
			
			return typesModule.EMPTY_INDEX_RANGE
		end
		local var35, var36, var37 = var12.entryAtPrefixSum(p9)
		local clampedValue = math.clamp(var35, 1, var34)
		
		if var35 == clampedValue then
			var18 = clampedValue
			var19 = var36
			var20 = var37
		else
			var18 = nil
		end
		local clampedValue_1 = math.clamp(var12.indexAtPrefixSum(p10), clampedValue, var34)
		
		if p10 <= var12.prefixSum(clampedValue_1) then
			clampedValue_1 -= 1
		end
		return if clampedValue_1 < clampedValue then typesModule.EMPTY_INDEX_RANGE else { firstIndex = clampedValue, lastIndex = clampedValue_1 }
	end
	
	local function updateItemMeasurement(p11) --[[ line: 142 ]]
		-- upvalues: t_2 (write), var7 (copy), t (ref), var18 (write), var16 (write), var17 (write), var12 (ref), estimationPolicy (ref), estimatedItemLength (ref)
		local itemIndex = p11.itemIndex
		local itemKey = p11.itemKey
		local length = p11.length
		
		if t_2[itemIndex] ~= itemKey then
			var7("measurement DROPPED key=%s index=%d (index now holds %s)", itemKey, itemIndex, tostring(t_2[itemIndex]))
			
			return { accepted = false, geometryChanged = false }
		end
		local var40 = t[itemKey]
		
		if var40 == length then
			return { accepted = true, geometryChanged = false }
		end
		var18 = nil
		
		if var40 == nil then
			t[itemKey] = length
			var16 += length
			var17 += 1
		else
			var16 += length - var40
			t[itemKey] = length
		end
		local var41 = var12.getSize(itemIndex) ~= length and true
		var12.update(itemIndex, length)
		
		if estimationPolicy.recordMeasurementAndShouldUpdateEstimates(if var17 > 0 then var16 / var17 else estimatedItemLength) then
			var41 = var12.setEstimatedItemLength(if var17 > 0 then var16 / var17 else estimatedItemLength) or var41
		end
		var7("measurement key=%s index=%d length=%.1f (avg=%.2f, changed=%s)", itemKey, itemIndex, length, if var17 > 0 then var16 / var17 else estimatedItemLength, tostring(var41))
		
		return { accepted = true, geometryChanged = var41 }
	end
	
	local function requiresItemMeasurement() --[[ line: 195 ]]
		return true
	end
	
	local _ = function(p12) --[[ line: 199 | named "rebuildFromKeys" ]]
		-- upvalues: t_2 (write), var12 (ref), t (ref)
		t_2 = p12
		var12.buildFromMeasurements(#p12, function(p13) --[[ line: 201 ]]
			-- upvalues: t (copy), p12 (ref)
			return t[p12[p13]]
		end)
	end
	
	local function applyReset(value) --[[ line: 206 ]]
		-- upvalues: t_1 (write), var11 (ref), t (ref), var16 (write), var17 (write), t_2 (write), var12 (ref)
		local valueCount = #value
		local list = table.create(valueCount)
		local t_3 = {}
		
		for i = 1, valueCount do
			local var45 = value[i]
			
			if t_3[var45] ~= nil then
				error(`Layout.measured: duplicate key "{var45}"`, 2)
			end
			list[i] = var45
			t_3[var45] = true
		end
		for i_1 in t_3 do
			if t_1[i_1] == nil then
				local var47 = var11.take(i_1)
				
				if var47 ~= nil then
					t[i_1] = var47
					var16 += var47
					var17 += 1
				end
			end
		end
		for i_2, v in t_2 do
			if t_3[v] == nil then
				local var46 = t[v]
				
				if var46 ~= nil then
					t[v] = nil
					var16 -= var46
					var17 -= 1
					var11.put(v, var46)
				end
			end
		end
		t_1 = t_3
		t_2 = list
		var12.buildFromMeasurements(#list, function(p14) --[[ line: 201 ]]
			-- upvalues: t (copy), list (ref)
			return t[list[p14]]
		end)
	end
	
	local function applyInsert(p15, p16) --[[ line: 235 ]]
		-- upvalues: t_1 (write), var11 (ref), t (ref), var16 (write), var17 (write), var12 (ref), t_2 (write)
		local var50
		local p16Count = #p16
		local t_3 = {}
		
		for i = 0, p16Count - 1 do
			var50 = p16[i + 1]
			
			if t_1[var50] ~= nil or t_3[var50] ~= nil then
				error(`Layout.measured: duplicate key "{var50}"`, 2)
			end
			t_3[var50] = true
		end
		for var50, v in p16 do
			local var54 = var11.take(v)
			
			if var54 ~= nil then
				t[v] = var54
				var16 += var54
				var17 += 1
			end
			t_1[v] = true
		end
		if var12.prefersIncremental(p16Count) then
			for var50, v_1 in p16 do
				local var51 = p15 + var50 - 1
				table.insert(t_2, var51, v_1)
				var12.insert(var51, t[v_1])
			end
			return
		else
			local t_2Count = #t_2
			local list = table.create(t_2Count + p16Count)
			table.move(t_2, 1, p15 - 1, 1, list)
			
			for i_3, v_1 in p16 do
				list[p15 + i_3 - 1] = v_1
			end
			table.move(t_2, p15, t_2Count, p15 + p16Count, list)
			t_2 = list
			var12.buildFromMeasurements(#list, function(p17) --[[ line: 201 ]]
				-- upvalues: t (copy), list (ref)
				return t[list[p17]]
			end)
		end
	end
	
	local function applyRemove(p18, p19) --[[ line: 271 ]]
		-- upvalues: t_2 (write), t_1 (write), t (ref), var16 (write), var17 (write), var11 (ref), var12 (ref)
		local p19Count = #p19
		
		for i = p18, p18 + p19Count - 1 do
			local var56 = t_2[i]
			assert(var56 == p19[i - p18 + 1], "Layout.measured: remove keys do not match current order")
			t_1[var56] = nil
			local var57 = t[var56]
			
			if var57 ~= nil then
				t[var56] = nil
				var16 -= var57
				var17 -= 1
				var11.put(var56, var57)
			end
		end
		if var12.prefersIncremental(p19Count) then
			for _ = 1, p19Count do
				table.remove(t_2, p18)
				var12.remove(p18)
			end
			return
		else
			local t_2Count = #t_2
			local list = table.create(t_2Count - p19Count)
			table.move(t_2, 1, p18 - 1, 1, list)
			table.move(t_2, p18 + p19Count, t_2Count, p18, list)
			t_2 = list
			var12.buildFromMeasurements(#list, function(p20) --[[ line: 201 ]]
				-- upvalues: t (copy), list (ref)
				return t[list[p20]]
			end)
		end
	end
	
	local _ = function(p21, p22, p23) --[[ line: 295 | named "applyMove" ]]
		-- upvalues: t_2 (write), var12 (ref), t (ref)
		assert(t_2[p21] == p23, "Layout.measured: move key does not match current order")
		table.remove(t_2, p21)
		var12.remove(p21)
		table.insert(t_2, p22, p23)
		var12.insert(p22, t[p23])
	end
	
	local function applyReorder(p24) --[[ line: 303 ]]
		-- upvalues: t_2 (write), t_1 (write), var12 (ref), t (ref)
		assert(#p24 == #t_2, "Layout.measured: reorder must contain every active key")
		local t_3 = {}
		
		for i, v in p24 do
			assert(t_1[v] == true and t_3[v] == nil, "Layout.measured: reorder must contain every active key once")
			t_3[v] = true
		end
		local cloned = table.clone(p24)
		t_2 = cloned
		var12.buildFromMeasurements(#cloned, function(p25) --[[ line: 201 ]]
			-- upvalues: t (copy), cloned (ref)
			return t[cloned[p25]]
		end)
	end
	
	return {
		getItemCount = getItemCount,
		getContentLength = getContentLength,
		getIntersectingIndexRange = getIntersectingIndexRange,
		expandIndexRange = function(p26, p27, p28) --[[ line: 342 ]]
			-- upvalues: staticPartsModule (copy), var12 (ref)
			return staticPartsModule.expandItemRange(p26, p27, p28 or p27, var12.length())
		end,
		getItemLayout = getItemLayout,
		getItemLayouts = getItemLayouts,
		updateItemMeasurement = updateItemMeasurement,
		requiresItemMeasurement = requiresItemMeasurement,
		applyDataSourceChange = function(p29) --[[ line: 316 ]]
			-- upvalues: var18 (write), dataSourceChangeTypeModule (copy), applyReset (ref), applyInsert (ref), applyRemove (ref), t_2 (write), var12 (ref), t (ref), applyReorder (ref)
			var18 = nil
			local var62 = true
			
			if p29.type == dataSourceChangeTypeModule.Reset then
				applyReset(p29.keys)
				
				return var62
			elseif p29.type == dataSourceChangeTypeModule.Insert then
				applyInsert(p29.index, p29.keys)
				
				return var62
			elseif p29.type == dataSourceChangeTypeModule.Remove then
				applyRemove(p29.index, p29.keys)
				
				return var62
			elseif p29.type == dataSourceChangeTypeModule.Update then
				var62 = false
				
				return var62
			elseif p29.type == dataSourceChangeTypeModule.Move then
				local fromIndex = p29.fromIndex
				local toIndex = p29.toIndex
				local key = p29.key
				assert(t_2[fromIndex] == key, "Layout.measured: move key does not match current order")
				table.remove(t_2, fromIndex)
				var12.remove(fromIndex)
				table.insert(t_2, toIndex, key)
				var12.insert(toIndex, t[key])
				
				return var62
			elseif p29.type == dataSourceChangeTypeModule.Reorder then
				applyReorder(p29.keys)
			end
			return var62
		end,
		setViewportCrossAxisLength = staticPartsModule.geometryUnchanged,
		destroy = function() --[[ line: 351 ]] end
	}
end