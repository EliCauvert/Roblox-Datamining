return function(p1)
	return function(p2, p3)
		-- upvalues: p1 (copy)
		if p2 == nil then
			p2 = {}
		end
		local t = {}
		
		for i, value in pairs(p1) do
			t[i] = value(p2[i], p3)
		end
		return t
	end
end