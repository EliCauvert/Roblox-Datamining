local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(ViewRecycler.Core.Types)
local ItemKeyRegistryModule = require(script.Parent.ItemKeyRegistry)
local MutationControllerModule = require(script.Parent.MutationController)

return function(p1, p2)
	-- upvalues: ItemKeyRegistryModule (copy), MutationControllerModule (copy), DataSourceChangeTypeModule (copy)
	local Copy = table.clone(p1 or {})
	local DataSourceSequence = ItemKeyRegistryModule.create(p2, "DataSource.sequence")
	local RebuildResult = DataSourceSequence.rebuild(Copy)
	local MutationControllerModuleResult = MutationControllerModule(function(): number
		-- upvalues: Copy (ref)
		return #Copy
	end, function()
		-- upvalues: Copy (ref), RebuildResult (ref), DataSourceSequence (copy)
		return {
			values = table.clone(Copy),
			keys = table.clone(RebuildResult),
			keyRegistry = DataSourceSequence.snapshot()
		}
	end, function(p3)
		-- upvalues: Copy (ref), RebuildResult (ref), DataSourceSequence (copy)
		Copy = p3.values
		RebuildResult = p3.keys
		DataSourceSequence.restore(p3.keyRegistry)
	end)
	local config = nil
	config = {
		getItemCount = function(): number
			-- upvalues: Copy (ref)
			return #Copy
		end,
		getItem = function(p3)
			-- upvalues: Copy (ref)
			return Copy[p3]
		end,
		getItemKey = function(p3)
			-- upvalues: RebuildResult (ref)
			return RebuildResult[p3]
		end,
		getItems = function(p3, p4)
			-- upvalues: Copy (ref)
			return table.move(Copy, p3, p4, 1, {})
		end,
		subscribe = MutationControllerModuleResult.subscribe,
		transaction = MutationControllerModuleResult.transaction
	}
	
	function config.append(p3)
		-- upvalues: config (ref), Copy (ref)
		config.insert(#Copy + 1, p3)
	end
	
	function config.prepend(p3)
		-- upvalues: config (ref)
		config.insert(1, p3)
	end
	
	function config.insert(Index: number, p3)
		-- upvalues: Copy (ref), DataSourceSequence (copy), RebuildResult (ref), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
		local CountCopy = #Copy
		assert(Index >= 1 and Index <= CountCopy + 1, "DataSource.sequence: insert index out of range")
		local ClaimResult = DataSourceSequence.claim(p3, Index)
		table.insert(Copy, Index, p3)
		table.insert(RebuildResult, Index, ClaimResult)
		MutationControllerModuleResult.emit({
			type = DataSourceChangeTypeModule.Insert,
			index = Index,
			keys = { ClaimResult }
		}, CountCopy)
	end
	
	function config.remove(Index: number, p3)
		-- upvalues: Copy (ref), RebuildResult (ref), DataSourceSequence (copy), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
		local CountCopy = #Copy
		local P11 = p3 or 1
		assert(P11 > 0 and Index >= 1 and Index + P11 - 1 <= CountCopy, "DataSource.sequence: remove range out of range")
		local Buffer = table.create(P11)
		
		for i = 1, P11 do
			table.remove(Copy, Index)
			local Removed = table.remove(RebuildResult, Index)
			Buffer[i] = Removed
			DataSourceSequence.release(Removed)
		end
		MutationControllerModuleResult.emit({
			type = DataSourceChangeTypeModule.Remove,
			index = Index,
			keys = Buffer
		}, CountCopy)
	end
	
	function config.setItem(Key: number, p4)
		-- upvalues: Copy (ref), RebuildResult (ref), DataSourceSequence (copy), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
		local CountCopy = #Copy
		assert(Key >= 1 and Key <= CountCopy, "DataSource.sequence: setItem index out of range")
		local RebuildResultEntry = RebuildResult[Key]
		DataSourceSequence.assertPreserved(RebuildResultEntry, p4, Key)
		Copy[Key] = p4
		MutationControllerModuleResult.emit({
			type = DataSourceChangeTypeModule.Update,
			keys = { RebuildResultEntry }
		}, CountCopy)
	end
	
	function config.moveItem(Index: number, ToIndex: number)
		-- upvalues: Copy (ref), RebuildResult (ref), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
		local CountCopy = #Copy
		assert(Index >= 1 and Index <= CountCopy, "DataSource.sequence: moveItem source index out of range")
		assert(ToIndex >= 1 and ToIndex <= CountCopy, "DataSource.sequence: moveItem destination index out of range")
		
		if Index ~= ToIndex then
			local Removed = table.remove(RebuildResult, Index)
			table.insert(Copy, ToIndex, (table.remove(Copy, Index)))
			table.insert(RebuildResult, ToIndex, Removed)
			MutationControllerModuleResult.emit({
				type = DataSourceChangeTypeModule.Move,
				fromIndex = Index,
				toIndex = ToIndex,
				key = Removed
			}, CountCopy)
			
			return
		end
	end
	
	function config.reorder(List)
		-- upvalues: Copy (ref), RebuildResult (ref), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
		local CountCopy = #Copy
		assert(#List == CountCopy, "DataSource.sequence: reorder must contain every key")
		local t = {}
		
		for i, value in RebuildResult do
			t[value] = Copy[i]
		end
		local Buffer = table.create(CountCopy)
		local Buffer1 = table.create(CountCopy)
		local t1 = {}
		
		for i1, value1 in List do
			assert(t[value1] ~= nil and t1[value1] == nil, "DataSource.sequence: reorder must contain every key once")
			t1[value1] = true
			Buffer[i1] = t[value1]
			Buffer1[i1] = value1
		end
		Copy = Buffer
		RebuildResult = Buffer1
		MutationControllerModuleResult.emit({
			type = DataSourceChangeTypeModule.Reorder,
			keys = table.clone(Buffer1)
		}, CountCopy)
	end
	
	function config.replaceItems(Index: number, p4, p5)
		-- upvalues: Copy (ref), MutationControllerModuleResult (copy), config (ref), DataSourceSequence (copy), RebuildResult (ref), DataSourceChangeTypeModule (upval)
		assert(Index >= 1 and Index <= p4 and p4 <= #Copy, "DataSource.sequence: replaceItems range out of range")
		MutationControllerModuleResult.transaction(function()
			-- upvalues: config (upval), Index (copy), p4 (copy), p5 (copy), Copy (upval), DataSourceSequence (upval), RebuildResult (upval), MutationControllerModuleResult (upval), DataSourceChangeTypeModule (upval)
			config.remove(Index, p4 - Index + 1)
			
			if #p5 == 0 then return end
			local CountCopy = #Copy
			local Buffer = table.create(#p5)
			
			for i, value in p5 do
				Buffer[i] = DataSourceSequence.claim(value, Index + i - 1)
			end
			local Buffer1 = table.create(CountCopy + #p5)
			local Buffer2 = table.create(CountCopy + #p5)
			
			if Index > 1 then
				table.move(Copy, 1, Index - 1, 1, Buffer1)
				table.move(RebuildResult, 1, Index - 1, 1, Buffer2)
			end
			for i1, value1 in p5 do
				local IndexDelta = Index + i1 - 1
				Buffer1[IndexDelta] = value1
				Buffer2[IndexDelta] = Buffer[i1]
			end
			if Index <= CountCopy then
				table.move(Copy, Index, CountCopy, Index + #p5, Buffer1)
				table.move(RebuildResult, Index, CountCopy, Index + #p5, Buffer2)
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
	
	function config.reset(Tbl)
		-- upvalues: Copy (ref), DataSourceSequence (copy), RebuildResult (ref), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
		local CountCopy = #Copy
		local Copy1 = table.clone(Tbl)
		local RebuildResult1 = DataSourceSequence.rebuild(Copy1)
		Copy = Copy1
		RebuildResult = RebuildResult1
		MutationControllerModuleResult.emit({
			type = DataSourceChangeTypeModule.Reset,
			keys = table.clone(RebuildResult1)
		}, CountCopy)
	end
	
	return config
end