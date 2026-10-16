local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(ViewRecycler.Core.Types)
local ItemKeyRegistryModule = require(script.Parent.ItemKeyRegistry)
local MutationControllerModule = require(script.Parent.MutationController)

local function getItems(Count: number, Callback, p1: number, p2: number) --[[ Line: 26 ]]
	local Buffer = table.create((math.max(0, p2 - p1 + 1)))
	
	for i = p1, math.min(p2, Count) do
		table.insert(Buffer, Callback(i))
	end
	return Buffer
end

return function(Index: number, p3, p4) --[[ Line: 34 | Named "createRingBufferDataSource" ]]
	-- upvalues: ItemKeyRegistryModule (copy), MutationControllerModule (copy), getItems (copy), DataSourceChangeTypeModule (copy)
	local Values: boolean = Index > 0 and Index % 1 == 0
	assert(Values, "DataSource.ringBuffer: capacity must be a positive integer")
	local P4 = p3 or {}
	assert(#P4 <= Index, "DataSource.ringBuffer: initial values exceed capacity")
	Values = {}
	local Keys = {}
	local DataSourceRingBuffer = ItemKeyRegistryModule.create(p4, "DataSource.ringBuffer")
	local RebuildResult = DataSourceRingBuffer.rebuild(P4)
	local Head = 1
	local CountP4 = #P4
	
	for i, value in P4 do
		Values[i] = value
		Keys[i] = RebuildResult[i]
	end
	local MutationControllerModuleResult = MutationControllerModule(function() --[[ Line: 49 ]]
		-- upvalues: CountP4 (ref)
		return CountP4
	end, function() --[[ Line: 51 ]]
		-- upvalues: Values (ref), Keys (ref), Head (ref), CountP4 (ref), DataSourceRingBuffer (copy)
		return {
			values = table.clone(Values),
			keys = table.clone(Keys),
			head = Head,
			count = CountP4,
			keyRegistry = DataSourceRingBuffer.snapshot()
		}
	end, function(p5) --[[ Line: 59 ]]
		-- upvalues: Values (ref), Keys (ref), Head (ref), CountP4 (ref), DataSourceRingBuffer (copy)
		Values = p5.values
		Keys = p5.keys
		Head = p5.head
		CountP4 = p5.count
		DataSourceRingBuffer.restore(p5.keyRegistry)
	end)
	
	local function _(p5): number --[[ Line: 67 | Named "physical" ]]
		-- upvalues: Head (ref), Index (copy)
		return (Head + p5 - 2) % Index + 1
	end
	
	local v1 = nil
	v1 = {
		getItemCount = function() --[[ Line: 73 ]]
			-- upvalues: CountP4 (ref)
			return CountP4
		end,
		getItem = function(p5) --[[ Line: 76 ]]
			-- upvalues: Values (ref), Head (ref), Index (copy)
			return Values[(Head + p5 - 2) % Index + 1]
		end,
		getItemKey = function(p5) --[[ Line: 79 ]]
			-- upvalues: Keys (ref), Head (ref), Index (copy)
			return Keys[(Head + p5 - 2) % Index + 1]
		end,
		getItems = function(p5, p6) --[[ Line: 82 ]]
			-- upvalues: getItems (upval), CountP4 (ref), v1 (ref)
			return (getItems(CountP4, v1.getItem, p5, p6))
		end,
		subscribe = MutationControllerModuleResult.subscribe,
		transaction = MutationControllerModuleResult.transaction,
		push = function(p5) --[[ Line: 89 ]]
			-- upvalues: CountP4 (ref), Index (copy), Head (ref), Keys (ref), DataSourceRingBuffer (copy), Values (ref), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
			local Count: number = CountP4
			
			if CountP4 == Index then
				local Head1: number = Head
				local Key = Keys[Head1]
				local ReplaceResult = DataSourceRingBuffer.replace(Key, p5, Index)
				Values[Head1] = p5
				Keys[Head1] = ReplaceResult
				Head = Head % Index + 1
				MutationControllerModuleResult.emitMany({
					{
						index = 1,
						type = DataSourceChangeTypeModule.Remove,
						keys = { Key }
					},
					{
						type = DataSourceChangeTypeModule.Insert,
						index = Index,
						keys = { ReplaceResult }
					}
				}, Count)
				
				return
			else
				local ClaimResult = DataSourceRingBuffer.claim(p5, CountP4 + 1)
				local NewHead = (Head + (CountP4 + 1) - 2) % Index + 1
				Values[NewHead] = p5
				Keys[NewHead] = ClaimResult
				CountP4 += 1
				MutationControllerModuleResult.emit({
					type = DataSourceChangeTypeModule.Insert,
					index = CountP4,
					keys = { ClaimResult }
				}, Count)
			end
		end,
		clear = function() --[[ Line: 113 ]]
			-- upvalues: CountP4 (ref), Values (ref), Keys (ref), DataSourceRingBuffer (copy), Head (ref), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
			local Count: number = CountP4
			
			if Count ~= 0 then
				Values = {}
				Keys = {}
				DataSourceRingBuffer.clear()
				Head = 1
				CountP4 = 0
				MutationControllerModuleResult.emit({ type = DataSourceChangeTypeModule.Reset, keys = {} }, Count)
				
				return
			end
		end
	}
	
	return v1
end