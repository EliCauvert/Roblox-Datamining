local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local diagnosticsModule = require(viewRecycler.Core.Diagnostics)
local _ = require(viewRecycler.Core.Placement.PlacementTypes)
local recordModule = require(viewRecycler.Internal.Record)
local _ = require(viewRecycler.Core.Types)
local _ = require(viewRecycler.Core.Virtualizer.VirtualizerSnapshot)
local _ = require(viewRecycler.Core.RecyclingScope)
local frozen = table.freeze({ "index", "value" })
local frozen_1 = table.freeze({ "kind", "revision" })

local function _(value, p1)
	-- upvalues: recordModule (ref), frozen (ref), frozen_1 (ref)
	return not recordModule.containsEqual(value, p1, frozen) or not recordModule.containsEqual(value.identity, p1.identity, frozen_1)
end

return function(p1)
	-- upvalues: recordModule (ref), frozen (ref), frozen_1 (ref), diagnosticsModule (ref)
	local recyclingScope = p1.recyclingScope
	local t = {}
	local var1 = nil
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local tbl = setmetatable({}, { __mode = "k" })
	local var2 = 1
	local var3 = false
	
	local function makeAssignment(value)
		-- upvalues: p1 (ref), var2 (write)
		local t = {
			key = value.key,
			index = value.index,
			value = value.value
		}
		
		if p1.prepareDesiredAssignment ~= nil then
			t = p1.prepareDesiredAssignment(t)
		end
		local t_1 = {
			key = t.key,
			index = t.index,
			value = t.value,
			generation = var2
		}
		var2 += 1
		
		return t_1
	end
	
	local function resolvePlacementIntent(p2)
		-- upvalues: t_3 (write), var1 (write)
		local var4 = t_3[p2]
		
		if var4 == nil or var1 == nil then
			return nil
		end
		local desired = var4.desired
		
		return {
			assignment = var4.assignment,
			itemLayout = desired.itemLayout,
			canvasPlacement = desired.canvasPlacement,
			viewportPlacement = desired.viewportPlacement,
			contentStartOffset = var1.contentStartOffset,
			measurementIdentity = {
				itemIndex = var4.assignment.index,
				itemKey = var4.assignment.key,
				assignmentGeneration = var4.assignment.generation,
				itemRevision = desired.measurementIdentity.itemRevision,
				pinnedPosition = desired.measurementIdentity.pinnedPosition
			}
		}
	end
	
	local function publish(p2, p3)
		-- upvalues: p1 (ref), resolvePlacementIntent (ref), tbl (ref)
		for i, v in p2 do
			if p1.prepareItemViewAssignment ~= nil then
				p1.prepareItemViewAssignment(v.itemView, v.assignment)
			end
		end
		if p1.applyItemViewPlacementIntent ~= nil then
			for i_1, v_1 in p2 do
				p1.applyItemViewPlacementIntent(v_1.itemView, if v_1.assignment == nil then nil else resolvePlacementIntent(v_1.itemView))
				p3[v_1.itemView] = nil
			end
			for i_2 in p3 do
				p1.applyItemViewPlacementIntent(i_2, resolvePlacementIntent(i_2))
			end
		end
		for i_1 in p3 do
			local var4 = tbl[i_1]
			
			if var4 ~= nil then
				var4()
			end
		end
		for i_2, v_1 in p2 do
			if p1.postCommitItemViewAssignment ~= nil then
				p1.postCommitItemViewAssignment(v_1.itemView, v_1.assignment)
			end
		end
		if p1.presentItemViewAssignment ~= nil then
			for i_3, v_2 in p2 do
				if v_2.assignment ~= nil then
					p1.presentItemViewAssignment(v_2.itemView, v_2.assignment)
				end
			end
		end
	end
	
	local function reconcile(p4)
		-- upvalues: t_2 (write), t_1 (ref), makeAssignment (ref), recyclingScope (ref), t (ref), recordModule (copy), frozen (copy), frozen_1 (copy), t_3 (write), var1 (write), publish (ref), diagnosticsModule (copy)
		local v_4
		local t_4 = {}
		local list = table.create(#p4.entries)
		local t_5 = {}
		local t_6 = {}
		local t_7 = {}
		local t_8 = {}
		local t_9 = {}
		local t_10 = {}
		local t_11 = {}
		local var5 = 0
		local var6 = 0
		local var7 = 0
		
		for i, v in p4.entries do
			assert(t_4[v.key] == nil, `Virtualizer: duplicate key "{v.key}"`)
			t_4[v.key] = v
			v_4 = t_2[v.key]
			
			if v_4 == nil or v_4.itemViewType ~= v.recyclableViewType then
				table.insert(t_8, i)
			else
				list[i] = v_4
			end
		end
		for i_1, v_1 in t_1 do
			v_4 = t_4[v_1.assignment.key]
			
			if v_4 == nil or v_1.itemViewType ~= v_4.recyclableViewType then
				local itemViewType = t_9[v_1.itemViewType]
				
				if itemViewType == nil then
					itemViewType = {}
					t_9[v_1.itemViewType] = itemViewType
				end
				table.insert(itemViewType, v_1)
			end
		end
		for i_2, v_2 in t_8 do
			v_4 = p4.entries[v_2]
			local recyclableViewType = t_9[v_4.recyclableViewType]
			local var8 = if recyclableViewType == nil then nil else table.remove(recyclableViewType)
			
			if var8 == nil then
				table.insert(t_7, v_2)
				table.insert(t_6, { viewType = v_4.recyclableViewType })
			else
				var8.assignment = makeAssignment(v_4)
				var8.desired = v_4
				list[v_2] = var8
				var6 += 1
			end
		end
		for i_3, v_3 in t_9 do
			for i_4, v_5 in v_3 do
				table.insert(t_5, { record = v_5.itemView, leaseToken = v_5.leaseToken })
			end
		end
		local var9 = if #t_5 == 0 and #t_6 == 0 then { releasedCount = 0, acquired = {} } else recyclingScope.exchange(t, t_5, t_6)
		
		for i_4, v_4 in t_7 do
			local var10 = p4.entries[v_4]
			local var11 = var9.acquired[i_4]
			list[v_4] = {
				itemView = var11.record,
				itemViewType = var10.recyclableViewType,
				leaseToken = var11.leaseToken,
				assignment = makeAssignment(var10),
				desired = var10
			}
			var7 += 1
		end
		local t_12 = {}
		local t_13 = {}
		
		for i_5, v_5 in p4.entries do
			local var12 = list[i_5]
			local desired = var12.desired
			
			if t_2[v_5.key] ~= var12 then
				table.insert(t_10, { itemView = var12.itemView, assignment = var12.assignment })
				t_12[var12.assignment.key] = var12
				t_13[var12.itemView] = var12
			end
			if not recordModule.containsEqual(desired, v_5, frozen) or not recordModule.containsEqual(desired.identity, v_5.identity, frozen_1) then
				var12.assignment = makeAssignment(v_5)
				table.insert(t_10, { itemView = var12.itemView, assignment = var12.assignment })
				var6 += 1
			else
				var5 += 1
			end
			if desired ~= v_5 then
				t_11[var12.itemView] = true
			end
			var12.desired = v_5
		end
		for i_6, v_5 in t_1 do
			if t_13[v_5.itemView] == nil then
				table.insert(t_10, { assignment = nil, itemView = v_5.itemView })
			end
		end
		table.clear(t_1)
		
		for v_4 = 1, #p4.entries do
			t_1[v_4] = list[v_4]
		end
		t_2 = t_12
		t_3 = t_13
		var1 = p4
		publish(t_10, t_11)
		
		return {
			kind = diagnosticsModule.EventKind.ItemViewsSynchronized,
			retained = var5,
			reassigned = var6,
			acquired = var7,
			released = var9.releasedCount
		}
	end
	
	local function applyPlacements(p5)
		-- upvalues: t_1 (ref), var1 (write), publish (ref)
		local t = {}
		
		for i, v in p5.entries do
			local var13 = t_1[i]
			
			if var13.desired ~= v then
				var13.desired = v
				t[var13.itemView] = true
			end
		end
		var1 = p5
		publish({}, t)
	end
	
	local function releaseAll()
		-- upvalues: t_1 (ref), recyclingScope (ref), t (ref), t_2 (write), t_3 (write), var1 (write), publish (ref)
		local list = table.create(#t_1)
		local list_1 = table.create(#t_1)
		
		for i, v in t_1 do
			table.insert(list, { record = v.itemView, leaseToken = v.leaseToken })
			table.insert(list_1, { assignment = nil, itemView = v.itemView })
		end
		if #list > 0 then
			recyclingScope.exchange(t, list, {})
		end
		table.clear(t_1)
		table.clear(t_2)
		table.clear(t_3)
		var1 = nil
		publish(list_1, {})
	end
	
	return {
		apply = function(_, p6, p7)
			-- upvalues: var3 (write), recyclingScope (ref), releaseAll (ref), var1 (write), applyPlacements (ref), reconcile (ref)
			if var3 then
				return {}
			elseif p6 == nil then
				recyclingScope.batch(releaseAll)
				
				return {}
			elseif var1 == nil or p7.assignmentsChanged then
				local var14 = nil
				recyclingScope.batch(function()
					-- upvalues: var14 (write), reconcile (copy), p6 (ref)
					var14 = reconcile(p6)
				end)
				
				return { var14 }
			elseif p7.placementChanged then
				recyclingScope.batch(function()
					-- upvalues: applyPlacements (copy), p6 (ref)
					applyPlacements(p6)
				end)
			else
				var1 = p6
			end
			return {}
		end,
		destroy = function()
			-- upvalues: var3 (write), recyclingScope (ref), releaseAll (ref), tbl (ref)
			if not var3 then
				recyclingScope.batch(releaseAll)
				var3 = true
				table.clear(tbl)
			end
		end,
		getItemViews = function()
			-- upvalues: t_1 (ref)
			local list = table.create(#t_1)
			
			for i, v in t_1 do
				list[i] = v.itemView
			end
			return list
		end,
		getSnapshot = function()
			-- upvalues: var1 (write)
			return var1
		end,
		resolvePlacementIntent = resolvePlacementIntent,
		onPlacementIntentChanged = function(p6, p7)
			-- upvalues: tbl (ref)
			assert(tbl[p6] == nil, "Virtualizer: ItemView already has a Placement-intent subscriber")
			tbl[p6] = p7
			
			return function()
				-- upvalues: tbl (copy), p6 (ref), p7 (ref)
				if tbl[p6] == p7 then
					tbl[p6] = nil
				end
			end
		end,
		validateMeasurements = function(p6)
			-- upvalues: t_2 (write), recyclingScope (ref), t (ref)
			local t_1 = {}
			local var14 = 0
			
			for i, v in p6 do
				local itemKey = t_2[v.itemKey]
				
				if itemKey == nil or itemKey.assignment.index ~= v.itemIndex or (itemKey.assignment.generation ~= v.assignmentGeneration or itemKey.desired.measurementIdentity.itemRevision ~= v.itemRevision) or (itemKey.desired.measurementIdentity.pinnedPosition ~= v.pinnedPosition or not recyclingScope.isLeaseCurrent(t, itemKey.itemView, itemKey.leaseToken)) then
					var14 += 1
				else
					table.insert(t_1, {
						itemIndex = itemKey.assignment.index,
						itemKey = itemKey.assignment.key,
						itemRevision = v.itemRevision,
						pinnedPosition = v.pinnedPosition,
						length = v.length
					})
				end
			end
			return t_1, var14
		end
	}
end