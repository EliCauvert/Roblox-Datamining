local _ = require(script.Parent.types)
local t = {}

return {
	add = function(p0, p1)
		-- upvalues: t (write)
		local var1 = t[p0]
		
		if var1 == nil then
			var1 = {}
			t[p0] = var1
		end
		table.insert(var1, p1)
	end,
	remove = function(p2, p3)
		-- upvalues: t (write)
		local var2 = t[p2]
		
		if var2 == nil then return end
		for i, v in var2 do
			if v == p3 then
				table.remove(var2, i)
				break
			end
		end
		if #var2 == 0 then
			t[p2] = nil
		end
	end,
	clear = function()
		-- upvalues: t (write)
		t = {}
	end,
	snapshot = function()
		-- upvalues: t (write)
		if next(t) == nil then
			return nil
		end
		local t_1 = {}
		
		for i, v in t do
			local t_2 = {}
			
			for i_1 = #v, 1, -1 do
				table.insert(t_2, v[i_1])
			end
			t_1[i] = t_2
		end
		return t_1
	end
}