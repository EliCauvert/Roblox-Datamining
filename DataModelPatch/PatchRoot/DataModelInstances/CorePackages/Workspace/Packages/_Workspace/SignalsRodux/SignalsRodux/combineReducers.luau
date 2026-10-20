local _ = require(script.Parent.types)

return function(p1)
	return function(p2, p3, p4)
		-- upvalues: p1 (copy)
		local T = if p2 == nil then {} else p2
		local t = {}
		local Flag = false
		
		for i, value in p1 do
			local Entry = T[i]
			local v1 = value(Entry, p3, p4)
			t[i] = v1
			
			if v1 ~= Entry then
				Flag = true
			end
		end
		return if Flag then t else T
	end
end