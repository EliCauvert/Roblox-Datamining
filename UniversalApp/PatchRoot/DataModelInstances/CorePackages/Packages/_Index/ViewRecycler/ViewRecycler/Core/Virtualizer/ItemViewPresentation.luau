local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local diagnosticsModule = require(viewRecycler.Core.Diagnostics)
local _ = require(viewRecycler.Core.Placement.PlacementTypes)
local recordModule = require(viewRecycler.Internal.Record)
local _ = require(viewRecycler.Core.Types)
local _ = require(viewRecycler.Core.Virtualizer.VirtualizerSnapshot)
local _ = require(viewRecycler.Core.RecyclingScope)
local frozen = table.freeze({ "index", "value" })
local frozen_1 = table.freeze({ "kind", "revision" })

local function _(value, p0)
	-- upvalues: recordModule (ref), frozen (ref), frozen_1 (ref)
	return not recordModule.containsEqual(value, p0, frozen) or not recordModule.containsEqual(value.identity, p0.identity, frozen_1)
end

return function(p1)
	-- upvalues: recordModule (ref), frozen (ref), frozen_1 (ref), diagnosticsModule (ref)
	local recyclingScope = p1.recyclingScope
	local t = {}
	local var6 = nil
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local tbl = setmetatable({}, { __mode = "k" })
	local var11 = 1
	local var12 = false
	
	local function makeAssignment(value)
		-- upvalues: p1 (ref), var11 (write)
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
			generation = var11
		}
		var11 += 1
		
		return t_1
	end
	
	local function resolvePlacementIntent(p2)
		-- upvalues: t_3 (write), var6 (write)
		local var21 = t_3[p2]
		
		if var21 == nil or var6 == nil then
			return nil
		end
		local desired = var21.desired
		
		return {
			assignment = var21.assignment,
			itemLayout = desired.itemLayout,
			canvasPlacement = desired.canvasPlacement,
			viewportPlacement = desired.viewportPlacement,
			contentStartOffset = var6.contentStartOffset,
			measurementIdentity = {
				itemIndex = var21.assignment.index,
				itemKey = var21.assignment.key,
				assignmentGeneration = var21.assignment.generation,
				itemRevision = desired.measurementIdentity.itemRevision,
				pinnedPosition = desired.measurementIdentity.pinnedPosition
			}
		}
	end
	
	local function publish(p3, p4)
		-- upvalues: p1 (ref), resolvePlacementIntent (ref), tbl (ref)
		for i, v in p3 do
			if p1.prepareItemViewAssignment ~= nil then
				p1.prepareItemViewAssignment(v.itemView, v.assignment)
			end
		end
		if p1.applyItemViewPlacementIntent ~= nil then
			for i_1, v_1 in p3 do
				p1.applyItemViewPlacementIntent(v_1.itemView, if v_1.assignment == nil then nil else resolvePlacementIntent(v_1.itemView))
				p4[v_1.itemView] = nil
			end
			for i_2 in p4 do
				p1.applyItemViewPlacementIntent(i_2, resolvePlacementIntent(i_2))
			end
		end
		for i_1 in p4 do
			local var22 = tbl[i_1]
			
			if var22 ~= nil then
				var22()
			end
		end
		for i_2, v_1 in p3 do
			if p1.postCommitItemViewAssignment ~= nil then
				p1.postCommitItemViewAssignment(v_1.itemView, v_1.assignment)
			end
		end
		if p1.presentItemViewAssignment ~= nil then
			for i_3, v_2 in p3 do
				if v_2.assignment ~= nil then
					p1.presentItemViewAssignment(v_2.itemView, v_2.assignment)
				end
			end
		end
	end
	
	local function reconcile(p5)
		-- upvalues: t_2 (write), t_1 (ref), makeAssignment (ref), recyclingScope (ref), t (ref), recordModule (copy), frozen (copy), frozen_1 (copy), t_3 (write), var6 (write), publish (ref), diagnosticsModule (copy)
		local v_4
		local t_4 = {}
		local list = table.create(#p5.entries)
		local t_5 = {}
		local t_6 = {}
		local t_7 = {}
		local t_8 = {}
		local t_9 = {}
		local t_10 = {}
		local t_11 = {}
		local var32 = 0
		local var33 = 0
		local var34 = 0
		
		for i, v in p5.entries do
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
			v_4 = p5.entries[v_2]
			local recyclableViewType = t_9[v_4.recyclableViewType]
			local var41 = if recyclableViewType == nil then nil else table.remove(recyclableViewType)
			
			if var41 == nil then
				table.insert(t_7, v_2)
				table.insert(t_6, { viewType = v_4.recyclableViewType })
			else
				var41.assignment = makeAssignment(v_4)
				var41.desired = v_4
				list[v_2] = var41
				var33 += 1
			end
		end
		for i_3, v_3 in t_9 do
			for i_4, v_5 in v_3 do
				table.insert(t_5, { record = v_5.itemView, leaseToken = v_5.leaseToken })
			end
		end
		local var35 = if #t_5 == 0 and #t_6 == 0 then { releasedCount = 0, acquired = {} } else recyclingScope.exchange(t, t_5, t_6)
		
		for i_4, v_4 in t_7 do
			local var39 = p5.entries[v_4]
			local var40 = var35.acquired[i_4]
			list[v_4] = {
				itemView = var40.record,
				itemViewType = var39.recyclableViewType,
				leaseToken = var40.leaseToken,
				assignment = makeAssignment(var39),
				desired = var39
			}
			var34 += 1
		end
		local t_12 = {}
		local t_13 = {}
		
		for i_5, v_5 in p5.entries do
			local var38 = list[i_5]
			local desired = var38.desired
			
			if t_2[v_5.key] ~= var38 then
				table.insert(t_10, { itemView = var38.itemView, assignment = var38.assignment })
				t_12[var38.assignment.key] = var38
				t_13[var38.itemView] = var38
			end
			if not recordModule.containsEqual(desired, v_5, frozen) or not recordModule.containsEqual(desired.identity, v_5.identity, frozen_1) then
				var38.assignment = makeAssignment(v_5)
				table.insert(t_10, { itemView = var38.itemView, assignment = var38.assignment })
				var33 += 1
			else
				var32 += 1
			end
			if desired ~= v_5 then
				t_11[var38.itemView] = true
			end
			var38.desired = v_5
		end
		for i_6, v_5 in t_1 do
			if t_13[v_5.itemView] == nil then
				table.insert(t_10, { assignment = nil, itemView = v_5.itemView })
			end
		end
		table.clear(t_1)
		
		for v_4 = 1, #p5.entries do
			t_1[v_4] = list[v_4]
		end
		t_2 = t_12
		t_3 = t_13
		var6 = p5
		publish(t_10, t_11)
		
		return {
			kind = diagnosticsModule.EventKind.ItemViewsSynchronized,
			retained = var32,
			reassigned = var33,
			acquired = var34,
			released = var35.releasedCount
		}
	end
	
	local function applyPlacements(p6)
		-- upvalues: t_1 (ref), var6 (write), publish (ref)
		local t = {}
		
		for i, v in p6.entries do
			local var43 = t_1[i]
			
			if var43.desired ~= v then
				var43.desired = v
				t[var43.itemView] = true
			end
		end
		var6 = p6
		publish({}, t)
	end
	
	local function releaseAll()
		-- upvalues: t_1 (ref), recyclingScope (ref), t (ref), t_2 (write), t_3 (write), var6 (write), publish (ref)
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
		var6 = nil
		publish(list_1, {})
	end
	
	return {
		apply = function(_, p7, p8)
			-- upvalues: var12 (write), recyclingScope (ref), releaseAll (ref), var6 (write), applyPlacements (ref), reconcile (ref)
			if var12 then
				return {}
			elseif p7 == nil then
				recyclingScope.batch(releaseAll)
				
				return {}
			elseif var6 == nil or p8.assignmentsChanged then
				local var46 = nil
				recyclingScope.batch(function()
					-- upvalues: var46 (write), reconcile (copy), p7 (ref)
					var46 = reconcile(p7)
				end)
				
				return { var46 }
			elseif p8.placementChanged then
				recyclingScope.batch(function()
					-- upvalues: applyPlacements (copy), p7 (ref)
					applyPlacements(p7)
				end)
			else
				var6 = p7
			end
			return {}
		end,
		destroy = function()
			-- upvalues: var12 (write), recyclingScope (ref), releaseAll (ref), tbl (ref)
			if not var12 then
				recyclingScope.batch(releaseAll)
				var12 = true
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
			-- upvalues: var6 (write)
			return var6
		end,
		resolvePlacementIntent = resolvePlacementIntent,
		onPlacementIntentChanged = function(p9, p10)
			-- upvalues: tbl (ref)
			assert(tbl[p9] == nil, "Virtualizer: ItemView already has a Placement-intent subscriber")
			tbl[p9] = p10
			
			return function()
				-- upvalues: tbl (copy), p9 (ref), p10 (ref)
				if tbl[p9] == p10 then
					tbl[p9] = nil
				end
			end
		end,
		validateMeasurements = function(p11)
			-- upvalues: t_2 (write), recyclingScope (ref), t (ref)
			local t_1 = {}
			local var49 = 0
			
			for i, v in p11 do
				local itemKey = t_2[v.itemKey]
				
				if itemKey == nil or itemKey.assignment.index ~= v.itemIndex or (itemKey.assignment.generation ~= v.assignmentGeneration or itemKey.desired.measurementIdentity.itemRevision ~= v.itemRevision) or (itemKey.desired.measurementIdentity.pinnedPosition ~= v.pinnedPosition or not recyclingScope.isLeaseCurrent(t, itemKey.itemView, itemKey.leaseToken)) then
					var49 += 1
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
			return t_1, var49
		end
	}
end