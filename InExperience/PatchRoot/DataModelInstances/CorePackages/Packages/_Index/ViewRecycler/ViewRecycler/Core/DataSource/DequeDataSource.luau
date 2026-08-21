local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Types)
local itemKeyRegistryModule = require(script.Parent.ItemKeyRegistry)
local mutationControllerModule = require(script.Parent.MutationController)

local function getItems(p0, p1, p2, p3) --[[ line: 28 ]]
	local list = table.create(math.max(0, p3 - p2 + 1))
	
	for i = p2, math.min(p3, p0) do
		table.insert(list, p1(i))
	end
	return list
end

return function(p4, p5) --[[ line: 36 | named "createDequeDataSource" ]]
	-- upvalues: itemKeyRegistryModule (ref), mutationControllerModule (ref), getItems (ref), dataSourceChangeTypeModule (ref)
	p4 = p4 or {}
	local t = {}
	local t_1 = {}
	local var9 = itemKeyRegistryModule.create(p5, "DataSource.deque")
	local var10 = var9.rebuild(p4)
	local maxValue = math.max(8, #p4)
	local var12 = 1
	local p4Count = #p4
	
	for i, v in p4 do
		t[i] = v
		t_1[i] = var10[i]
	end
	local var14 = mutationControllerModule(function() --[[ line: 50 ]]
		-- upvalues: p4Count (write)
		return p4Count
	end, function() --[[ line: 52 ]]
		-- upvalues: t (write), t_1 (write), maxValue (write), var12 (write), p4Count (write), var9 (ref)
		return {
			values = table.clone(t),
			keys = table.clone(t_1),
			capacity = maxValue,
			head = var12,
			count = p4Count,
			keyRegistry = var9.snapshot()
		}
	end, function(p6) --[[ line: 61 ]]
		-- upvalues: t (write), t_1 (write), maxValue (write), var12 (write), p4Count (write), var9 (ref)
		t = p6.values
		t_1 = p6.keys
		maxValue = p6.capacity
		var12 = p6.head
		p4Count = p6.count
		var9.restore(p6.keyRegistry)
	end)
	
	local function _(p7) --[[ line: 70 | named "physical" ]]
		-- upvalues: var12 (write), maxValue (write)
		return (var12 + p7 - 2) % maxValue + 1
	end
	
	local function ensureCapacity() --[[ line: 74 ]]
		-- upvalues: p4Count (write), maxValue (write), t (write), var12 (write), t_1 (write)
		if p4Count < maxValue then return end
		local var17 = maxValue * 2
		local t_2 = {}
		local t_3 = {}
		
		for i = 1, p4Count do
			t_2[i] = t[(var12 + i - 2) % maxValue + 1]
			t_3[i] = t_1[(var12 + i - 2) % maxValue + 1]
		end
		t = t_2
		t_1 = t_3
		maxValue = var17
		var12 = 1
	end
	
	local var16 = nil
	
	return {
		getItemCount = function() --[[ line: 93 ]]
			-- upvalues: p4Count (write)
			return p4Count
		end,
		getItem = function(p8) --[[ line: 96 ]]
			-- upvalues: t (write), var12 (write), maxValue (write)
			return t[(var12 + p8 - 2) % maxValue + 1]
		end,
		getItemKey = function(p9) --[[ line: 99 ]]
			-- upvalues: t_1 (write), var12 (write), maxValue (write)
			return t_1[(var12 + p9 - 2) % maxValue + 1]
		end,
		getItems = function(p10, p11) --[[ line: 102 ]]
			-- upvalues: getItems (copy), p4Count (write), var16 (write)
			return getItems(p4Count, var16.getItem, p10, p11)
		end,
		subscribe = var14.subscribe,
		transaction = var14.transaction,
		pushFront = function(p12) --[[ line: 109 ]]
			-- upvalues: p4Count (write), var9 (ref), ensureCapacity (ref), var12 (write), maxValue (write), t (write), t_1 (write), var14 (ref), dataSourceChangeTypeModule (copy)
			local var20 = var9.claim(p12, 1)
			ensureCapacity()
			var12 = (var12 - 2) % maxValue + 1
			t[var12] = p12
			t_1[var12] = var20
			p4Count += 1
			var14.emit({
				index = 1,
				type = dataSourceChangeTypeModule.Insert,
				keys = { var20 }
			}, p4Count)
		end,
		pushBack = function(p13) --[[ line: 120 ]]
			-- upvalues: p4Count (write), var9 (ref), ensureCapacity (ref), var12 (write), maxValue (write), t (write), t_1 (write), var14 (ref), dataSourceChangeTypeModule (copy)
			local var21 = var9.claim(p13, p4Count + 1)
			ensureCapacity()
			local var22 = (var12 + (p4Count + 1) - 2) % maxValue + 1
			t[var22] = p13
			t_1[var22] = var21
			p4Count += 1
			var14.emit({
				type = dataSourceChangeTypeModule.Insert,
				index = p4Count,
				keys = { var21 }
			}, p4Count)
		end,
		popFront = function() --[[ line: 131 ]]
			-- upvalues: p4Count (write), t (write), var12 (write), t_1 (write), var9 (ref), maxValue (write), var14 (ref), dataSourceChangeTypeModule (copy)
			if p4Count == 0 then
				return nil
			end
			local var23 = t[var12]
			t[var12] = nil
			local var24 = t_1[var12]
			t_1[var12] = nil
			var9.release(var24)
			var12 = var12 % maxValue + 1
			p4Count -= 1
			var14.emit({
				index = 1,
				type = dataSourceChangeTypeModule.Remove,
				keys = { var24 }
			}, p4Count)
			
			return var23
		end,
		popBack = function() --[[ line: 147 ]]
			-- upvalues: p4Count (write), var12 (write), maxValue (write), t (write), t_1 (write), var9 (ref), var14 (ref), dataSourceChangeTypeModule (copy)
			if p4Count == 0 then
				return nil
			end
			local var25 = (var12 + p4Count - 2) % maxValue + 1
			local var26 = t[var25]
			t[var25] = nil
			local var27 = t_1[var25]
			t_1[var25] = nil
			var9.release(var27)
			p4Count -= 1
			var14.emit({
				type = dataSourceChangeTypeModule.Remove,
				index = p4Count,
				keys = { var27 }
			}, p4Count)
			
			return var26
		end
	}
end