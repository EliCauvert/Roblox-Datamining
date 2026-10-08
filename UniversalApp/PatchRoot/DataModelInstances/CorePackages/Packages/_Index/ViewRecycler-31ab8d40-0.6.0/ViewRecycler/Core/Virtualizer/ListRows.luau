local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.DataSource)
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local diagnosticsModule = require(viewRecycler.Core.Diagnostics)
local _ = require(viewRecycler.Core.Layout)
local placementTypesModule = require(viewRecycler.Core.Placement.PlacementTypes)
local shallowTableModule = require(viewRecycler.Internal.ShallowTable)
local typesModule = require(viewRecycler.Core.Types)
local _ = require(viewRecycler.Core.Recycling.SlotBinder)
local cloneFrozen = shallowTableModule.cloneFrozen
local containsEqual = shallowTableModule.containsEqual
local optionalContainsEqual = shallowTableModule.optionalContainsEqual
local ITEM_LAYOUT_KEYS = typesModule.ITEM_LAYOUT_KEYS
local ITEM_PLACEMENT_KEYS = placementTypesModule.ITEM_PLACEMENT_KEYS
local frozen = table.freeze({ firstIndex = 1, lastIndex = 0 })
local frozen_1 = table.freeze({})
local frozen_2 = table.freeze({})
local frozen_3 = table.freeze({
	hasViewportRelativePlacements = false,
	retainedItems = frozen_2,
	additionalItems = frozen_2,
	placements = frozen_1
})

local function _(p1, p2)
	return p1.firstIndex == p2.firstIndex and p1.lastIndex == p2.lastIndex
end

local _ = function(p1, p2)
	if p1 == p2 then
		return true
	end
	local itemLayout = p1.itemLayout
	local itemLayout_1 = p2.itemLayout
	
	return p1.assignment == p2.assignment and (p1.pinnedPosition == p2.pinnedPosition and (itemLayout.crossAxisIndex == itemLayout_1.crossAxisIndex and (itemLayout.crossAxisCount == itemLayout_1.crossAxisCount and itemLayout.crossAxisSpacing == itemLayout_1.crossAxisSpacing)))
end

local function resolveLayout(p1, p2, p3)
	-- upvalues: containsEqual (ref), ITEM_LAYOUT_KEYS (ref), cloneFrozen (ref)
	return if not (p2 ~= nil and containsEqual(p2, p1, ITEM_LAYOUT_KEYS)) then if table.isfrozen(p1) then p1 elseif p3 then table.freeze(p1) else cloneFrozen(p1) else p2
end

local function resolvePlacement(p1, p2, p3)
	-- upvalues: frozen_1 (ref), containsEqual (ref), ITEM_PLACEMENT_KEYS (ref), optionalContainsEqual (ref)
	local var1 = frozen_1
	local viewportPlacement = nil
	
	if p1 ~= nil and p1.viewportRelative then
		local mainAxisEndLimit = p1.mainAxisEndLimit
		var1 = {
			mainAxisOffset = p2 + (p1.mainAxisOffset or 0),
			mainAxisLength = p1.mainAxisLength,
			mainAxisEndLimit = if mainAxisEndLimit == nil then nil else p2 + mainAxisEndLimit,
			zIndex = p1.zIndex
		}
		viewportPlacement = {
			viewportRelative = true,
			mainAxisOffset = p1.mainAxisOffset,
			mainAxisLength = p1.mainAxisLength,
			mainAxisEndLimit = mainAxisEndLimit,
			zIndex = p1.zIndex
		}
	elseif p1 ~= nil then
		var1 = {
			mainAxisOffset = p1.mainAxisOffset,
			mainAxisLength = p1.mainAxisLength,
			mainAxisEndLimit = p1.mainAxisEndLimit,
			zIndex = p1.zIndex
		}
	end
	if p3 ~= nil and containsEqual(p3.canvasPlacement, var1, ITEM_PLACEMENT_KEYS) then
		var1 = p3.canvasPlacement
	elseif var1 ~= frozen_1 then
		table.freeze(var1)
	end
	if p3 ~= nil and optionalContainsEqual(p3.viewportPlacement, viewportPlacement, ITEM_PLACEMENT_KEYS) then
		viewportPlacement = p3.viewportPlacement
		
		return var1, viewportPlacement
	elseif viewportPlacement ~= nil then
		table.freeze(viewportPlacement)
	end
	return var1, viewportPlacement
end

return function(p1)
	-- upvalues: frozen (ref), frozen_3 (ref), frozen_2 (ref), dataSourceChangeTypeModule (ref), typesModule (ref), resolveLayout (ref), frozen_1 (ref), resolvePlacement (ref), diagnosticsModule (ref)
	local slotBinder = p1.slotBinder
	local var1 = false
	local t = {}
	local t_1 = {}
	local var2 = true
	local t_2 = {}
	local t_3 = {}
	local var3 = false
	local var4 = frozen
	local var5 = 0
	local var6 = nil
	local var7 = frozen_3
	local var8 = 0
	local var9 = frozen_2
	local var10 = false
	local var11 = false
	local var12 = false
	local t_4 = {}
	local var13 = nil
	local var14 = frozen
	
	local function _()
		-- upvalues: var3 (write), var4 (write), var13 (write), frozen (copy), var14 (write)
		return if var3 then var4 elseif var13 == nil then frozen else var14
	end
	
	local function noteDataChange(p2)
		-- upvalues: dataSourceChangeTypeModule (copy), var10 (write), var11 (write), t_4 (ref), var3 (write), var4 (write), var13 (write), frozen (copy), var14 (write), typesModule (copy)
		for i, v in p2.changes do
			local type = v.type
			
			if type == dataSourceChangeTypeModule.Reset then
				var10 = true
				var11 = true
			elseif type == dataSourceChangeTypeModule.Reorder then
				var10 = true
				continue
			end
			if type == dataSourceChangeTypeModule.Update then
				for i_1, v_1 in v.keys do
					t_4[v_1] = true
				end
			elseif type == dataSourceChangeTypeModule.Insert then
				for i_1, v_1 in v.keys do
					t_4[v_1] = true
				end
				local var15 = if var3 then var4 elseif var13 == nil then frozen else var14
				
				if not var10 and not typesModule.isIndexRangeEmpty(var15) and v.index <= var15.lastIndex then
					var10 = true
				end
			elseif type == dataSourceChangeTypeModule.Remove then
				local var16 = if var3 then var4 elseif var13 == nil then frozen else var14
				
				if not var10 and not typesModule.isIndexRangeEmpty(var16) and v.index <= var16.lastIndex then
					var10 = true
				end
			elseif type == dataSourceChangeTypeModule.Move then
				local var17 = if var3 then var4 elseif var13 == nil then frozen else var14
				
				if not var10 and not typesModule.isIndexRangeEmpty(var17) and (math.min(v.fromIndex, v.toIndex) <= var17.lastIndex and var17.firstIndex <= math.max(v.fromIndex, v.toIndex)) then
					var10 = true
				end
			end
		end
	end
	
	local function publish(p3, p4, p5, p6, p7)
		local state = p3.state
		local assignment = p3.assignment
		
		if state == nil or state.assignment ~= assignment or (state.index ~= p3.index or state.pinnedPosition ~= p3.pinnedPosition) or (state.itemLayout ~= p4 or state.canvasPlacement ~= p5 or (state.viewportPlacement ~= p6 or state.contentStartOffset ~= p7)) or p3.record.itemView ~= p3.view then
			local frozen = table.freeze({
				assignment = assignment,
				index = p3.index,
				pinnedPosition = p3.pinnedPosition,
				itemLayout = p4,
				canvasPlacement = p5,
				viewportPlacement = p6,
				contentStartOffset = p7
			})
			p3.state = frozen
			p3.record = table.freeze({ itemView = p3.view, state = frozen })
			
			return true
		end
		return false
	end
	
	local var18 = 0
	local var19 = nil
	local var20 = nil
	local var21 = 0
	local var22 = 0
	local var23 = false
	local var24 = 0
	local var25 = 0
	local t_5 = {}
	local t_6 = {}
	local var26 = 0
	local var27 = frozen_2
	local var28 = frozen_2
	local var29 = nil
	local t_7 = {}
	
	local _ = function(p3, p4, p5, p6)
		-- upvalues: var18 (write), var26 (write), t_5 (ref)
		local t = {
			side = false,
			entered = true,
			changed = true,
			key = p3,
			value = p5,
			viewType = p6,
			index = p4,
			epoch = var18
		}
		var26 += 1
		table.insert(t_5, t)
		
		return t
	end
	
	local _ = function(p3, p4, p5)
		-- upvalues: t_6 (ref), var18 (write), var26 (write), t_5 (ref)
		table.insert(t_6, p3.key)
		local t = {
			side = false,
			entered = true,
			changed = true,
			key = p3.key,
			value = p4,
			viewType = p5,
			index = p3.index,
			epoch = var18
		}
		var26 += 1
		table.insert(t_5, t)
		t.side = p3.side
		
		return t
	end
	
	local _ = function(p3, p4)
		-- upvalues: var18 (write)
		assert(p3.epoch ~= var18, `Virtualizer: duplicate key "{p25}"`)
		p3.epoch = var18
		p3.entered = false
		p3.changed = false
	end
	
	local function enterIndex(p3)
		-- upvalues: var19 (write), t_2 (write), var18 (write), p1 (ref), var26 (write), t_5 (ref)
		local itemKey = var19.getItemKey(p3)
		local var30 = t_2[itemKey]
		
		if var30 == nil then
			local item = var19.getItem(p3)
			local t = {
				side = false,
				entered = true,
				changed = true,
				key = itemKey,
				value = item,
				viewType = p1.getItemViewType(item, p3),
				index = p3,
				epoch = var18
			}
			var26 += 1
			table.insert(t_5, t)
			
			return t
		end
		assert(var30.epoch ~= var18, `Virtualizer: duplicate key "{itemKey}"`)
		var30.epoch = var18
		var30.entered = false
		var30.changed = false
		var30.index = p3
		var30.side = false
		
		return var30
	end
	
	local function reread(p3, p4)
		-- upvalues: var19 (write), p1 (ref), t_6 (ref), var18 (write), var26 (write), t_5 (ref)
		local index = p3.index
		
		if index == nil or p3.entered then
			return nil
		end
		local item = var19.getItem(index)
		local itemViewType = p1.getItemViewType(item, index)
		
		if itemViewType == p3.viewType then
			table.insert(t_5, {
				key = p3.key,
				value = item,
				viewType = itemViewType,
				changed = p4
			})
			
			return nil
		end
		table.insert(t_6, p3.key)
		local t = {
			side = false,
			entered = true,
			changed = true,
			key = p3.key,
			value = item,
			viewType = itemViewType,
			index = p3.index,
			epoch = var18
		}
		var26 += 1
		table.insert(t_5, t)
		local var30 = t
		var30.side = p3.side
		
		return var30
	end
	
	local function restate(p3)
		-- upvalues: t_7 (write), resolveLayout (copy), var23 (write), var29 (write), var24 (write), var25 (write), var20 (write), frozen_1 (copy), resolvePlacement (copy), var21 (write), publish (ref), var22 (write), var27 (write), var28 (write)
		local state = p3.state
		local var30 = if state == nil then nil else state.itemLayout
		local _ = nil
		local key = t_7[p3.key]
		local index = p3.index
		local var31 = if index == nil then resolveLayout({
			startOffset = 0,
			length = if key == nil then 0 else key.mainAxisLength or 0
		}, var30, true) elseif var30 ~= nil and not var23 and state.index == index then if var29 == nil or var24 > index or index > var25 then resolveLayout(var20.getItemLayout(index), var30) else resolveLayout(var29[index - var24 + 1], var30, true) else var30
		local var32 = frozen_1
		local var33 = nil
		
		if key ~= nil or state ~= nil and state.canvasPlacement ~= frozen_1 then
			local var34, var35 = resolvePlacement(key, var21, state)
			var32 = var34
			var33 = var35
		end
		if publish(p3, var31, var32, var33, var22) then
			if p3.entered then
				var27 = if table.isfrozen(var27) then {} else var27
				table.insert(var27, p3.record)
				
				return
			end
			var28 = if table.isfrozen(var28) then {} else var28
			table.insert(var28, p3.record)
		end
	end
	
	local function release()
		-- upvalues: var3 (write), frozen_2 (copy), var2 (write), t (write), var10 (write), var13 (write), var14 (write), var4 (write), slotBinder (ref), t_1 (write), t_2 (write), t_3 (write), frozen (copy), var7 (write), frozen_3 (copy), var6 (write), var9 (write)
		if not var3 then
			return frozen_2
		elseif var2 and #t > 0 and not var10 then
			local list = table.create(#t)
			
			for i, v in t do
				list[i] = v.key
			end
			var13 = list
			var14 = var4
		else
			var13 = nil
		end
		var10 = false
		local var30 = slotBinder.releaseAll()
		t = {}
		t_1 = {}
		var2 = true
		t_2 = {}
		t_3 = {}
		var3 = false
		var4 = frozen
		var7 = frozen_3
		var6 = nil
		var9 = frozen_2
		
		return var30
	end
	
	return {
		noteDataChange = noteDataChange,
		invalidateKeys = function()
			-- upvalues: var10 (write)
			var10 = true
		end,
		invalidatePayloads = function()
			-- upvalues: var11 (write)
			var11 = true
		end,
		invalidateLayout = function()
			-- upvalues: var12 (write)
			var12 = true
		end,
		apply = function(p3)
			-- upvalues: var1 (write), var19 (write), var20 (write), frozen_3 (copy), var21 (write), var22 (write), var23 (write), var12 (write), var6 (write), var5 (write), var4 (write), t_4 (ref), var3 (write), var10 (write), var11 (write), var7 (write), var8 (write), var18 (write), var24 (write), var25 (write), t_5 (ref), t_6 (ref), var26 (write), var2 (write), t (write), t_1 (write), enterIndex (ref), var13 (write), var14 (write), t_2 (write), p1 (ref), reread (ref), slotBinder (ref), t_3 (write), var27 (write), frozen_2 (copy), var28 (write), var29 (write), t_7 (write), restate (ref), var9 (write), diagnosticsModule (copy)
			if var1 then
				return nil, nil
			end
			var19 = p3.dataSource
			var20 = p3.layout
			local plan = p3.plan or frozen_3
			local mountedRange = p3.mountedRange
			var21 = p3.scrollOffset
			var22 = p3.contentStartOffset
			var23 = var12 or var20 ~= var6
			local var31 = var22 ~= var5
			local var32 = not (mountedRange.firstIndex == var4.firstIndex and mountedRange.lastIndex == var4.lastIndex)
			local var33 = next(t_4) ~= nil
			
			if var3 and not var10 and (not var11 and not var23) and (not var31 and not var32 and (not var33 and plan == var7)) then
				return nil, nil
			end
			local var34, i_2
			var8 += 1
			var18 = var8
			var24 = mountedRange.firstIndex
			var25 = math.min(mountedRange.lastIndex, var19.getItemCount())
			local maxValue = math.max(0, var25 - var24 + 1)
			local list = table.create(maxValue)
			local t_8 = {}
			table.clear(t_5)
			local t_9 = {}
			table.clear(t_6)
			var26 = 0
			local var35 = not var3 or (not var2 or var10)
			local var36 = var35 or (var23 or var31)
			
			if var35 then
				var34 = if var10 or var3 then nil else var13
				
				for i_2 = var24, var25 do
					local _ = nil
					local var37 = if var34 == nil or var14.firstIndex > i_2 or i_2 > var14.lastIndex then var19.getItemKey(i_2) else var34[i_2 - var14.firstIndex + 1]
					local var38 = t_2[var37]
					
					if var38 == nil then
						local item = var19.getItem(i_2)
						local var39 = i_2 - var24 + 1
						local t_10 = {
							side = false,
							entered = true,
							changed = true,
							key = var37,
							value = item,
							viewType = p1.getItemViewType(item, i_2),
							index = i_2,
							epoch = var18
						}
						var26 += 1
						table.insert(t_5, t_10)
						list[var39] = t_10
					else
						assert(var38.epoch ~= var18, `Virtualizer: duplicate key "{var89}"`)
						var38.epoch = var18
						var38.entered = false
						var38.changed = false
						var38.index = i_2
						var38.side = false
						list[i_2 - var24 + 1] = var38
					end
				end
				for i_6, v in t_2 do
					if v.epoch ~= var18 then
						table.insert(t_9, v)
					end
				end
			else
				local firstIndex = var4.firstIndex
				local lastIndex = var4.lastIndex
				local maxValue_1 = math.max(firstIndex, var24)
				local minValue = math.min(lastIndex, var25)
				
				for i = firstIndex, math.min(lastIndex, var24 - 1) do
					table.insert(t_9, t[i - firstIndex + 1])
				end
				for i_1 = math.max(firstIndex, var25 + 1), lastIndex do
					table.insert(t_9, t[i_1 - firstIndex + 1])
				end
				for i_2, v in t_1 do
					table.insert(t_9, v)
				end
				if maxValue_1 <= minValue then
					table.move(t, maxValue_1 - firstIndex + 1, minValue - firstIndex + 1, maxValue_1 - var24 + 1, list)
					
					for i_3 = maxValue_1 - var24 + 1, minValue - var24 + 1 do
						local var40 = list[i_3]
						var40.epoch = var18
						var40.entered = false
						var40.changed = false
					end
				end
				for i_4 = var24, math.min(var25, maxValue_1 - 1) do
					list[i_4 - var24 + 1] = enterIndex(i_4)
				end
				for i_5 = math.max(var24, minValue + 1), var25 do
					list[i_5 - var24 + 1] = enterIndex(i_5)
				end
			end
			local v
			for i_2, v in plan.retainedItems do
				if v.index < var24 or var25 < v.index then
					local key = t_2[v.key]
					
					if key == nil then
						local item = var19.getItem(v.index)
						local t_10 = {
							side = false,
							entered = true,
							changed = true,
							key = v.key,
							value = item,
							viewType = p1.getItemViewType(item, v.index),
							index = v.index,
							epoch = var18
						}
						var26 += 1
						table.insert(t_5, t_10)
						local var41 = t_10
						var41.side = true
						table.insert(t_8, var41)
					else
						assert(key.epoch ~= var18, `Virtualizer: duplicate key "{v.key}"`)
						key.epoch = var18
						key.entered = false
						key.changed = false
						key.index = v.index
						key.side = true
						table.insert(t_8, key)
					end
				end
			end
			for i_2, v in plan.additionalItems do
				local position = v.identity.position
				local pinnedItem = p1.getPinnedItem(position)
				
				if pinnedItem ~= nil and pinnedItem.key == v.key then
					local var42
					local key = t_2[v.key]
					local _ = nil
					
					if key == nil then
						local t_10 = {
							index = nil,
							side = false,
							entered = true,
							changed = true,
							key = v.key,
							value = pinnedItem.value,
							viewType = pinnedItem.itemViewType,
							epoch = var18
						}
						var26 += 1
						table.insert(t_5, t_10)
						var42 = t_10
					else
						assert(key.epoch ~= var18, `Virtualizer: duplicate key "{v.key}"`)
						key.epoch = var18
						key.entered = false
						key.changed = false
						var42 = key
						
						if var42.viewType ~= pinnedItem.itemViewType then
							local value = pinnedItem.value
							local itemViewType = pinnedItem.itemViewType
							table.insert(t_6, key.key)
							local t_10 = {
								side = false,
								entered = true,
								changed = true,
								key = key.key,
								value = value,
								viewType = itemViewType,
								index = key.index,
								epoch = var18
							}
							var26 += 1
							table.insert(t_5, t_10)
							local var43 = t_10
							var43.side = key.side
							var42 = var43
						elseif var42.value ~= pinnedItem.value then
							table.insert(t_5, {
								key = v.key,
								value = pinnedItem.value,
								viewType = pinnedItem.itemViewType
							})
						end
					end
					var42.index = nil
					var42.side = true
					var42.pinnedPosition = position
					var42.pinnedRevision = v.identity.revision
					table.insert(t_8, var42)
				end
			end
			if var11 then
				for i_2, v in list do
					list[i_2] = reread(v, false) or v
				end
				for i_2, v in t_8 do
					t_8[i_2] = reread(v, false) or v
				end
			elseif var33 then
				for i_2 in t_4 do
					local var44 = t_2[i_2]
					
					if var44 ~= nil and var44.epoch == var18 then
						local var45 = reread(var44, true)
						
						if var45 ~= nil then
							if var44.side then
								t_8[table.find(t_8, var44)] = var45
							else
								list[var44.index - var24 + 1] = var45
							end
						end
					end
				end
			end
			for i_2, v in t_9 do
				if v.epoch ~= var18 then
					table.insert(t_6, v.key)
				end
			end
			var34 = slotBinder.apply(t_6, t_5)
			
			for v, v_5 in t_6 do
				local var46 = t_2[v_5]
				t_2[v_5] = nil
				t_3[var46.view] = nil
			end
			for v, v_6 in var34.entered do
				t_2[v_6.key] = v_6
				t_3[v_6.view] = v_6
			end
			for v, v_7 in var34.updated do
				v_7.changed = true
			end
			local var47 = #t_6 - #var34.departed
			var27 = frozen_2
			var28 = frozen_2
			var29 = nil
			
			if maxValue > 1 and var20.getItemLayouts ~= nil and (var36 and (var23 or not var3) or maxValue < var26 * 2) then
				local list_1 = table.create(maxValue)
				var20.getItemLayouts(var24, var25, list_1)
				var29 = list_1
			end
			local v_8
			t_7 = plan.placements
			local placements = var7.placements
			
			if var36 then
				for i_15, v_8 in list do
					restate(v_8)
				end
			else
				for i_15, v_8 in list do
					if v_8.entered or v_8.changed then
						restate(v_8)
					end
				end
				for i_16 in t_7 do
					local var48 = t_2[i_16]
					
					if var48 ~= nil and not var48.side and (not var48.entered and not var48.changed) then
						restate(var48)
					end
				end
				for i_17 in placements do
					local var49 = t_2[i_17]
					
					if var49 ~= nil and t_7[i_17] == nil and (not var49.side and not var49.entered) and not var49.changed then
						restate(var49)
					end
				end
			end
			for i_15, v_8 in t_8 do
				restate(v_8)
			end
			i_2 = if #list == #t then if #t_8 == #t_1 then var32 else true else true
			
			if not i_2 and var35 then
				for v_8, v_10 in list do
					if t[v_8] ~= v_10 then
						i_2 = true
						break
					end
				end
			end
			if not i_2 then
				for v_8, v_10 in t_8 do
					if t_1[v_8] ~= v_10 then
						i_2 = true
						break
					end
				end
			end
			t = list
			t_1 = t_8
			var2 = maxValue == math.max(0, mountedRange.lastIndex - mountedRange.firstIndex + 1)
			var3 = true
			var4 = mountedRange
			var5 = var22
			var6 = var20
			var7 = plan
			var10 = false
			var11 = false
			var12 = false
			
			if var33 then
				table.clear(t_4)
			end
			var13 = nil
			v = var34.departed
			
			if not i_2 and #var27 == 0 and (#var28 == 0 and #v == 0) then
				return nil, nil
			end
			local list_1 = table.create(#t + #t_1)
			
			for i_18, v_10 in t do
				list_1[i_18] = v_10.record
			end
			local tCount = #t
			
			for i_19, v_11 in t_1 do
				list_1[tCount + i_19] = v_11.record
			end
			var9 = table.freeze(list_1)
			v_8 = #var27 + #var28 + #v
			local t_10 = { entered = var27, updated = var28, departed = v }
			
			if v_8 == 0 then
				return t_10, nil
			end
			return t_10, {
				kind = diagnosticsModule.EventKind.ItemViewsSynchronized,
				retained = #list_1 - #var27 - #var28,
				reassigned = var47,
				acquired = #var27 - var47,
				released = #v,
				touched = v_8
			}
		end,
		release = release,
		destroy = function()
			-- upvalues: var1 (write), release (ref), var13 (write), slotBinder (ref)
			if var1 then
				return
			end
			release()
			var13 = nil
			slotBinder.destroy()
			var1 = true
		end,
		isApplied = function()
			-- upvalues: var3 (write)
			return var3
		end,
		getMountedViews = function()
			-- upvalues: var9 (write)
			return var9
		end,
		validate = function(p4)
			-- upvalues: t_3 (write), t_2 (write)
			local t = {}
			local var50 = 0
			
			for i, v in p4 do
				local itemView = t_3[v.itemView]
				local state = v.state
				
				if itemView ~= nil then
					local var51
					local state_1 = itemView.state
					
					if state_1 == state then
						var51 = true
					else
						local itemLayout = state_1.itemLayout
						local itemLayout_1 = state.itemLayout
						var51 = state_1.assignment == state.assignment and (state_1.pinnedPosition == state.pinnedPosition and (itemLayout.crossAxisIndex == itemLayout_1.crossAxisIndex and (itemLayout.crossAxisCount == itemLayout_1.crossAxisCount and itemLayout.crossAxisSpacing == itemLayout_1.crossAxisSpacing)))
					end
					if var51 then
						table.insert(t, {
							index = itemView.index,
							key = itemView.key,
							pinnedPosition = itemView.pinnedPosition,
							pinnedRevision = itemView.pinnedRevision,
							length = v.length
						})
					elseif state.index == nil or state.pinnedPosition ~= nil or t_2[state.assignment.key] ~= nil then
						var50 += 1
					else
						table.insert(t, {
							index = state.index,
							key = state.assignment.key,
							length = v.length
						})
					end
				end
			end
			return t, var50
		end
	}
end