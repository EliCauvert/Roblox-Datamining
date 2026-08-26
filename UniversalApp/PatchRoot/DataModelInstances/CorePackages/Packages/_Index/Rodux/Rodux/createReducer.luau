return function(p1, p2)
	return function(p3, p4)
		-- upvalues: p1 (ref), p2 (ref)
		if p3 == nil then
			p3 = p1
		end
		local type = p2[p4.type]
		
		return if type then type(p3, p4) else p3
	end
end