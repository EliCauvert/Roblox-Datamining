local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(ViewRecycler.Core.Types)
local ItemKeyRegistryModule = require(script.Parent.ItemKeyRegistry)
local MutationControllerModule = require(script.Parent.MutationController)

return function(p1, p2) --[[ Line: 33 | Named "createSequenceDataSource" ]]
	-- upvalues: ItemKeyRegistryModule (copy), MutationControllerModule (copy), DataSourceChangeTypeModule (copy)
	local Copy = table.clone(p1 or {})
	local DataSourceSequence = ItemKeyRegistryModule.create(p2, "DataSource.sequence")
	local RebuildResult = DataSourceSequence.rebuild(Copy)
	local List = {}
	local Count = 0
	
	local function _(p3) --[[ Line: 42 | Named "record" ]]
		-- upvalues: Count (ref), List (copy)
		if Count > 0 then
			table.insert(List, p3)
		end
	end
	
	local function undo(p3) --[[ Line: 48 ]]
		-- upvalues: Copy (ref), RebuildResult (ref), DataSourceSequence (copy)
		local Kind = p3.kind
		
		if Kind == "insert" then
			table.remove(Copy, p3.index)
			table.remove(RebuildResult, p3.index)
			DataSourceSequence.release(p3.key)
			
			return
		end
		if Kind == "remove" then
			for i, key in p3.keys do
				table.insert(Copy, p3.index + i - 1, p3.values[i])
				table.insert(RebuildResult, p3.index + i - 1, key)
				DataSourceSequence.adopt(key)
			end
			return
		elseif Kind == "set" then
			Copy[p3.index] = p3.value
			
			return
		else
			if Kind == "move" then
				local Removed = table.remove(RebuildResult, p3.toIndex)
				table.insert(Copy, p3.fromIndex, (table.remove(Copy, p3.toIndex)))
				table.insert(RebuildResult, p3.fromIndex, Removed)
				
				return
			end
			Copy = p3.values
			RebuildResult = p3.keys
			
			if p3.keyRegistry ~= nil then
				DataSourceSequence.restore(p3.keyRegistry)
			end
		end
	end
	
	local MutationControllerModuleResult = MutationControllerModule(function(): number --[[ Line: 83 ]]
		-- upvalues: Copy (ref)
		return #Copy
	end, function(): number --[[ Line: 85 ]]
		-- upvalues: Count (ref), List (copy)
		Count += 1
		
		return #List
	end, function(p4: number) --[[ Line: 88 ]]
		-- upvalues: List (copy), undo (copy), Count (ref)
		for i = #List, p4 + 1, -1 do
			undo(List[i])
			List[i] = nil
		end
		Count -= 1
		
		if Count == 0 then
			table.clear(List)
		end
	end, function() --[[ Line: 76 | Named "closeTransaction" ]]
		-- upvalues: Count (ref), List (copy)
		Count -= 1
		
		if Count == 0 then
			table.clear(List)
		end
	end)
	local config = nil
	config = {
		getItemCount = function(): number --[[ Line: 98 ]]
			-- upvalues: Copy (ref)
			return #Copy
		end,
		getItem = function(p5) --[[ Line: 101 ]]
			-- upvalues: Copy (ref)
			return Copy[p5]
		end,
		getItemKey = function(p5) --[[ Line: 104 ]]
			-- upvalues: RebuildResult (ref)
			return RebuildResult[p5]
		end,
		getItems = function(p5, p6) --[[ Line: 107 ]]
			-- upvalues: Copy (ref)
			return table.move(Copy, p5, p6, 1, {})
		end,
		subscribe = MutationControllerModuleResult.subscribe,
		transaction = MutationControllerModuleResult.transaction
	}
	
	function config.append(p5) --[[ Line: 114 ]]
		-- upvalues: config (ref), Copy (ref)
		config.insert(#Copy + 1, p5)
	end
	
	function config.prepend(p5) --[[ Line: 118 ]]
		-- upvalues: config (ref)
		config.insert(1, p5)
	end
	
	function config.insert(Index: number, p5) --[[ Line: 122 ]]
		-- upvalues: Copy (ref), DataSourceSequence (copy), RebuildResult (ref), Count (ref), List (copy), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
		local CountCopy = #Copy
		assert(Index >= 1 and Index <= CountCopy + 1, "DataSource.sequence: insert index out of range")
		local ClaimResult = DataSourceSequence.claim(p5, Index)
		table.insert(Copy, Index, p5)
		table.insert(RebuildResult, Index, ClaimResult)
		local config = { kind = "insert", index = Index, key = ClaimResult }
		
		if Count > 0 then
			table.insert(List, config)
		end
		MutationControllerModuleResult.emit({
			type = DataSourceChangeTypeModule.Insert,
			index = Index,
			keys = { ClaimResult }
		}, CountCopy)
	end
	
	function config.remove(Index: number, p5) --[[ Line: 132 ]]
		-- upvalues: Copy (ref), RebuildResult (ref), DataSourceSequence (copy), Count (ref), List (copy), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
		local CountCopy = #Copy
		local P13 = p5 or 1
		assert(P13 > 0 and Index >= 1 and Index + P13 - 1 <= CountCopy, "DataSource.sequence: remove range out of range")
		local Buffer = table.create(P13)
		local Buffer1 = table.create(P13)
		
		for i = 1, P13 do
			Buffer1[i] = table.remove(Copy, Index)
			local Removed = table.remove(RebuildResult, Index)
			Buffer[i] = Removed
			DataSourceSequence.release(Removed)
		end
		local config = {
			kind = "remove",
			index = Index,
			keys = Buffer,
			values = Buffer1
		}
		
		if Count > 0 then
			table.insert(List, config)
		end
		MutationControllerModuleResult.emit({
			type = DataSourceChangeTypeModule.Remove,
			index = Index,
			keys = Buffer
		}, CountCopy)
	end
	
	function config.setItem(Index: number, p6) --[[ Line: 151 ]]
		-- upvalues: Copy (ref), RebuildResult (ref), DataSourceSequence (copy), Count (ref), List (copy), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
		local CountCopy = #Copy
		assert(Index >= 1 and Index <= CountCopy, "DataSource.sequence: setItem index out of range")
		local RebuildResultEntry = RebuildResult[Index]
		DataSourceSequence.assertPreserved(RebuildResultEntry, p6, Index)
		local config = { kind = "set", index = Index, value = Copy[Index] }
		
		if Count > 0 then
			table.insert(List, config)
		end
		Copy[Index] = p6
		MutationControllerModuleResult.emit({
			type = DataSourceChangeTypeModule.Update,
			keys = { RebuildResultEntry }
		}, CountCopy)
	end
	
	function config.moveItem(Index: number, ToIndex: number) --[[ Line: 161 ]]
		-- upvalues: Copy (ref), RebuildResult (ref), Count (ref), List (copy), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
		local CountCopy = #Copy
		assert(Index >= 1 and Index <= CountCopy, "DataSource.sequence: moveItem source index out of range")
		assert(ToIndex >= 1 and ToIndex <= CountCopy, "DataSource.sequence: moveItem destination index out of range")
		
		if Index == ToIndex then return end
		local Removed = table.remove(RebuildResult, Index)
		table.insert(Copy, ToIndex, (table.remove(Copy, Index)))
		table.insert(RebuildResult, ToIndex, Removed)
		local config = { kind = "move", fromIndex = Index, toIndex = ToIndex }
		
		if Count > 0 then
			table.insert(List, config)
		end
		MutationControllerModuleResult.emit({
			type = DataSourceChangeTypeModule.Move,
			fromIndex = Index,
			toIndex = ToIndex,
			key = Removed
		}, CountCopy)
	end
	
	function config.reorder(List1) --[[ Line: 187 ]]
		-- upvalues: Copy (ref), RebuildResult (ref), Count (ref), List (copy), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
		local CountCopy = #Copy
		assert(#List1 == CountCopy, "DataSource.sequence: reorder must contain every key")
		local t = {}
		
		for i, value in RebuildResult do
			t[value] = Copy[i]
		end
		local Buffer = table.create(CountCopy)
		local Buffer1 = table.create(CountCopy)
		local t1 = {}
		
		for i1, value1 in List1 do
			assert(t[value1] ~= nil and t1[value1] == nil, "DataSource.sequence: reorder must contain every key once")
			t1[value1] = true
			Buffer[i1] = t[value1]
			Buffer1[i1] = value1
		end
		local config = { kind = "replace", values = Copy, keys = RebuildResult }
		
		if Count > 0 then
			table.insert(List, config)
		end
		Copy = Buffer
		RebuildResult = Buffer1
		MutationControllerModuleResult.emit({
			type = DataSourceChangeTypeModule.Reorder,
			keys = table.clone(Buffer1)
		}, CountCopy)
	end
	
	function config.replaceItems(Index: number, p6, p7) --[[ Line: 212 ]]
		-- upvalues: Copy (ref), MutationControllerModuleResult (copy), config (ref), RebuildResult (ref), DataSourceSequence (copy), Count (ref), List (copy), DataSourceChangeTypeModule (upval)
		assert(Index >= 1 and Index <= p6 and p6 <= #Copy, "DataSource.sequence: replaceItems range out of range")
		MutationControllerModuleResult.transaction(function() --[[ Line: 217 ]]
			-- upvalues: config (upval), Index (copy), p6 (copy), p7 (copy), Copy (upval), RebuildResult (upval), DataSourceSequence (upval), Count (upval), List (upval), MutationControllerModuleResult (upval), DataSourceChangeTypeModule (upval)
			config.remove(Index, p6 - Index + 1)
			
			if #p7 == 0 then return end
			local CountCopy = #Copy
			local config1 = {
				kind = "replace",
				values = Copy,
				keys = RebuildResult,
				keyRegistry = DataSourceSequence.snapshot()
			}
			
			if Count > 0 then
				table.insert(List, config1)
			end
			local Buffer = table.create(#p7)
			
			for i, value in p7 do
				Buffer[i] = DataSourceSequence.claim(value, Index + i - 1)
			end
			local Buffer1 = table.create(CountCopy + #p7)
			local Buffer2 = table.create(CountCopy + #p7)
			
			if Index > 1 then
				table.move(Copy, 1, Index - 1, 1, Buffer1)
				table.move(RebuildResult, 1, Index - 1, 1, Buffer2)
			end
			for i1, value1 in p7 do
				local IndexDelta = Index + i1 - 1
				Buffer1[IndexDelta] = value1
				Buffer2[IndexDelta] = Buffer[i1]
			end
			if Index <= CountCopy then
				table.move(Copy, Index, CountCopy, Index + #p7, Buffer1)
				table.move(RebuildResult, Index, CountCopy, Index + #p7, Buffer2)
			end
			Copy = Buffer1
			RebuildResult = Buffer2
			MutationControllerModuleResult.emit({
				type = DataSourceChangeTypeModule.Insert,
				index = Index,
				keys = Buffer
			}, CountCopy)
		end)
	end
	
	function config.reset(Tbl) --[[ Line: 255 ]]
		-- upvalues: Copy (ref), Count (ref), DataSourceSequence (copy), RebuildResult (ref), List (copy), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
		local CountCopy = #Copy
		local Copy1 = table.clone(Tbl)
		local RebuildResult1 = DataSourceSequence.rebuild(Copy1)
		local config = {
			kind = "replace",
			values = Copy,
			keys = RebuildResult,
			keyRegistry = if Count > 0 then DataSourceSequence.snapshot() else nil
		}
		
		if Count > 0 then
			table.insert(List, config)
		end
		Copy = Copy1
		RebuildResult = RebuildResult1
		MutationControllerModuleResult.emit({
			type = DataSourceChangeTypeModule.Reset,
			keys = table.clone(RebuildResult1)
		}, CountCopy)
	end
	
	return config
end