return function(p0, p1)
	local t = {}
	
	if not p0 then
		return t
	end
	local var1 = p0[p1]
	
	if var1 then
		for i, v in var1 do
			table.insert(t, i)
		end
	end
	return t
end