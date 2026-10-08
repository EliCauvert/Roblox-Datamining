local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Types)
local itemKeyRegistryModule = require(script.Parent.ItemKeyRegistry)
local mutationControllerModule = require(script.Parent.MutationController)

local function getItems(p1, p2, p3, p4)
	local list = table.create(math.max(0, p4 - p3 + 1))
	
	for i = p3, math.min(p4, p1) do
		table.insert(list, p2(i))
	end
	return list
end

return function(p5, p6)
	-- upvalues: itemKeyRegistryModule (ref), mutationControllerModule (ref), getItems (ref), dataSourceChangeTypeModule (ref)
	p5 = p5 or {}
	local t = {}
	local t_1 = {}
	local var1 = itemKeyRegistryModule.create(p6, "DataSource.deque")
	local var2 = var1.rebuild(p5)
	local maxValue = math.max(8, #p5)
	local var3 = 1
	local p4Count = #p5
	
	for i, v in p5 do
		t[i] = v
		t_1[i] = var2[i]
	end
	local var4 = mutationControllerModule(function()
		-- upvalues: p4Count (write)
		return p4Count
	end, function()
		-- upvalues: t (write), t_1 (write), maxValue (write), var3 (write), p4Count (write), var1 (ref)
		return {
			values = table.clone(t),
			keys = table.clone(t_1),
			capacity = maxValue,
			head = var3,
			count = p4Count,
			keyRegistry = var1.snapshot()
		}
	end, function(p7)
		-- upvalues: t (write), t_1 (write), maxValue (write), var3 (write), p4Count (write), var1 (ref)
		t = p7.values
		t_1 = p7.keys
		maxValue = p7.capacity
		var3 = p7.head
		p4Count = p7.count
		var1.restore(p7.keyRegistry)
	end)
	
	local function _(p7)
		-- upvalues: var3 (write), maxValue (write)
		return (var3 + p7 - 2) % maxValue + 1
	end
	
	local function ensureCapacity()
		-- upvalues: p4Count (write), maxValue (write), t (write), var3 (write), t_1 (write)
		if p4Count < maxValue then return end
		local var5 = maxValue * 2
		local t_2 = {}
		local t_3 = {}
		
		for i = 1, p4Count do
			t_2[i] = t[(var3 + i - 2) % maxValue + 1]
			t_3[i] = t_1[(var3 + i - 2) % maxValue + 1]
		end
		t = t_2
		t_1 = t_3
		maxValue = var5
		var3 = 1
	end
	
	local var6 = nil
	
	return {
		getItemCount = function()
			-- upvalues: p4Count (write)
			return p4Count
		end,
		getItem = function(p7)
			-- upvalues: t (write), var3 (write), maxValue (write)
			return t[(var3 + p7 - 2) % maxValue + 1]
		end,
		getItemKey = function(p7)
			-- upvalues: t_1 (write), var3 (write), maxValue (write)
			return t_1[(var3 + p7 - 2) % maxValue + 1]
		end,
		getItems = function(p7, p8)
			-- upvalues: getItems (copy), p4Count (write), var6 (write)
			return getItems(p4Count, var6.getItem, p7, p8)
		end,
		subscribe = var4.subscribe,
		transaction = var4.transaction,
		pushFront = function(p7)
			-- upvalues: p4Count (write), var1 (ref), ensureCapacity (ref), var3 (write), maxValue (write), t (write), t_1 (write), var4 (ref), dataSourceChangeTypeModule (copy)
			local var7 = var1.claim(p7, 1)
			ensureCapacity()
			var3 = (var3 - 2) % maxValue + 1
			t[var3] = p7
			t_1[var3] = var7
			p4Count += 1
			var4.emit({
				index = 1,
				type = dataSourceChangeTypeModule.Insert,
				keys = { var7 }
			}, p4Count)
		end,
		pushBack = function(p7)
			-- upvalues: p4Count (write), var1 (ref), ensureCapacity (ref), var3 (write), maxValue (write), t (write), t_1 (write), var4 (ref), dataSourceChangeTypeModule (copy)
			local var7 = var1.claim(p7, p4Count + 1)
			ensureCapacity()
			local var8 = (var3 + (p4Count + 1) - 2) % maxValue + 1
			t[var8] = p7
			t_1[var8] = var7
			p4Count += 1
			var4.emit({
				type = dataSourceChangeTypeModule.Insert,
				index = p4Count,
				keys = { var7 }
			}, p4Count)
		end,
		popFront = function()
			-- upvalues: p4Count (write), t (write), var3 (write), t_1 (write), var1 (ref), maxValue (write), var4 (ref), dataSourceChangeTypeModule (copy)
			if p4Count == 0 then
				return nil
			end
			local var7 = t[var3]
			t[var3] = nil
			local var8 = t_1[var3]
			t_1[var3] = nil
			var1.release(var8)
			var3 = var3 % maxValue + 1
			p4Count -= 1
			var4.emit({
				index = 1,
				type = dataSourceChangeTypeModule.Remove,
				keys = { var8 }
			}, p4Count)
			
			return var7
		end,
		popBack = function()
			-- upvalues: p4Count (write), var3 (write), maxValue (write), t (write), t_1 (write), var1 (ref), var4 (ref), dataSourceChangeTypeModule (copy)
			if p4Count == 0 then
				return nil
			end
			local var7 = (var3 + p4Count - 2) % maxValue + 1
			local var8 = t[var7]
			t[var7] = nil
			local var9 = t_1[var7]
			t_1[var7] = nil
			var1.release(var9)
			p4Count -= 1
			var4.emit({
				type = dataSourceChangeTypeModule.Remove,
				index = p4Count,
				keys = { var9 }
			}, p4Count)
			
			return var8
		end
	}
end