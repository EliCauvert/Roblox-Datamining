local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DiagnosticsModule = require(ViewRecycler.Core.Diagnostics)
local _ = require(ViewRecycler.Core.Placement.PlacementTypes)
local ShallowTableModule = require(ViewRecycler.Internal.ShallowTable)
local _ = require(ViewRecycler.Core.Types)
local _ = require(ViewRecycler.Core.Virtualizer.VirtualizerSnapshot)
local _ = require(ViewRecycler.Core.RecyclingScope)
local Frozen = table.freeze({ "index", "value" })
local Frozen1 = table.freeze({ "kind", "revision" })

local function _(p1, p2): boolean --[[ Line: 61 | Named "assignmentChanged" ]]
	-- upvalues: ShallowTableModule (copy), Frozen (copy), Frozen1 (copy)
	return not ShallowTableModule.containsEqual(p1, p2, Frozen) or not ShallowTableModule.containsEqual(p1.identity, p2.identity, Frozen1)
end

return function(p1) --[[ Line: 69 | Named "createListPresentation" ]]
	-- upvalues: ShallowTableModule (copy), Frozen (copy), Frozen1 (copy), DiagnosticsModule (copy)
	local RecyclingScope = p1.recyclingScope
	local t = {}
	local v1 = nil
	local Tbl = {}
	local Tbl1 = {}
	local Tbl2 = {}
	local self = setmetatable({}, { __mode = "k" })
	local Generation = 1
	local Flag = false
	
	local function makeAssignment(Desired) --[[ Line: 82 ]]
		-- upvalues: p1 (copy), Generation (ref)
		local PrepareDesiredAssignmentResult = {
			key = Desired.key,
			index = Desired.index,
			value = Desired.value
		}
		
		if p1.prepareDesiredAssignment ~= nil then
			PrepareDesiredAssignmentResult = p1.prepareDesiredAssignment(PrepareDesiredAssignmentResult)
		end
		local config = {
			key = PrepareDesiredAssignmentResult.key,
			index = PrepareDesiredAssignmentResult.index,
			value = PrepareDesiredAssignmentResult.value,
			generation = Generation
		}
		Generation += 1
		
		return config
	end
	
	local function resolvePlacementIntent(ItemView) --[[ Line: 101 ]]
		-- upvalues: Tbl2 (ref), v1 (ref)
		local Entry = Tbl2[ItemView]
		local v2 = v1
		
		if Entry == nil or v2 == nil then
			return nil
		else
			local Desired = Entry.desired
			
			return {
				assignment = Entry.assignment,
				itemLayout = Desired.itemLayout,
				canvasPlacement = Desired.canvasPlacement,
				viewportPlacement = Desired.viewportPlacement,
				contentStartOffset = v2.contentStartOffset,
				measurementIdentity = {
					itemIndex = Entry.assignment.index,
					itemKey = Entry.assignment.key,
					assignmentGeneration = Entry.assignment.generation,
					itemRevision = Desired.measurementIdentity.itemRevision,
					pinnedPosition = Desired.measurementIdentity.pinnedPosition
				}
			}
		end
	end
	
	local function publish(List, List1) --[[ Line: 124 ]]
		-- upvalues: p1 (copy), resolvePlacementIntent (copy), self (copy)
		for _, value in List do
			if p1.prepareAssignment ~= nil then
				p1.prepareAssignment(value.itemView, value.assignment)
			end
		end
		if p1.applyPlacementIntent ~= nil then
			for _, value1 in List do
				p1.applyPlacementIntent(value1.itemView, if value1.assignment == nil then nil else resolvePlacementIntent(value1.itemView))
				List1[value1.itemView] = nil
			end
			for i in List1 do
				p1.applyPlacementIntent(i, (resolvePlacementIntent(i)))
			end
		end
		for i1 in List1 do
			local SelfEntry: () -> () = self[i1]
			
			if SelfEntry ~= nil then
				SelfEntry()
			end
		end
		for _, value2 in List do
			if p1.postCommitAssignment ~= nil then
				p1.postCommitAssignment(value2.itemView, value2.assignment)
			end
		end
		if p1.presentAssignment ~= nil then
			for _, value3 in List do
				if value3.assignment ~= nil then
					p1.presentAssignment(value3.itemView, value3.assignment)
				end
			end
		end
	end
	
	local function _(p2): boolean --[[ Line: 164 | Named "insetChanged" ]]
		-- upvalues: v1 (ref)
		local v2 = v1
		
		return v2 == nil or v2.contentStartOffset ~= p2.contentStartOffset
	end
	
	local function reconcile(p2, p3) --[[ Line: 169 ]]
		-- upvalues: Tbl1 (ref), Tbl (copy), makeAssignment (copy), RecyclingScope (copy), t (copy), ShallowTableModule (upval), Frozen (upval), Frozen1 (upval), Tbl2 (ref), v1 (ref), publish (copy), DiagnosticsModule (upval)
		local t1 = {}
		local Buffer = table.create(#p2.entries)
		local List2 = {}
		local List3 = {}
		local List4 = {}
		local List5 = {}
		local t2 = {}
		local List6 = {}
		local t3 = {}
		local Retained = 0
		local Count = 0
		local Acquired = 0
		
		for i, entry in p2.entries do
			assert(t1[entry.key] == nil, `Virtualizer: duplicate key "{entry.key}"`)
			t1[entry.key] = entry
			local Entry = Tbl1[entry.key]
			
			if Entry == nil or Entry.itemViewType ~= entry.recyclableViewType then
				table.insert(List5, i)
			else
				Buffer[i] = Entry
			end
		end
		for _, value in Tbl do
			local Entry = t1[value.assignment.key]
			
			if Entry == nil or value.itemViewType ~= Entry.recyclableViewType then
				local List = t2[value.itemViewType]
				
				if List == nil then
					List = {}
					t2[value.itemViewType] = List
				end
				table.insert(List, value)
			end
		end
		for _, value1 in List5 do
			local Entry = p2.entries[value1]
			local List1 = t2[Entry.recyclableViewType]
			local Removed = if List1 == nil then nil else table.remove(List1)
			
			if Removed == nil then
				table.insert(List4, value1)
				table.insert(List3, { viewType = Entry.recyclableViewType })
			else
				Removed.assignment = makeAssignment(Entry)
				Removed.desired = Entry
				Buffer[value1] = Removed
				Count += 1
			end
		end
		for _, value2 in t2 do
			for _, value3 in value2 do
				table.insert(List2, { view = value3.itemView, leaseToken = value3.leaseToken })
			end
		end
		local Config = if #List2 == 0 and #List3 == 0 then { releasedCount = 0, acquired = {} } else RecyclingScope.exchange(t, List2, List3)
		for i1, value4 in List4 do
			local Entry = p2.entries[value4]
			local AcquiredEntry = Config.acquired[i1]
			Buffer[value4] = {
				itemView = AcquiredEntry.view,
				itemViewType = Entry.recyclableViewType,
				leaseToken = AcquiredEntry.leaseToken,
				assignment = makeAssignment(Entry),
				desired = Entry
			}
			Acquired += 1
		end
		local t4 = {}
		local t5 = {}
		
		for i3, entry1 in p2.entries do
			local BufferEntry = Buffer[i3]
			local Desired = BufferEntry.desired
			
			if Tbl1[entry1.key] == BufferEntry then
				if not ShallowTableModule.containsEqual(Desired, entry1, Frozen) or not ShallowTableModule.containsEqual(Desired.identity, entry1.identity, Frozen1) then
					BufferEntry.assignment = makeAssignment(entry1)
					table.insert(List6, {
						itemView = BufferEntry.itemView,
						assignment = BufferEntry.assignment
					})
					Count += 1
				else
					Retained += 1
				end
				if Desired ~= entry1 or p3 then
					t3[BufferEntry.itemView] = true
				end
				BufferEntry.desired = entry1
			else
				table.insert(List6, {
					itemView = BufferEntry.itemView,
					assignment = BufferEntry.assignment
				})
			end
			t4[BufferEntry.assignment.key] = BufferEntry
			t5[BufferEntry.itemView] = BufferEntry
		end
		for _, value5 in Tbl do
			if t5[value5.itemView] == nil then
				table.insert(List6, { assignment = nil, itemView = value5.itemView })
			end
		end
		table.clear(Tbl)
		
		for i2 = 1, #p2.entries do
			Tbl[i2] = Buffer[i2]
		end
		Tbl1 = t4
		Tbl2 = t5
		v1 = p2
		publish(List6, t3)
		
		return {
			kind = DiagnosticsModule.EventKind.ItemViewsSynchronized,
			retained = Retained,
			reassigned = Count,
			acquired = Acquired,
			released = Config.releasedCount
		}
	end
	
	local function applyPlacements(p4, p5) --[[ Line: 298 ]]
		-- upvalues: Tbl (copy), v1 (ref), publish (copy)
		local t = {}
		
		for i, entry in p4.entries do
			local Entry = Tbl[i]
			
			if Entry.desired ~= entry or p5 then
				Entry.desired = entry
				t[Entry.itemView] = true
			end
		end
		v1 = p4
		publish({}, t)
	end
	
	local function releaseAll() --[[ Line: 314 ]]
		-- upvalues: Tbl (copy), RecyclingScope (copy), t (copy), Tbl1 (ref), Tbl2 (ref), v1 (ref), publish (copy)
		local Buffer = table.create(#Tbl)
		local Buffer1 = table.create(#Tbl)
		
		for _, value in Tbl do
			table.insert(Buffer, { view = value.itemView, leaseToken = value.leaseToken })
			table.insert(Buffer1, { assignment = nil, itemView = value.itemView })
		end
		if #Buffer > 0 then
			RecyclingScope.exchange(t, Buffer, {})
		end
		table.clear(Tbl)
		table.clear(Tbl1)
		table.clear(Tbl2)
		v1 = nil
		publish(Buffer1, {})
	end
	
	return {
		apply = function(_, p6, p7) --[[ Line: 332 ]]
			-- upvalues: Flag (ref), RecyclingScope (copy), releaseAll (copy), v1 (ref), applyPlacements (copy), reconcile (copy)
			if Flag then
				return {}
			end
			if p6 == nil then
				RecyclingScope.batch(releaseAll)
				
				return {}
			end
			local v2 = v1
			local v3: boolean = v2 == nil or v2.contentStartOffset ~= p6.contentStartOffset
			
			if v1 == nil or p7.assignmentsChanged then
				local v4 = nil
				RecyclingScope.batch(function() --[[ Line: 352 ]]
					-- upvalues: v4 (ref), reconcile (upval), p6 (copy), v3 (copy)
					v4 = reconcile(p6, v3)
				end)
				
				return { v4 }
			end
			if p7.placementChanged or v3 then
				RecyclingScope.batch(function() --[[ Line: 343 ]]
					-- upvalues: applyPlacements (upval), p6 (copy), v3 (copy)
					applyPlacements(p6, v3)
				end)
			else
				v1 = p6
			end
			return {}
		end,
		destroy = function() --[[ Line: 357 ]]
			-- upvalues: Flag (ref), RecyclingScope (copy), releaseAll (copy), self (copy)
			if not Flag then
				RecyclingScope.batch(releaseAll)
				Flag = true
				table.clear(self)
			end
		end,
		getItemViews = function() --[[ Line: 364 ]]
			-- upvalues: Tbl (copy)
			local Buffer = table.create(#Tbl)
			
			for i, value in Tbl do
				Buffer[i] = value.itemView
			end
			return Buffer
		end,
		getSnapshot = function() --[[ Line: 371 ]]
			-- upvalues: v1 (ref)
			return v1
		end,
		resolvePlacementIntent = resolvePlacementIntent,
		onPlacementIntentChanged = function(Key, p6) --[[ Line: 375 ]]
			-- upvalues: self (copy)
			assert(self[Key] == nil, "Virtualizer: ItemView already has a Placement-intent subscriber")
			self[Key] = p6
			
			return function() --[[ Line: 381 ]]
				-- upvalues: self (upval), Key (copy), p6 (copy)
				if self[Key] == p6 then
					self[Key] = nil
				end
			end
		end,
		validateMeasurements = function(List) --[[ Line: 387 ]]
			-- upvalues: Tbl1 (ref), RecyclingScope (copy), t (copy)
			local List1 = {}
			local Count = 0
			
			for _, value in List do
				local Entry = Tbl1[value.itemKey]
				
				if Entry == nil or Entry.assignment.index ~= value.itemIndex or Entry.assignment.generation ~= value.assignmentGeneration or Entry.desired.measurementIdentity.itemRevision ~= value.itemRevision or Entry.desired.measurementIdentity.pinnedPosition ~= value.pinnedPosition or not RecyclingScope.isLeaseCurrent(t, Entry.itemView, Entry.leaseToken) then
					Count += 1
				else
					table.insert(List1, {
						itemIndex = Entry.assignment.index,
						itemKey = Entry.assignment.key,
						itemRevision = value.itemRevision,
						pinnedPosition = value.pinnedPosition,
						length = value.length
					})
				end
			end
			return List1, Count
		end
	}
end