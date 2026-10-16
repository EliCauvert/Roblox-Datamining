local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(ViewRecycler.Core.Types)
local ItemKeyRegistryModule = require(script.Parent.ItemKeyRegistry)
local MutationControllerModule = require(script.Parent.MutationController)
local ReadDenseRangeModule = require(script.Parent.readDenseRange)

return function(p1, p2) --[[ Line: 32 | Named "createDequeDataSource" ]]
	-- upvalues: ItemKeyRegistryModule (copy), MutationControllerModule (copy), ReadDenseRangeModule (copy), DataSourceChangeTypeModule (copy)
	local P0 = p1 or {}
	local Values = {}
	local Keys = {}
	local DataSourceDeque = ItemKeyRegistryModule.create(p2, "DataSource.deque")
	local RebuildResult = DataSourceDeque.rebuild(P0)
	local Largest = math.max(8, #P0)
	local Head = 1
	local CountP0 = #P0
	
	for i, value in P0 do
		Values[i] = value
		Keys[i] = RebuildResult[i]
	end
	local MutationControllerModuleResult = MutationControllerModule(function() --[[ Line: 46 ]]
		-- upvalues: CountP0 (ref)
		return CountP0
	end, function() --[[ Line: 48 ]]
		-- upvalues: Values (ref), Keys (ref), Largest (ref), Head (ref), CountP0 (ref), DataSourceDeque (copy)
		return {
			values = table.clone(Values),
			keys = table.clone(Keys),
			capacity = Largest,
			head = Head,
			count = CountP0,
			keyRegistry = DataSourceDeque.snapshot()
		}
	end, function(p3) --[[ Line: 57 ]]
		-- upvalues: Values (ref), Keys (ref), Largest (ref), Head (ref), CountP0 (ref), DataSourceDeque (copy)
		Values = p3.values
		Keys = p3.keys
		Largest = p3.capacity
		Head = p3.head
		CountP0 = p3.count
		DataSourceDeque.restore(p3.keyRegistry)
	end)
	
	local function _(p3): number --[[ Line: 66 | Named "physical" ]]
		-- upvalues: Head (ref), Largest (ref)
		return (Head + p3 - 2) % Largest + 1
	end
	
	local function ensureCapacity(p3) --[[ Line: 70 ]]
		-- upvalues: Largest (ref), CountP0 (ref), Values (ref), Head (ref), Keys (ref)
		if p3 <= Largest then return end
		local ScaledLargest = Largest * 2
		while ScaledLargest < p3 do
			ScaledLargest *= 2
		end
		local t = {}
		local t1 = {}
		
		for i = 1, CountP0 do
			t[i] = Values[(Head + i - 2) % Largest + 1]
			t1[i] = Keys[(Head + i - 2) % Largest + 1]
		end
		Values = t
		Keys = t1
		Largest = ScaledLargest
		Head = 1
	end
	
	local function claimMany(p4, p5) --[[ Line: 90 ]]
		-- upvalues: DataSourceDeque (copy)
		local Buffer = table.create(#p4)
		local Packed = table.pack(pcall(function() --[[ Line: 92 ]]
			-- upvalues: p4 (copy), Buffer (copy), DataSourceDeque (upval), p5 (copy)
			for i, value in p4 do
				Buffer[i] = DataSourceDeque.claim(value, p5 + i - 1)
			end
		end))
		
		if not Packed[1] then
			for _, value in Buffer do
				DataSourceDeque.release(value)
			end
			error(Packed[2], 0)
		end
		return Buffer
	end
	
	local v1 = nil
	v1 = {
		getItemCount = function() --[[ Line: 108 ]]
			-- upvalues: CountP0 (ref)
			return CountP0
		end,
		getItem = function(p6) --[[ Line: 111 ]]
			-- upvalues: Values (ref), Head (ref), Largest (ref)
			return Values[(Head + p6 - 2) % Largest + 1]
		end,
		getItemKey = function(p6) --[[ Line: 114 ]]
			-- upvalues: Keys (ref), Head (ref), Largest (ref)
			return Keys[(Head + p6 - 2) % Largest + 1]
		end,
		getItems = function(p6, p7) --[[ Line: 117 ]]
			-- upvalues: ReadDenseRangeModule (upval), CountP0 (ref), v1 (ref)
			return ReadDenseRangeModule(CountP0, v1.getItem, p6, p7)
		end,
		subscribe = MutationControllerModuleResult.subscribe,
		transaction = MutationControllerModuleResult.transaction
	}
	
	function v1.pushFront(p6) --[[ Line: 124 ]]
		-- upvalues: v1 (ref)
		v1.pushFrontMany({ p6 })
	end
	
	function v1.pushBack(p6) --[[ Line: 128 ]]
		-- upvalues: v1 (ref)
		v1.pushBackMany({ p6 })
	end
	
	function v1.pushFrontMany(List) --[[ Line: 132 ]]
		-- upvalues: CountP0 (ref), claimMany (copy), ensureCapacity (copy), Head (ref), Largest (ref), Values (ref), Keys (ref), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
		local CountList = #List
		
		if CountList == 0 then return end
		local Count: number = CountP0
		local ClaimManyResult = claimMany(List, 1)
		ensureCapacity(CountP0 + CountList)
		Head = (Head - CountList - 1) % Largest + 1
		
		for i, value in List do
			local NewHead = (Head + i - 2) % Largest + 1
			Values[NewHead] = value
			Keys[NewHead] = ClaimManyResult[i]
		end
		CountP0 += CountList
		MutationControllerModuleResult.emit({
			index = 1,
			type = DataSourceChangeTypeModule.Insert,
			keys = ClaimManyResult
		}, Count)
	end
	
	function v1.pushBackMany(List) --[[ Line: 150 ]]
		-- upvalues: CountP0 (ref), claimMany (copy), ensureCapacity (copy), Head (ref), Largest (ref), Values (ref), Keys (ref), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
		local CountList = #List
		
		if CountList == 0 then return end
		local Count: number = CountP0
		local ClaimManyResult = claimMany(List, CountP0 + 1)
		ensureCapacity(CountP0 + CountList)
		
		for i, value in List do
			local NewHead = (Head + (CountP0 + i) - 2) % Largest + 1
			Values[NewHead] = value
			Keys[NewHead] = ClaimManyResult[i]
		end
		CountP0 += CountList
		MutationControllerModuleResult.emit({
			type = DataSourceChangeTypeModule.Insert,
			index = Count + 1,
			keys = ClaimManyResult
		}, Count)
	end
	
	function v1.popFront() --[[ Line: 170 ]]
		-- upvalues: CountP0 (ref), Values (ref), Head (ref), Keys (ref), DataSourceDeque (copy), Largest (ref), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
		if CountP0 == 0 then
			return nil
		else
			local Count: number = CountP0
			local Value = Values[Head]
			Values[Head] = nil
			local Key = Keys[Head]
			Keys[Head] = nil
			DataSourceDeque.release(Key)
			Head = Head % Largest + 1
			CountP0 -= 1
			MutationControllerModuleResult.emit({
				index = 1,
				type = DataSourceChangeTypeModule.Remove,
				keys = { Key }
			}, Count)
			
			return Value
		end
	end
	
	function v1.popBack() --[[ Line: 186 ]]
		-- upvalues: CountP0 (ref), Head (ref), Largest (ref), Values (ref), Keys (ref), DataSourceDeque (copy), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
		if CountP0 == 0 then
			return nil
		else
			local Index: number = CountP0
			local NewHead = (Head + CountP0 - 2) % Largest + 1
			local Value = Values[NewHead]
			Values[NewHead] = nil
			local Key = Keys[NewHead]
			Keys[NewHead] = nil
			DataSourceDeque.release(Key)
			CountP0 -= 1
			MutationControllerModuleResult.emit({
				type = DataSourceChangeTypeModule.Remove,
				index = Index,
				keys = { Key }
			}, Index)
			
			return Value
		end
	end
	
	function v1.setItem(p6: number, p7) --[[ Line: 205 ]]
		-- upvalues: CountP0 (ref), Head (ref), Largest (ref), Keys (ref), DataSourceDeque (copy), Values (ref), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
		local Count = CountP0
		assert(p6 >= 1 and p6 <= Count, "DataSource.deque: setItem index out of range")
		local NewHead = (Head + p6 - 2) % Largest + 1
		local Key = Keys[NewHead]
		DataSourceDeque.assertPreserved(Key, p7, p6)
		Values[NewHead] = p7
		MutationControllerModuleResult.emit({ type = DataSourceChangeTypeModule.Update, keys = { Key } }, Count)
	end
	
	return v1
end