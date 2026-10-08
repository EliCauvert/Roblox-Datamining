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

return function(p5, p6, p7)
	-- upvalues: itemKeyRegistryModule (ref), mutationControllerModule (ref), getItems (ref), dataSourceChangeTypeModule (ref)
	assert(p5 > 0 and p5 % 1 == 0, "DataSource.ringBuffer: capacity must be a positive integer")
	p6 = p6 or {}
	assert(#p6 <= p5, "DataSource.ringBuffer: initial values exceed capacity")
	local t = {}
	local t_1 = {}
	local var1 = itemKeyRegistryModule.create(p7, "DataSource.ringBuffer")
	local var2 = var1.rebuild(p6)
	local var3 = 1
	local p5Count = #p6
	
	for i, v in p6 do
		t[i] = v
		t_1[i] = var2[i]
	end
	local var4 = mutationControllerModule(function()
		-- upvalues: p5Count (write)
		return p5Count
	end, function()
		-- upvalues: t (write), t_1 (write), var3 (write), p5Count (write), var1 (ref)
		return {
			values = table.clone(t),
			keys = table.clone(t_1),
			head = var3,
			count = p5Count,
			keyRegistry = var1.snapshot()
		}
	end, function(p8)
		-- upvalues: t (write), t_1 (write), var3 (write), p5Count (write), var1 (ref)
		t = p8.values
		t_1 = p8.keys
		var3 = p8.head
		p5Count = p8.count
		var1.restore(p8.keyRegistry)
	end)
	
	local function _(p8)
		-- upvalues: var3 (write), p5 (ref)
		return (var3 + p8 - 2) % p5 + 1
	end
	
	local var5 = nil
	
	return {
		getItemCount = function()
			-- upvalues: p5Count (write)
			return p5Count
		end,
		getItem = function(p8)
			-- upvalues: t (write), var3 (write), p5 (ref)
			return t[(var3 + p8 - 2) % p5 + 1]
		end,
		getItemKey = function(p8)
			-- upvalues: t_1 (write), var3 (write), p5 (ref)
			return t_1[(var3 + p8 - 2) % p5 + 1]
		end,
		getItems = function(p8, p9)
			-- upvalues: getItems (copy), p5Count (write), var5 (write)
			return getItems(p5Count, var5.getItem, p8, p9)
		end,
		subscribe = var4.subscribe,
		transaction = var4.transaction,
		push = function(p8)
			-- upvalues: p5Count (write), p5 (ref), var3 (write), t_1 (write), var1 (ref), t (write), var4 (ref), dataSourceChangeTypeModule (copy)
			if p5Count == p5 then
				local var6 = var3
				local var7 = t_1[var6]
				local var8 = var1.replace(var7, p8, p5)
				t[var6] = p8
				t_1[var6] = var8
				var3 = var3 % p5 + 1
				var4.emitMany({
					{
						index = 1,
						type = dataSourceChangeTypeModule.Remove,
						keys = { var7 }
					},
					{
						type = dataSourceChangeTypeModule.Insert,
						index = p5,
						keys = { var8 }
					}
				}, p5Count)
				
				return
			end
			local var9 = var1.claim(p8, p5Count + 1)
			local var10 = (var3 + (p5Count + 1) - 2) % p5 + 1
			t[var10] = p8
			t_1[var10] = var9
			p5Count += 1
			var4.emit({
				type = dataSourceChangeTypeModule.Insert,
				index = p5Count,
				keys = { var9 }
			}, p5Count)
		end,
		clear = function()
			-- upvalues: p5Count (write), t (write), t_1 (write), var1 (ref), var3 (write), var4 (ref), dataSourceChangeTypeModule (copy)
			if p5Count == 0 then
				return
			end
			t = {}
			t_1 = {}
			var1.clear()
			var3 = 1
			p5Count = 0
			var4.emit({ type = dataSourceChangeTypeModule.Reset, keys = {} }, p5Count)
		end
	}
end