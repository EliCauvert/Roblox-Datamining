local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(ViewRecycler.Core.Types)
local ItemKeyRegistryModule = require(script.Parent.ItemKeyRegistry)
local MutationControllerModule = require(script.Parent.MutationController)

local function getItems(Count: number, Callback, p1: number, p2: number) --[[ Line: 28 ]]
	local Buffer = table.create((math.max(0, p2 - p1 + 1)))
	
	for i = p1, math.min(p2, Count) do
		table.insert(Buffer, Callback(i))
	end
	return Buffer
end

return function(p3, p4) --[[ Line: 36 | Named "createDequeDataSource" ]]
	-- upvalues: ItemKeyRegistryModule (copy), MutationControllerModule (copy), getItems (copy), DataSourceChangeTypeModule (copy)
	local P3 = p3 or {}
	local Values = {}
	local ClaimResults = {}
	local DataSourceDeque = ItemKeyRegistryModule.create(p4, "DataSource.deque")
	local RebuildResult = DataSourceDeque.rebuild(P3)
	local Largest = math.max(8, #P3)
	local Head = 1
	local CountP3 = #P3
	
	for i, value in P3 do
		Values[i] = value
		ClaimResults[i] = RebuildResult[i]
	end
	local MutationControllerModuleResult = MutationControllerModule(function() --[[ Line: 50 ]]
		-- upvalues: CountP3 (ref)
		return CountP3
	end, function() --[[ Line: 52 ]]
		-- upvalues: Values (ref), ClaimResults (ref), Largest (ref), Head (ref), CountP3 (ref), DataSourceDeque (copy)
		return {
			values = table.clone(Values),
			keys = table.clone(ClaimResults),
			capacity = Largest,
			head = Head,
			count = CountP3,
			keyRegistry = DataSourceDeque.snapshot()
		}
	end, function(p5) --[[ Line: 61 ]]
		-- upvalues: Values (ref), ClaimResults (ref), Largest (ref), Head (ref), CountP3 (ref), DataSourceDeque (copy)
		Values = p5.values
		ClaimResults = p5.keys
		Largest = p5.capacity
		Head = p5.head
		CountP3 = p5.count
		DataSourceDeque.restore(p5.keyRegistry)
	end)
	
	local function _(p5): number --[[ Line: 70 | Named "physical" ]]
		-- upvalues: Head (ref), Largest (ref)
		return (Head + p5 - 2) % Largest + 1
	end
	
	local function ensureCapacity() --[[ Line: 74 ]]
		-- upvalues: CountP3 (ref), Largest (ref), Values (ref), Head (ref), ClaimResults (ref)
		if CountP3 < Largest then return end
		local ScaledLargest = Largest * 2
		local t = {}
		local t1 = {}
		
		for i = 1, CountP3 do
			t[i] = Values[(Head + i - 2) % Largest + 1]
			t1[i] = ClaimResults[(Head + i - 2) % Largest + 1]
		end
		Values = t
		ClaimResults = t1
		Largest = ScaledLargest
		Head = 1
	end
	
	local v1 = nil
	v1 = {
		getItemCount = function() --[[ Line: 93 ]]
			-- upvalues: CountP3 (ref)
			return CountP3
		end,
		getItem = function(p5) --[[ Line: 96 ]]
			-- upvalues: Values (ref), Head (ref), Largest (ref)
			return Values[(Head + p5 - 2) % Largest + 1]
		end,
		getItemKey = function(p5) --[[ Line: 99 ]]
			-- upvalues: ClaimResults (ref), Head (ref), Largest (ref)
			return ClaimResults[(Head + p5 - 2) % Largest + 1]
		end,
		getItems = function(p5, p6) --[[ Line: 102 ]]
			-- upvalues: getItems (upval), CountP3 (ref), v1 (ref)
			return (getItems(CountP3, v1.getItem, p5, p6))
		end,
		subscribe = MutationControllerModuleResult.subscribe,
		transaction = MutationControllerModuleResult.transaction,
		pushFront = function(p5) --[[ Line: 109 ]]
			-- upvalues: CountP3 (ref), DataSourceDeque (copy), ensureCapacity (copy), Head (ref), Largest (ref), Values (ref), ClaimResults (ref), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
			local Count: number = CountP3
			local ClaimResult = DataSourceDeque.claim(p5, 1)
			ensureCapacity()
			Head = (Head - 2) % Largest + 1
			Values[Head] = p5
			ClaimResults[Head] = ClaimResult
			CountP3 += 1
			MutationControllerModuleResult.emit({
				index = 1,
				type = DataSourceChangeTypeModule.Insert,
				keys = { ClaimResult }
			}, Count)
		end,
		pushBack = function(p5) --[[ Line: 120 ]]
			-- upvalues: CountP3 (ref), DataSourceDeque (copy), ensureCapacity (copy), Head (ref), Largest (ref), Values (ref), ClaimResults (ref), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
			local Count: number = CountP3
			local ClaimResult = DataSourceDeque.claim(p5, CountP3 + 1)
			ensureCapacity()
			local NewHead = (Head + (CountP3 + 1) - 2) % Largest + 1
			Values[NewHead] = p5
			ClaimResults[NewHead] = ClaimResult
			CountP3 += 1
			MutationControllerModuleResult.emit({
				type = DataSourceChangeTypeModule.Insert,
				index = CountP3,
				keys = { ClaimResult }
			}, Count)
		end,
		popFront = function() --[[ Line: 131 ]]
			-- upvalues: CountP3 (ref), Values (ref), Head (ref), ClaimResults (ref), DataSourceDeque (copy), Largest (ref), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
			if CountP3 == 0 then
				return nil
			else
				local Count: number = CountP3
				local Value = Values[Head]
				Values[Head] = nil
				local ClaimResult = ClaimResults[Head]
				ClaimResults[Head] = nil
				DataSourceDeque.release(ClaimResult)
				Head = Head % Largest + 1
				CountP3 -= 1
				MutationControllerModuleResult.emit({
					index = 1,
					type = DataSourceChangeTypeModule.Remove,
					keys = { ClaimResult }
				}, Count)
				
				return Value
			end
		end,
		popBack = function() --[[ Line: 147 ]]
			-- upvalues: CountP3 (ref), Head (ref), Largest (ref), Values (ref), ClaimResults (ref), DataSourceDeque (copy), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
			if CountP3 == 0 then
				return nil
			else
				local Index: number = CountP3
				local NewHead = (Head + CountP3 - 2) % Largest + 1
				local Value = Values[NewHead]
				Values[NewHead] = nil
				local ClaimResult = ClaimResults[NewHead]
				ClaimResults[NewHead] = nil
				DataSourceDeque.release(ClaimResult)
				CountP3 -= 1
				MutationControllerModuleResult.emit({
					type = DataSourceChangeTypeModule.Remove,
					index = Index,
					keys = { ClaimResult }
				}, Index)
				
				return Value
			end
		end
	}
	
	return v1
end