local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Types)
local itemKeyRegistryModule = require(script.Parent.ItemKeyRegistry)
local mutationControllerModule = require(script.Parent.MutationController)

return function(p1, p2)
	-- upvalues: itemKeyRegistryModule (ref), mutationControllerModule (ref), dataSourceChangeTypeModule (ref)
	local cloned = table.clone(p1 or {})
	local var1 = itemKeyRegistryModule.create(p2, "DataSource.sequence")
	local var2 = var1.rebuild(cloned)
	local var3 = mutationControllerModule(function()
		-- upvalues: cloned (write)
		return #cloned
	end, function()
		-- upvalues: cloned (write), var2 (write), var1 (ref)
		return {
			values = table.clone(cloned),
			keys = table.clone(var2),
			keyRegistry = var1.snapshot()
		}
	end, function(p3)
		-- upvalues: cloned (write), var2 (write), var1 (ref)
		cloned = p3.values
		var2 = p3.keys
		var1.restore(p3.keyRegistry)
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
		getItemKey = function(p3)
			-- upvalues: var2 (write)
			return var2[p3]
		end,
		getItems = function(p3, p4)
			-- upvalues: cloned (write)
			return table.move(cloned, p3, p4, 1, {})
		end,
		subscribe = var3.subscribe,
		transaction = var3.transaction
	}
	
	function t.append(p3)
		-- upvalues: t (write), cloned (write)
		t.insert(#cloned + 1, p3)
	end
	
	function t.prepend(p3)
		-- upvalues: t (write)
		t.insert(1, p3)
	end
	
	function t.insert(p3, p4)
		-- upvalues: cloned (write), var1 (ref), var2 (write), var3 (ref), dataSourceChangeTypeModule (copy)
		local clonedCount = #cloned
		assert(p3 >= 1 and p3 <= clonedCount + 1, "DataSource.sequence: insert index out of range")
		local var4 = var1.claim(p4, p3)
		table.insert(cloned, p3, p4)
		table.insert(var2, p3, var4)
		var3.emit({
			type = dataSourceChangeTypeModule.Insert,
			index = p3,
			keys = { var4 }
		}, clonedCount)
	end
	
	function t.remove(p3, p4)
		-- upvalues: cloned (write), var2 (write), var1 (ref), var3 (ref), dataSourceChangeTypeModule (copy)
		local clonedCount = #cloned
		p4 = p4 or 1
		assert(p4 > 0 and (p3 >= 1 and p3 + p4 - 1 <= clonedCount), "DataSource.sequence: remove range out of range")
		local list = table.create(p4)
		
		for i = 1, p4 do
			table.remove(cloned, p3)
			local removed = table.remove(var2, p3)
			list[i] = removed
			var1.release(removed)
		end
		var3.emit({
			type = dataSourceChangeTypeModule.Remove,
			index = p3,
			keys = list
		}, clonedCount)
	end
	
	function t.setItem(value, p5)
		-- upvalues: cloned (write), var2 (write), var1 (ref), var3 (ref), dataSourceChangeTypeModule (copy)
		local clonedCount = #cloned
		assert(value >= 1 and value <= clonedCount, "DataSource.sequence: setItem index out of range")
		local var4 = var2[value]
		var1.assertPreserved(var4, p5, value)
		cloned[value] = p5
		var3.emit({
			type = dataSourceChangeTypeModule.Update,
			keys = { var4 }
		}, clonedCount)
	end
	
	function t.moveItem(p5, p6)
		-- upvalues: cloned (write), var2 (write), var3 (ref), dataSourceChangeTypeModule (copy)
		local clonedCount = #cloned
		assert(p5 >= 1 and p5 <= clonedCount, "DataSource.sequence: moveItem source index out of range")
		assert(p6 >= 1 and p6 <= clonedCount, "DataSource.sequence: moveItem destination index out of range")
		
		if p5 == p6 then
			return
		end
		local removed = table.remove(var2, p5)
		table.insert(cloned, p6, table.remove(cloned, p5))
		table.insert(var2, p6, removed)
		var3.emit({
			type = dataSourceChangeTypeModule.Move,
			fromIndex = p5,
			toIndex = p6,
			key = removed
		}, clonedCount)
	end
	
	function t.reorder(p5)
		-- upvalues: cloned (write), var2 (write), var3 (ref), dataSourceChangeTypeModule (copy)
		local clonedCount = #cloned
		assert(#p5 == clonedCount, "DataSource.sequence: reorder must contain every key")
		local t = {}
		
		for i, v in var2 do
			t[v] = cloned[i]
		end
		local list = table.create(clonedCount)
		local list_1 = table.create(clonedCount)
		local t_1 = {}
		
		for i_1, v_1 in p5 do
			assert(t[v_1] ~= nil and t_1[v_1] == nil, "DataSource.sequence: reorder must contain every key once")
			t_1[v_1] = true
			list[i_1] = t[v_1]
			list_1[i_1] = v_1
		end
		cloned = list
		var2 = list_1
		var3.emit({
			type = dataSourceChangeTypeModule.Reorder,
			keys = table.clone(list_1)
		}, clonedCount)
	end
	
	function t.replaceItems(p6, p7, p8)
		-- upvalues: cloned (write), var3 (ref), t (write), var1 (ref), var2 (write), dataSourceChangeTypeModule (copy)
		assert(p6 >= 1 and (p6 <= p7 and p7 <= #cloned), "DataSource.sequence: replaceItems range out of range")
		var3.transaction(function()
			-- upvalues: t (copy), p6 (ref), p7 (ref), p8 (ref), cloned (copy), var1 (copy), var2 (copy), var3 (copy), dataSourceChangeTypeModule (copy)
			t.remove(p6, p7 - p6 + 1)
			
			if #p8 == 0 then return end
			local clonedCount = #cloned
			local list = table.create(#p8)
			
			for i, v in p8 do
				list[i] = var1.claim(v, p6 + i - 1)
			end
			local list_1 = table.create(clonedCount + #p8)
			local list_2 = table.create(clonedCount + #p8)
			
			if p6 > 1 then
				table.move(cloned, 1, p6 - 1, 1, list_1)
				table.move(var2, 1, p6 - 1, 1, list_2)
			end
			for i_1, v_1 in p8 do
				local var4 = p6 + i_1 - 1
				list_1[var4] = v_1
				list_2[var4] = list[i_1]
			end
			if p6 <= clonedCount then
				table.move(cloned, p6, clonedCount, p6 + #p8, list_1)
				table.move(var2, p6, clonedCount, p6 + #p8, list_2)
			end
			cloned = list_1
			var2 = list_2
			var3.emit({
				type = dataSourceChangeTypeModule.Insert,
				index = p6,
				keys = list
			}, clonedCount)
		end)
	end
	
	function t.reset(value)
		-- upvalues: cloned (write), var1 (ref), var2 (write), var3 (ref), dataSourceChangeTypeModule (copy)
		local clonedCount = #cloned
		local cloned_1 = table.clone(value)
		local var5 = var1.rebuild(cloned_1)
		cloned = cloned_1
		var2 = var5
		var3.emit({
			type = dataSourceChangeTypeModule.Reset,
			keys = table.clone(var5)
		}, clonedCount)
	end
	
	return t
end