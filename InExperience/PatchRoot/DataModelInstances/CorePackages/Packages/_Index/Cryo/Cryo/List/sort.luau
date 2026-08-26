return function(p1, p2)
	local t = {}
	
	for i = 1, #p1 do
		t[i] = p1[i]
	end
	table.sort(t, p2)
	
	return t
end