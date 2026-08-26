return function(p1, p2)
	local t = {}
	
	if not p1 then
		return t
	end
	local var1 = p1[p2]
	
	if var1 then
		for i, v in var1 do
			table.insert(t, i)
		end
	end
	return t
end