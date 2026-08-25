local insert = table.insert

return function(p0, p1, p2)
	-- upvalues: insert (ref)
	local t = {}
	p1 = p1 or 1
	local var2 = p2 or #p0
	
	if p1 < 0 then
		p1 = #p0 + p1
	end
	if var2 and var2 < 0 then
		var2 = #p0 + var2
	end
	for i = p1, var2 do
		insert(t, p0[i])
	end
	return t
end