local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(ViewRecycler.Core.Types)
local ItemKeyRegistryModule = require(script.Parent.ItemKeyRegistry)
local MutationControllerModule = require(script.Parent.MutationController)
local ReadDenseRangeModule = require(script.Parent.readDenseRange)

return function(Index: number, p1, p2) --[[ Line: 27 | Named "createRingBufferDataSource" ]]
	-- upvalues: ItemKeyRegistryModule (copy), MutationControllerModule (copy), ReadDenseRangeModule (copy), DataSourceChangeTypeModule (copy)
	local Values: boolean = Index > 0 and Index % 1 == 0
	assert(Values, "DataSource.ringBuffer: capacity must be a positive integer")
	local P1 = p1 or {}
	assert(#P1 <= Index, "DataSource.ringBuffer: initial values exceed capacity")
	Values = {}
	local Keys = {}
	local DataSourceRingBuffer = ItemKeyRegistryModule.create(p2, "DataSource.ringBuffer")
	local RebuildResult = DataSourceRingBuffer.rebuild(P1)
	local Head = 1
	local CountP1 = #P1
	
	for i, value in P1 do
		Values[i] = value
		Keys[i] = RebuildResult[i]
	end
	local MutationControllerModuleResult = MutationControllerModule(function() --[[ Line: 42 ]]
		-- upvalues: CountP1 (ref)
		return CountP1
	end, function() --[[ Line: 44 ]]
		-- upvalues: Values (ref), Keys (ref), Head (ref), CountP1 (ref), DataSourceRingBuffer (copy)
		return {
			values = table.clone(Values),
			keys = table.clone(Keys),
			head = Head,
			count = CountP1,
			keyRegistry = DataSourceRingBuffer.snapshot()
		}
	end, function(p3) --[[ Line: 52 ]]
		-- upvalues: Values (ref), Keys (ref), Head (ref), CountP1 (ref), DataSourceRingBuffer (copy)
		Values = p3.values
		Keys = p3.keys
		Head = p3.head
		CountP1 = p3.count
		DataSourceRingBuffer.restore(p3.keyRegistry)
	end)
	
	local function _(p3): number --[[ Line: 60 | Named "physical" ]]
		-- upvalues: Head (ref), Index (copy)
		return (Head + p3 - 2) % Index + 1
	end
	
	local v1 = nil
	v1 = {
		getItemCount = function() --[[ Line: 66 ]]
			-- upvalues: CountP1 (ref)
			return CountP1
		end,
		getItem = function(p3) --[[ Line: 69 ]]
			-- upvalues: Values (ref), Head (ref), Index (copy)
			return Values[(Head + p3 - 2) % Index + 1]
		end,
		getItemKey = function(p3) --[[ Line: 72 ]]
			-- upvalues: Keys (ref), Head (ref), Index (copy)
			return Keys[(Head + p3 - 2) % Index + 1]
		end,
		getItems = function(p3, p4) --[[ Line: 75 ]]
			-- upvalues: ReadDenseRangeModule (upval), CountP1 (ref), v1 (ref)
			return ReadDenseRangeModule(CountP1, v1.getItem, p3, p4)
		end,
		subscribe = MutationControllerModuleResult.subscribe,
		transaction = MutationControllerModuleResult.transaction,
		push = function(p3) --[[ Line: 82 ]]
			-- upvalues: CountP1 (ref), Index (copy), Head (ref), Keys (ref), DataSourceRingBuffer (copy), Values (ref), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
			local Count: number = CountP1
			
			if CountP1 == Index then
				local Head1: number = Head
				local Key = Keys[Head1]
				local ReplaceResult = DataSourceRingBuffer.replace(Key, p3, Index)
				Values[Head1] = p3
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
				local ClaimResult = DataSourceRingBuffer.claim(p3, CountP1 + 1)
				local NewHead = (Head + (CountP1 + 1) - 2) % Index + 1
				Values[NewHead] = p3
				Keys[NewHead] = ClaimResult
				CountP1 += 1
				MutationControllerModuleResult.emit({
					type = DataSourceChangeTypeModule.Insert,
					index = CountP1,
					keys = { ClaimResult }
				}, Count)
			end
		end,
		clear = function() --[[ Line: 106 ]]
			-- upvalues: CountP1 (ref), Values (ref), Keys (ref), DataSourceRingBuffer (copy), Head (ref), MutationControllerModuleResult (copy), DataSourceChangeTypeModule (upval)
			local Count: number = CountP1
			
			if Count ~= 0 then
				Values = {}
				Keys = {}
				DataSourceRingBuffer.clear()
				Head = 1
				CountP1 = 0
				MutationControllerModuleResult.emit({ type = DataSourceChangeTypeModule.Reset, keys = {} }, Count)
				
				return
			end
		end
	}
	
	return v1
end