local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Types)
local itemKeyRegistryModule = require(script.Parent.ItemKeyRegistry)
local mutationControllerModule = require(script.Parent.MutationController)

return function(p0, p1)
	-- upvalues: itemKeyRegistryModule (ref), mutationControllerModule (ref), dataSourceChangeTypeModule (ref)
	local cloned = table.clone(p0 or {})
	local var5 = itemKeyRegistryModule.create(p1, "DataSource.sequence")
	local var6 = var5.rebuild(cloned)
	local var7 = mutationControllerModule(function()
		-- upvalues: cloned (write)
		return #cloned
	end, function()
		-- upvalues: cloned (write), var6 (write), var5 (ref)
		return {
			values = table.clone(cloned),
			keys = table.clone(var6),
			keyRegistry = var5.snapshot()
		}
	end, function(p2)
		-- upvalues: cloned (write), var6 (write), var5 (ref)
		cloned = p2.values
		var6 = p2.keys
		var5.restore(p2.keyRegistry)
	end)
	local _ = nil
	local t = {
		getItemCount = function()
			-- upvalues: cloned (write)
			return #cloned
		end,
		getItem = function(p3)
			-- upvalues: cloned (write)
			return cloned[p3]
		end,
		getItemKey = function(p4)
			-- upvalues: var6 (write)
			return var6[p4]
		end,
		getItems = function(p5, p6)
			-- upvalues: cloned (write)
			return table.move(cloned, p5, p6, 1, {})
		end,
		subscribe = var7.subscribe,
		transaction = var7.transaction
	}
	
	function t.append(p7)
		-- upvalues: t (write), cloned (write)
		t.insert(#cloned + 1, p7)
	end
	
	function t.prepend(p8)
		-- upvalues: t (write)
		t.insert(1, p8)
	end
	
	function t.insert(p9, p10)
		-- upvalues: cloned (write), var5 (ref), var6 (write), var7 (ref), dataSourceChangeTypeModule (copy)
		local clonedCount = #cloned
		assert(p9 >= 1 and p9 <= clonedCount + 1, "DataSource.sequence: insert index out of range")
		local var10 = var5.claim(p10, p9)
		table.insert(cloned, p9, p10)
		table.insert(var6, p9, var10)
		var7.emit({
			type = dataSourceChangeTypeModule.Insert,
			index = p9,
			keys = { var10 }
		}, clonedCount)
	end
	
	function t.remove(p11, p12)
		-- upvalues: cloned (write), var6 (write), var5 (ref), var7 (ref), dataSourceChangeTypeModule (copy)
		local clonedCount = #cloned
		p12 = p12 or 1
		assert(p12 > 0 and (p11 >= 1 and p11 + p12 - 1 <= clonedCount), "DataSource.sequence: remove range out of range")
		local list = table.create(p12)
		
		for i = 1, p12 do
			table.remove(cloned, p11)
			local removed = table.remove(var6, p11)
			list[i] = removed
			var5.release(removed)
		end
		var7.emit({
			type = dataSourceChangeTypeModule.Remove,
			index = p11,
			keys = list
		}, clonedCount)
	end
	
	function t.setItem(value, p13)
		-- upvalues: cloned (write), var6 (write), var5 (ref), var7 (ref), dataSourceChangeTypeModule (copy)
		local clonedCount = #cloned
		assert(value >= 1 and value <= clonedCount, "DataSource.sequence: setItem index out of range")
		local var16 = var6[value]
		var5.assertPreserved(var16, p13, value)
		cloned[value] = p13
		var7.emit({
			type = dataSourceChangeTypeModule.Update,
			keys = { var16 }
		}, clonedCount)
	end
	
	function t.moveItem(p14, p15)
		-- upvalues: cloned (write), var6 (write), var7 (ref), dataSourceChangeTypeModule (copy)
		local clonedCount = #cloned
		assert(p14 >= 1 and p14 <= clonedCount, "DataSource.sequence: moveItem source index out of range")
		assert(p15 >= 1 and p15 <= clonedCount, "DataSource.sequence: moveItem destination index out of range")
		
		if p14 == p15 then
			return
		end
		local removed = table.remove(var6, p14)
		table.insert(cloned, p15, table.remove(cloned, p14))
		table.insert(var6, p15, removed)
		var7.emit({
			type = dataSourceChangeTypeModule.Move,
			fromIndex = p14,
			toIndex = p15,
			key = removed
		}, clonedCount)
	end
	
	function t.reorder(p16)
		-- upvalues: cloned (write), var6 (write), var7 (ref), dataSourceChangeTypeModule (copy)
		local clonedCount = #cloned
		assert(#p16 == clonedCount, "DataSource.sequence: reorder must contain every key")
		local t = {}
		
		for i, v in var6 do
			t[v] = cloned[i]
		end
		local list = table.create(clonedCount)
		local list_1 = table.create(clonedCount)
		local t_1 = {}
		
		for i_1, v_1 in p16 do
			assert(t[v_1] ~= nil and t_1[v_1] == nil, "DataSource.sequence: reorder must contain every key once")
			t_1[v_1] = true
			list[i_1] = t[v_1]
			list_1[i_1] = v_1
		end
		cloned = list
		var6 = list_1
		var7.emit({
			type = dataSourceChangeTypeModule.Reorder,
			keys = table.clone(list_1)
		}, clonedCount)
	end
	
	function t.replaceItems(p17, p18, p19)
		-- upvalues: cloned (write), var7 (ref), t (write), var5 (ref), var6 (write), dataSourceChangeTypeModule (copy)
		assert(p17 >= 1 and (p17 <= p18 and p18 <= #cloned), "DataSource.sequence: replaceItems range out of range")
		var7.transaction(function()
			-- upvalues: t (copy), p17 (ref), p18 (ref), p19 (ref), cloned (copy), var5 (copy), var6 (copy), var7 (copy), dataSourceChangeTypeModule (copy)
			t.remove(p17, p18 - p17 + 1)
			
			if #p19 == 0 then return end
			local clonedCount = #cloned
			local list = table.create(#p19)
			
			for i, v in p19 do
				list[i] = var5.claim(v, p17 + i - 1)
			end
			local list_1 = table.create(clonedCount + #p19)
			local list_2 = table.create(clonedCount + #p19)
			
			if p17 > 1 then
				table.move(cloned, 1, p17 - 1, 1, list_1)
				table.move(var6, 1, p17 - 1, 1, list_2)
			end
			for i_1, v_1 in p19 do
				local var28 = p17 + i_1 - 1
				list_1[var28] = v_1
				list_2[var28] = list[i_1]
			end
			if p17 <= clonedCount then
				table.move(cloned, p17, clonedCount, p17 + #p19, list_1)
				table.move(var6, p17, clonedCount, p17 + #p19, list_2)
			end
			cloned = list_1
			var6 = list_2
			var7.emit({
				type = dataSourceChangeTypeModule.Insert,
				index = p17,
				keys = list
			}, clonedCount)
		end)
	end
	
	function t.reset(value)
		-- upvalues: cloned (write), var5 (ref), var6 (write), var7 (ref), dataSourceChangeTypeModule (copy)
		local clonedCount = #cloned
		local cloned_1 = table.clone(value)
		local var31 = var5.rebuild(cloned_1)
		cloned = cloned_1
		var6 = var31
		var7.emit({
			type = dataSourceChangeTypeModule.Reset,
			keys = table.clone(var31)
		}, clonedCount)
	end
	
	return t
end