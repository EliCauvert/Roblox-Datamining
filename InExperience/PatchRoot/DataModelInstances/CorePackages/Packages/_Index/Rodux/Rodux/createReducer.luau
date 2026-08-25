return function(p0, p1)
	return function(p2, p3)
		-- upvalues: p0 (ref), p1 (ref)
		if p2 == nil then
			p2 = p0
		end
		local type = p1[p3.type]
		
		return if type then type(p2, p3) else p2
	end
end