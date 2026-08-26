return function(p1, p2, p3, p4, p5)
	local t = {}
	
	if p4 == nil then
		table.insert(t, p1 .. p1 .. p2)
	else
		table.insert(t, p1 .. p3 .. p1 .. p2)
	end
	if p5 ~= nil then
		local var1 = tostring(p5)
		
		if p4 ~= nil then
			table.insert(t, p1 .. p3 .. p1 .. var1 .. p2)
			
			return t
		end
		table.insert(t, p1 .. p1 .. var1 .. p2)
	end
	return t
end