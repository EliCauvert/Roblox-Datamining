local _ = require(script:FindFirstAncestor("ViewRecycler").Core.Recycling.RecyclingScope)
local frozen = table.freeze({})
local frozen_1 = table.freeze({ entered = frozen, updated = frozen, departed = frozen })

return function(p1)
	-- upvalues: frozen_1 (ref), frozen (ref)
	local recyclingScope = p1.recyclingScope
	local prepareDesiredAssignment = p1.prepareDesiredAssignment
	local t = {}
	local t_1 = {}
	local var1 = false
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	
	local function makeAssignment(value, p2)
		-- upvalues: prepareDesiredAssignment (ref)
		if prepareDesiredAssignment == nil then
			return table.freeze({ key = value, value = p2 })
		end
		local var2 = prepareDesiredAssignment({ key = value, value = p2 })
		
		return table.freeze({ key = var2.key, value = var2.value })
	end
	
	local function _(p2)
		-- upvalues: t_1 (ref)
		local var2 = t_1[p2]
		
		if var2 == nil then
			var2 = table.freeze({ viewType = p2 })
			t_1[p2] = var2
		end
		return var2
	end
	
	local function apply(p2, p3)
		-- upvalues: var1 (write), t (ref), t_2 (ref), t_3 (ref), t_1 (ref), frozen_1 (copy), frozen (copy), recyclingScope (ref), makeAssignment (ref), t_4 (ref)
		assert(not var1, "SlotBinder: cannot apply after destruction")
		local t_5 = {}
		local var2 = false
		
		for i, v in p2 do
			local var3 = t[v]
			
			if var3 ~= nil then
				table.insert(t_5, var3.view)
				t_2[v] = true
				var2 = true
			end
		end
		local v_3
		local t_6 = {}
		local t_7 = {}
		local var4 = nil
		local var5 = #p3 > 1
		
		for i_1, v_1 in p3 do
			local key = v_1.key
			
			if var5 then
				if t_3[key] then
					table.clear(t_3)
					table.clear(t_2)
					error(`Virtualizer: duplicate key "{key}"`, 0)
				end
				t_3[key] = true
			end
			local var6 = t[key]
			v_3 = false
			
			if var6 ~= nil then
				v_3 = not (var2 and t_2[key])
			end
			if not v_3 or var6.viewType ~= v_1.viewType then
				if v_3 then
					table.insert(t_5, var6.view)
				end
				table.insert(t_7, v_1)
				local viewType = v_1.viewType
				local var7 = t_1[viewType]
				
				if var7 == nil then
					var7 = table.freeze({ viewType = viewType })
					t_1[viewType] = var7
				end
				table.insert(t_6, var7)
			elseif v_1.changed or var6.value ~= v_1.value then
				var4 = var4 or {}
				table.insert(var4, v_1)
			end
		end
		if var5 then
			table.clear(t_3)
		end
		if #t_5 == 0 and #t_6 == 0 and var4 == nil then
			return frozen_1
		end
		local var8 = frozen
		
		if #t_5 > 0 or #t_6 > 0 then
			local ok, status = pcall(recyclingScope.bind, { releases = t_5, requests = t_6 })
			
			if not ok then
				table.clear(t_2)
				error(status, 0)
			end
			var8 = status.acquired
		end
		if var2 then
			for v_1 in t_2 do
				t[v_1] = nil
			end
			table.clear(t_2)
		end
		local var9 = #t_5 > 0 and #t_7 > 0
		
		for i_3, v_2 in t_7 do
			v_3 = var8[i_3]
			v_2.view = v_3
			v_2.assignment = makeAssignment(v_2.key, v_2.value)
			t[v_2.key] = v_2
			
			if var9 then
				t_4[v_3] = true
			end
		end
		local var10 = frozen
		
		if var4 ~= nil then
			var10 = table.create(#var4)
			
			for i_4, v_3 in var4 do
				local key = t[v_3.key]
				key.value = v_3.value
				key.assignment = makeAssignment(v_3.key, v_3.value)
				var10[i_4] = key
			end
		end
		local var11 = frozen
		
		if #t_5 > 0 then
			if var9 then
				var11 = {}
				
				for v_3, v_4 in t_5 do
					if not t_4[v_4] then
						table.insert(var11, v_4)
					end
				end
				table.clear(t_4)
			else
				var11 = t_5
			end
		end
		return {
			entered = if #t_7 == 0 then frozen else t_7,
			updated = var10,
			departed = var11
		}
	end
	
	local function releaseAll()
		-- upvalues: t (ref), recyclingScope (ref)
		local t_1 = {}
		
		for i, v in t do
			table.insert(t_1, v.view)
		end
		table.clear(t)
		
		if #t_1 > 0 then
			recyclingScope.bind({ releases = t_1, requests = {} })
		end
		return t_1
	end
	
	return {
		apply = apply,
		sync = function(p4)
			-- upvalues: t (ref), apply (ref)
			local t_1 = {}
			
			for i, v in p4 do
				t_1[v.key] = true
			end
			local t_2 = {}
			
			for i_1 in t do
				if not t_1[i_1] then
					table.insert(t_2, i_1)
				end
			end
			return apply(t_2, p4)
		end,
		get = function(p5)
			-- upvalues: t (ref)
			return t[p5]
		end,
		releaseAll = function()
			-- upvalues: var1 (write), releaseAll (ref)
			assert(not var1, "SlotBinder: cannot release after destruction")
			
			return releaseAll()
		end,
		destroy = function()
			-- upvalues: var1 (write), releaseAll (ref)
			if var1 then
				return
			end
			releaseAll()
			var1 = true
		end
	}
end