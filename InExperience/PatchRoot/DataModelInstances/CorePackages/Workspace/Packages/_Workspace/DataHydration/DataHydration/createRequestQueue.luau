return function()
	local t = {}
	local var1 = 1
	
	return {
		push = function(p1)
			-- upvalues: t (ref), var1 (write)
			if t[p1] == nil then
				t[p1] = var1
				var1 += 1
			end
		end,
		pop = function(p1)
			-- upvalues: t (ref)
			local t_1 = {}
			
			for i, v in t do
				table.insert(t_1, i)
			end
			table.sort(t_1, function(p2, p3)
				-- upvalues: t (copy)
				return t[p2] < t[p3]
			end)
			
			if p1 >= #t_1 then
				table.clear(t)
				
				return t_1
			end
			local t_2 = {}
			
			for i_1 = 1, p1 do
				local var2 = t_1[i_1]
				table.insert(t_2, var2)
				t[var2] = nil
			end
			return t_2
		end,
		isEmpty = function()
			-- upvalues: t (ref)
			for i, v in t do
				return false
			end
			return true
		end,
		hasItem = function(p2)
			-- upvalues: t (ref)
			return t[p2] ~= nil
		end,
		clear = function()
			-- upvalues: t (ref), var1 (write)
			table.clear(t)
			var1 = 1
		end
	}
end