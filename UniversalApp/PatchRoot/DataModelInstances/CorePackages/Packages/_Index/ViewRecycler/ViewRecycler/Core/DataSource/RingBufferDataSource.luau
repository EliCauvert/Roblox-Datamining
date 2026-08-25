local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Types)
local itemKeyRegistryModule = require(script.Parent.ItemKeyRegistry)
local mutationControllerModule = require(script.Parent.MutationController)

local function getItems(p0, p1, p2, p3)
	local list = table.create(math.max(0, p3 - p2 + 1))
	
	for i = p2, math.min(p3, p0) do
		table.insert(list, p1(i))
	end
	return list
end

return function(p4, p5, p6)
	-- upvalues: itemKeyRegistryModule (ref), mutationControllerModule (ref), getItems (ref), dataSourceChangeTypeModule (ref)
	assert(p4 > 0 and p4 % 1 == 0, "DataSource.ringBuffer: capacity must be a positive integer")
	p5 = p5 or {}
	assert(#p5 <= p4, "DataSource.ringBuffer: initial values exceed capacity")
	local t = {}
	local t_1 = {}
	local var9 = itemKeyRegistryModule.create(p6, "DataSource.ringBuffer")
	local var10 = var9.rebuild(p5)
	local var11 = 1
	local p5Count = #p5
	
	for i, v in p5 do
		t[i] = v
		t_1[i] = var10[i]
	end
	local var13 = mutationControllerModule(function()
		-- upvalues: p5Count (write)
		return p5Count
	end, function()
		-- upvalues: t (write), t_1 (write), var11 (write), p5Count (write), var9 (ref)
		return {
			values = table.clone(t),
			keys = table.clone(t_1),
			head = var11,
			count = p5Count,
			keyRegistry = var9.snapshot()
		}
	end, function(p7)
		-- upvalues: t (write), t_1 (write), var11 (write), p5Count (write), var9 (ref)
		t = p7.values
		t_1 = p7.keys
		var11 = p7.head
		p5Count = p7.count
		var9.restore(p7.keyRegistry)
	end)
	
	local function _(p8)
		-- upvalues: var11 (write), p4 (ref)
		return (var11 + p8 - 2) % p4 + 1
	end
	
	local var14 = nil
	
	return {
		getItemCount = function()
			-- upvalues: p5Count (write)
			return p5Count
		end,
		getItem = function(p9)
			-- upvalues: t (write), var11 (write), p4 (ref)
			return t[(var11 + p9 - 2) % p4 + 1]
		end,
		getItemKey = function(p10)
			-- upvalues: t_1 (write), var11 (write), p4 (ref)
			return t_1[(var11 + p10 - 2) % p4 + 1]
		end,
		getItems = function(p11, p12)
			-- upvalues: getItems (copy), p5Count (write), var14 (write)
			return getItems(p5Count, var14.getItem, p11, p12)
		end,
		subscribe = var13.subscribe,
		transaction = var13.transaction,
		push = function(p13)
			-- upvalues: p5Count (write), p4 (ref), var11 (write), t_1 (write), var9 (ref), t (write), var13 (ref), dataSourceChangeTypeModule (copy)
			if p5Count == p4 then
				local var15 = var11
				local var16 = t_1[var15]
				local var17 = var9.replace(var16, p13, p4)
				t[var15] = p13
				t_1[var15] = var17
				var11 = var11 % p4 + 1
				var13.emitMany({
					{
						index = 1,
						type = dataSourceChangeTypeModule.Remove,
						keys = { var16 }
					},
					{
						type = dataSourceChangeTypeModule.Insert,
						index = p4,
						keys = { var17 }
					}
				}, p5Count)
				
				return
			end
			local var18 = var9.claim(p13, p5Count + 1)
			local var19 = (var11 + (p5Count + 1) - 2) % p4 + 1
			t[var19] = p13
			t_1[var19] = var18
			p5Count += 1
			var13.emit({
				type = dataSourceChangeTypeModule.Insert,
				index = p5Count,
				keys = { var18 }
			}, p5Count)
		end,
		clear = function()
			-- upvalues: p5Count (write), t (write), t_1 (write), var9 (ref), var11 (write), var13 (ref), dataSourceChangeTypeModule (copy)
			if p5Count == 0 then
				return
			end
			t = {}
			t_1 = {}
			var9.clear()
			var11 = 1
			p5Count = 0
			var13.emit({ type = dataSourceChangeTypeModule.Reset, keys = {} }, p5Count)
		end
	}
end