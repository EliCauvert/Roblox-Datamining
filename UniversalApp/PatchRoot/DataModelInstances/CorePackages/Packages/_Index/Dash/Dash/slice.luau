local insert = table.insert

return function(p1, p2, p3)
	-- upvalues: insert (ref)
	local t = {}
	p2 = p2 or 1
	local var1 = p3 or #p1
	
	if p2 < 0 then
		p2 = #p1 + p2
	end
	if var1 and var1 < 0 then
		var1 = #p1 + var1
	end
	for i = p2, var1 do
		insert(t, p1[i])
	end
	return t
end