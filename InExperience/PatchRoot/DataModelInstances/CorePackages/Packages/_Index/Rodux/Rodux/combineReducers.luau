return function(p0)
	return function(p1, p2)
		-- upvalues: p0 (ref)
		if p1 == nil then
			p1 = {}
		end
		local t = {}
		
		for i, v in pairs(p0) do
			t[i] = v(p1[i], p2)
		end
		return t
	end
end