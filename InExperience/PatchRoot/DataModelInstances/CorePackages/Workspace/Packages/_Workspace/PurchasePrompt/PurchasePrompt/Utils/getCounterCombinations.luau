return function(p0, p1, p2, p3, p4)
	local t = {}
	
	if p3 == nil then
		table.insert(t, p0 .. p1 .. p2)
	else
		table.insert(t, p0 .. p3 .. p1 .. p2)
	end
	if p4 ~= nil then
		local var1 = tostring(p4)
		
		if p3 ~= nil then
			table.insert(t, p0 .. p3 .. p1 .. var1 .. p2)
			
			return t
		end
		table.insert(t, p0 .. p1 .. var1 .. p2)
	end
	return t
end