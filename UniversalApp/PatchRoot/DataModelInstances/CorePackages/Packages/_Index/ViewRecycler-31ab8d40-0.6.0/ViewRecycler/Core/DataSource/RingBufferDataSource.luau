local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Types)
local itemKeyRegistryModule = require(script.Parent.ItemKeyRegistry)
local mutationControllerModule = require(script.Parent.MutationController)
local readDenseRangeModule = require(script.Parent.readDenseRange)

return function(p1, p2, p3)
	-- upvalues: itemKeyRegistryModule (ref), mutationControllerModule (ref), readDenseRangeModule (ref), dataSourceChangeTypeModule (ref)
	assert(p1 > 0 and p1 % 1 == 0, "DataSource.ringBuffer: capacity must be a positive integer")
	p2 = p2 or {}
	assert(#p2 <= p1, "DataSource.ringBuffer: initial values exceed capacity")
	local t = {}
	local t_1 = {}
	local var1 = itemKeyRegistryModule.create(p3, "DataSource.ringBuffer")
	local var2 = var1.rebuild(p2)
	local var3 = 1
	local p1Count = #p2
	
	for i, v in p2 do
		t[i] = v
		t_1[i] = var2[i]
	end
	local var4 = mutationControllerModule(function()
		-- upvalues: p1Count (write)
		return p1Count
	end, function()
		-- upvalues: t (write), t_1 (write), var3 (write), p1Count (write), var1 (ref)
		return {
			values = table.clone(t),
			keys = table.clone(t_1),
			head = var3,
			count = p1Count,
			keyRegistry = var1.snapshot()
		}
	end, function(p4)
		-- upvalues: t (write), t_1 (write), var3 (write), p1Count (write), var1 (ref)
		t = p4.values
		t_1 = p4.keys
		var3 = p4.head
		p1Count = p4.count
		var1.restore(p4.keyRegistry)
	end)
	
	local function _(p4)
		-- upvalues: var3 (write), p1 (ref)
		return (var3 + p4 - 2) % p1 + 1
	end
	
	local var5 = nil
	
	return {
		getItemCount = function()
			-- upvalues: p1Count (write)
			return p1Count
		end,
		getItem = function(p4)
			-- upvalues: t (write), var3 (write), p1 (ref)
			return t[(var3 + p4 - 2) % p1 + 1]
		end,
		getItemKey = function(p4)
			-- upvalues: t_1 (write), var3 (write), p1 (ref)
			return t_1[(var3 + p4 - 2) % p1 + 1]
		end,
		getItems = function(p4, p5)
			-- upvalues: readDenseRangeModule (copy), p1Count (write), var5 (write)
			return readDenseRangeModule(p1Count, var5.getItem, p4, p5)
		end,
		subscribe = var4.subscribe,
		transaction = var4.transaction,
		push = function(p4)
			-- upvalues: p1Count (write), p1 (ref), var3 (write), t_1 (write), var1 (ref), t (write), var4 (ref), dataSourceChangeTypeModule (copy)
			if p1Count == p1 then
				local var6 = var3
				local var7 = t_1[var6]
				local var8 = var1.replace(var7, p4, p1)
				t[var6] = p4
				t_1[var6] = var8
				var3 = var3 % p1 + 1
				var4.emitMany({
					{
						index = 1,
						type = dataSourceChangeTypeModule.Remove,
						keys = { var7 }
					},
					{
						type = dataSourceChangeTypeModule.Insert,
						index = p1,
						keys = { var8 }
					}
				}, p1Count)
				
				return
			end
			local var9 = var1.claim(p4, p1Count + 1)
			local var10 = (var3 + (p1Count + 1) - 2) % p1 + 1
			t[var10] = p4
			t_1[var10] = var9
			p1Count += 1
			var4.emit({
				type = dataSourceChangeTypeModule.Insert,
				index = p1Count,
				keys = { var9 }
			}, p1Count)
		end,
		clear = function()
			-- upvalues: p1Count (write), t (write), t_1 (write), var1 (ref), var3 (write), var4 (ref), dataSourceChangeTypeModule (copy)
			if p1Count == 0 then
				return
			end
			t = {}
			t_1 = {}
			var1.clear()
			var3 = 1
			p1Count = 0
			var4.emit({ type = dataSourceChangeTypeModule.Reset, keys = {} }, p1Count)
		end
	}
end