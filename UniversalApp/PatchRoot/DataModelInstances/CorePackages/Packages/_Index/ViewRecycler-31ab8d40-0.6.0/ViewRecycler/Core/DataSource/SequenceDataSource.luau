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
	local t = {}
	local var3 = 0
	
	local function _(p3)
		-- upvalues: var3 (write), t (ref)
		if var3 > 0 then
			table.insert(t, p3)
		end
	end
	
	local function undo(p3)
		-- upvalues: cloned (write), var2 (write), var1 (ref)
		local kind = p3.kind
		
		if kind == "insert" then
			table.remove(cloned, p3.index)
			table.remove(var2, p3.index)
			var1.release(p3.key)
			
			return
		elseif kind == "remove" then
			for i, v in p3.keys do
				table.insert(cloned, p3.index + i - 1, p3.values[i])
				table.insert(var2, p3.index + i - 1, v)
				var1.adopt(v)
			end
			return
		elseif kind == "set" then
			cloned[p3.index] = p3.value
			
			return
		elseif kind == "move" then
			local removed = table.remove(var2, p3.toIndex)
			table.insert(cloned, p3.fromIndex, table.remove(cloned, p3.toIndex))
			table.insert(var2, p3.fromIndex, removed)
			
			return
		end
		cloned = p3.values
		var2 = p3.keys
		
		if p3.keyRegistry ~= nil then
			var1.restore(p3.keyRegistry)
		end
	end
	
	local var4 = mutationControllerModule(function()
		-- upvalues: cloned (write)
		return #cloned
	end, function()
		-- upvalues: var3 (write), t (ref)
		var3 += 1
		
		return #t
	end, function(p4)
		-- upvalues: t (ref), undo (ref), var3 (write)
		for i = #t, p4 + 1, -1 do
			undo(t[i])
			t[i] = nil
		end
		var3 -= 1
		
		if var3 == 0 then
			table.clear(t)
		end
	end, function()
		-- upvalues: var3 (write), t (ref)
		var3 -= 1
		
		if var3 == 0 then
			table.clear(t)
		end
	end)
	local _ = nil
	local t_1 = {
		getItemCount = function()
			-- upvalues: cloned (write)
			return #cloned
		end,
		getItem = function(p5)
			-- upvalues: cloned (write)
			return cloned[p5]
		end,
		getItemKey = function(p5)
			-- upvalues: var2 (write)
			return var2[p5]
		end,
		getItems = function(p5, p6)
			-- upvalues: cloned (write)
			return table.move(cloned, p5, p6, 1, {})
		end,
		subscribe = var4.subscribe,
		transaction = var4.transaction
	}
	
	function t_1.append(p5)
		-- upvalues: t_1 (write), cloned (write)
		t_1.insert(#cloned + 1, p5)
	end
	
	function t_1.prepend(p5)
		-- upvalues: t_1 (write)
		t_1.insert(1, p5)
	end
	
	function t_1.insert(p5, p6)
		-- upvalues: cloned (write), var1 (ref), var2 (write), var3 (write), t (ref), var4 (ref), dataSourceChangeTypeModule (copy)
		local clonedCount = #cloned
		assert(p5 >= 1 and p5 <= clonedCount + 1, "DataSource.sequence: insert index out of range")
		local var5 = var1.claim(p6, p5)
		table.insert(cloned, p5, p6)
		table.insert(var2, p5, var5)
		local t_1 = { kind = "insert", index = p5, key = var5 }
		
		if var3 > 0 then
			table.insert(t, t_1)
		end
		var4.emit({
			type = dataSourceChangeTypeModule.Insert,
			index = p5,
			keys = { var5 }
		}, clonedCount)
	end
	
	function t_1.remove(p5, p6)
		-- upvalues: cloned (write), var2 (write), var1 (ref), var3 (write), t (ref), var4 (ref), dataSourceChangeTypeModule (copy)
		local clonedCount = #cloned
		p6 = p6 or 1
		assert(p6 > 0 and (p5 >= 1 and p5 + p6 - 1 <= clonedCount), "DataSource.sequence: remove range out of range")
		local list = table.create(p6)
		local list_1 = table.create(p6)
		
		for i = 1, p6 do
			list_1[i] = table.remove(cloned, p5)
			local removed = table.remove(var2, p5)
			list[i] = removed
			var1.release(removed)
		end
		local t_1 = {
			kind = "remove",
			index = p5,
			keys = list,
			values = list_1
		}
		
		if var3 > 0 then
			table.insert(t, t_1)
		end
		var4.emit({
			type = dataSourceChangeTypeModule.Remove,
			index = p5,
			keys = list
		}, clonedCount)
	end
	
	function t_1.setItem(value, p7)
		-- upvalues: cloned (write), var2 (write), var1 (ref), var3 (write), t (ref), var4 (ref), dataSourceChangeTypeModule (copy)
		local clonedCount = #cloned
		assert(value >= 1 and value <= clonedCount, "DataSource.sequence: setItem index out of range")
		local var5 = var2[value]
		var1.assertPreserved(var5, p7, value)
		local t_1 = { kind = "set", index = value, value = cloned[value] }
		
		if var3 > 0 then
			table.insert(t, t_1)
		end
		cloned[value] = p7
		var4.emit({
			type = dataSourceChangeTypeModule.Update,
			keys = { var5 }
		}, clonedCount)
	end
	
	function t_1.moveItem(p7, p8)
		-- upvalues: cloned (write), var2 (write), var3 (write), t (ref), var4 (ref), dataSourceChangeTypeModule (copy)
		local clonedCount = #cloned
		assert(p7 >= 1 and p7 <= clonedCount, "DataSource.sequence: moveItem source index out of range")
		assert(p8 >= 1 and p8 <= clonedCount, "DataSource.sequence: moveItem destination index out of range")
		
		if p7 == p8 then return end
		local removed = table.remove(var2, p7)
		table.insert(cloned, p8, table.remove(cloned, p7))
		table.insert(var2, p8, removed)
		local t_1 = { kind = "move", fromIndex = p7, toIndex = p8 }
		
		if var3 > 0 then
			table.insert(t, t_1)
		end
		var4.emit({
			type = dataSourceChangeTypeModule.Move,
			fromIndex = p7,
			toIndex = p8,
			key = removed
		}, clonedCount)
	end
	
	function t_1.reorder(p7)
		-- upvalues: cloned (write), var2 (write), var3 (write), t (ref), var4 (ref), dataSourceChangeTypeModule (copy)
		local clonedCount = #cloned
		assert(#p7 == clonedCount, "DataSource.sequence: reorder must contain every key")
		local t_1 = {}
		
		for i, v in var2 do
			t_1[v] = cloned[i]
		end
		local list = table.create(clonedCount)
		local list_1 = table.create(clonedCount)
		local t_2 = {}
		
		for i_1, v_1 in p7 do
			assert(t_1[v_1] ~= nil and t_2[v_1] == nil, "DataSource.sequence: reorder must contain every key once")
			t_2[v_1] = true
			list[i_1] = t_1[v_1]
			list_1[i_1] = v_1
		end
		local t_3 = { kind = "replace", values = cloned, keys = var2 }
		
		if var3 > 0 then
			table.insert(t, t_3)
		end
		cloned = list
		var2 = list_1
		var4.emit({
			type = dataSourceChangeTypeModule.Reorder,
			keys = table.clone(list_1)
		}, clonedCount)
	end
	
	function t_1.replaceItems(p8, p9, p10)
		-- upvalues: cloned (write), var4 (ref), t_1 (write), var2 (write), var1 (ref), var3 (write), t (ref), dataSourceChangeTypeModule (copy)
		assert(p8 >= 1 and (p8 <= p9 and p9 <= #cloned), "DataSource.sequence: replaceItems range out of range")
		var4.transaction(function()
			-- upvalues: t_1 (copy), p8 (ref), p9 (ref), p10 (ref), cloned (copy), var2 (copy), var1 (copy), var3 (copy), t (copy), var4 (copy), dataSourceChangeTypeModule (copy)
			t_1.remove(p8, p9 - p8 + 1)
			
			if #p10 == 0 then return end
			local clonedCount = #cloned
			local t_2 = {
				kind = "replace",
				values = cloned,
				keys = var2,
				keyRegistry = var1.snapshot()
			}
			
			if var3 > 0 then
				table.insert(t, t_2)
			end
			local list = table.create(#p10)
			
			for i, v in p10 do
				list[i] = var1.claim(v, p8 + i - 1)
			end
			local list_1 = table.create(clonedCount + #p10)
			local list_2 = table.create(clonedCount + #p10)
			
			if p8 > 1 then
				table.move(cloned, 1, p8 - 1, 1, list_1)
				table.move(var2, 1, p8 - 1, 1, list_2)
			end
			for i_1, v_1 in p10 do
				local var5 = p8 + i_1 - 1
				list_1[var5] = v_1
				list_2[var5] = list[i_1]
			end
			if p8 <= clonedCount then
				table.move(cloned, p8, clonedCount, p8 + #p10, list_1)
				table.move(var2, p8, clonedCount, p8 + #p10, list_2)
			end
			cloned = list_1
			var2 = list_2
			var4.emit({
				type = dataSourceChangeTypeModule.Insert,
				index = p8,
				keys = list
			}, clonedCount)
		end)
	end
	
	function t_1.reset(value)
		-- upvalues: cloned (write), var3 (write), var1 (ref), var2 (write), t (ref), var4 (ref), dataSourceChangeTypeModule (copy)
		local clonedCount = #cloned
		local cloned_1 = table.clone(value)
		local var6 = var1.rebuild(cloned_1)
		local t_1 = {
			kind = "replace",
			values = cloned,
			keys = var2,
			keyRegistry = if var3 > 0 then var1.snapshot() else nil
		}
		
		if var3 > 0 then
			table.insert(t, t_1)
		end
		cloned = cloned_1
		var2 = var6
		var4.emit({
			type = dataSourceChangeTypeModule.Reset,
			keys = table.clone(var6)
		}, clonedCount)
	end
	
	return t_1
end