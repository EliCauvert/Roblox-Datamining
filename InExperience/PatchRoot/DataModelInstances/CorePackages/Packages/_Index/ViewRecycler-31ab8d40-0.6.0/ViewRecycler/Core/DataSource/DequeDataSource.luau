local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Types)
local itemKeyRegistryModule = require(script.Parent.ItemKeyRegistry)
local mutationControllerModule = require(script.Parent.MutationController)
local readDenseRangeModule = require(script.Parent.readDenseRange)

return function(p1, p2)
	-- upvalues: itemKeyRegistryModule (ref), mutationControllerModule (ref), readDenseRangeModule (ref), dataSourceChangeTypeModule (ref)
	p1 = p1 or {}
	local t = {}
	local t_1 = {}
	local var1 = itemKeyRegistryModule.create(p2, "DataSource.deque")
	local var2 = var1.rebuild(p1)
	local maxValue = math.max(8, #p1)
	local var3 = 1
	local p0Count = #p1
	
	for i, v in p1 do
		t[i] = v
		t_1[i] = var2[i]
	end
	local var4 = mutationControllerModule(function()
		-- upvalues: p0Count (write)
		return p0Count
	end, function()
		-- upvalues: t (write), t_1 (write), maxValue (write), var3 (write), p0Count (write), var1 (ref)
		return {
			values = table.clone(t),
			keys = table.clone(t_1),
			capacity = maxValue,
			head = var3,
			count = p0Count,
			keyRegistry = var1.snapshot()
		}
	end, function(p3)
		-- upvalues: t (write), t_1 (write), maxValue (write), var3 (write), p0Count (write), var1 (ref)
		t = p3.values
		t_1 = p3.keys
		maxValue = p3.capacity
		var3 = p3.head
		p0Count = p3.count
		var1.restore(p3.keyRegistry)
	end)
	
	local function _(p3)
		-- upvalues: var3 (write), maxValue (write)
		return (var3 + p3 - 2) % maxValue + 1
	end
	
	local function ensureCapacity(p3)
		-- upvalues: maxValue (write), p0Count (write), t (write), var3 (write), t_1 (write)
		if p3 <= maxValue then return end
		local var5 = maxValue * 2
		while var5 < p3 do
			var5 *= 2
		end
		local t_2 = {}
		local t_3 = {}
		
		for i = 1, p0Count do
			t_2[i] = t[(var3 + i - 2) % maxValue + 1]
			t_3[i] = t_1[(var3 + i - 2) % maxValue + 1]
		end
		t = t_2
		t_1 = t_3
		maxValue = var5
		var3 = 1
	end
	
	local function claimMany(p4, p5)
		-- upvalues: var1 (ref)
		local list = table.create(#p4)
		local packed = table.pack(pcall(function()
			-- upvalues: p4 (ref), list (ref), var1 (copy), p5 (ref)
			for i, v in p4 do
				list[i] = var1.claim(v, p5 + i - 1)
			end
		end))
		
		if not packed[1] then
			for i, v in list do
				var1.release(v)
			end
			error(packed[2], 0)
		end
		return list
	end
	
	local t_2 = nil
	t_2 = {
		getItemCount = function()
			-- upvalues: p0Count (write)
			return p0Count
		end,
		getItem = function(p6)
			-- upvalues: t (write), var3 (write), maxValue (write)
			return t[(var3 + p6 - 2) % maxValue + 1]
		end,
		getItemKey = function(p6)
			-- upvalues: t_1 (write), var3 (write), maxValue (write)
			return t_1[(var3 + p6 - 2) % maxValue + 1]
		end,
		getItems = function(p6, p7)
			-- upvalues: readDenseRangeModule (copy), p0Count (write), t_2 (write)
			return readDenseRangeModule(p0Count, t_2.getItem, p6, p7)
		end,
		subscribe = var4.subscribe,
		transaction = var4.transaction
	}
	
	function t_2.pushFront(p6)
		-- upvalues: t_2 (write)
		t_2.pushFrontMany({ p6 })
	end
	
	function t_2.pushBack(p6)
		-- upvalues: t_2 (write)
		t_2.pushBackMany({ p6 })
	end
	
	function t_2.pushFrontMany(p6)
		-- upvalues: p0Count (write), claimMany (ref), ensureCapacity (ref), var3 (write), maxValue (write), t (write), t_1 (write), var4 (ref), dataSourceChangeTypeModule (copy)
		local p13Count = #p6
		
		if p13Count == 0 then return end
		local var6 = claimMany(p6, 1)
		ensureCapacity(p0Count + p13Count)
		var3 = (var3 - p13Count - 1) % maxValue + 1
		
		for i, v in p6 do
			local var7 = (var3 + i - 2) % maxValue + 1
			t[var7] = v
			t_1[var7] = var6[i]
		end
		p0Count += p13Count
		var4.emit({
			index = 1,
			type = dataSourceChangeTypeModule.Insert,
			keys = var6
		}, p0Count)
	end
	
	function t_2.pushBackMany(p7)
		-- upvalues: p0Count (write), claimMany (ref), ensureCapacity (ref), var3 (write), maxValue (write), t (write), t_1 (write), var4 (ref), dataSourceChangeTypeModule (copy)
		local p14Count = #p7
		
		if p14Count == 0 then return end
		local var8 = claimMany(p7, p0Count + 1)
		ensureCapacity(p0Count + p14Count)
		
		for i, v in p7 do
			local var9 = (var3 + (p0Count + i) - 2) % maxValue + 1
			t[var9] = v
			t_1[var9] = var8[i]
		end
		p0Count += p14Count
		var4.emit({
			type = dataSourceChangeTypeModule.Insert,
			index = p0Count + 1,
			keys = var8
		}, p0Count)
	end
	
	function t_2.popFront()
		-- upvalues: p0Count (write), t (write), var3 (write), t_1 (write), var1 (ref), maxValue (write), var4 (ref), dataSourceChangeTypeModule (copy)
		if p0Count == 0 then
			return nil
		end
		local var10 = t[var3]
		t[var3] = nil
		local var11 = t_1[var3]
		t_1[var3] = nil
		var1.release(var11)
		var3 = var3 % maxValue + 1
		p0Count -= 1
		var4.emit({
			index = 1,
			type = dataSourceChangeTypeModule.Remove,
			keys = { var11 }
		}, p0Count)
		
		return var10
	end
	
	function t_2.popBack()
		-- upvalues: p0Count (write), var3 (write), maxValue (write), t (write), t_1 (write), var1 (ref), var4 (ref), dataSourceChangeTypeModule (copy)
		if p0Count == 0 then
			return nil
		end
		local var10 = (var3 + p0Count - 2) % maxValue + 1
		local var11 = t[var10]
		t[var10] = nil
		local var12 = t_1[var10]
		t_1[var10] = nil
		var1.release(var12)
		p0Count -= 1
		var4.emit({
			type = dataSourceChangeTypeModule.Remove,
			index = p0Count,
			keys = { var12 }
		}, p0Count)
		
		return var11
	end
	
	function t_2.setItem(value, p8)
		-- upvalues: p0Count (write), var3 (write), maxValue (write), t_1 (write), var1 (ref), t (write), var4 (ref), dataSourceChangeTypeModule (copy)
		assert(value >= 1 and value <= p0Count, "DataSource.deque: setItem index out of range")
		local var10 = (var3 + value - 2) % maxValue + 1
		local var11 = t_1[var10]
		var1.assertPreserved(var11, p8, value)
		t[var10] = p8
		var4.emit({
			type = dataSourceChangeTypeModule.Update,
			keys = { var11 }
		}, p0Count)
	end
	
	return t_2
end