return function(p1)
	return function(p2, p3)
		-- upvalues: p1 (ref)
		if p2 == nil then
			p2 = {}
		end
		local t = {}
		
		for i, v in pairs(p1) do
			t[i] = v(p2[i], p3)
		end
		return t
	end
end