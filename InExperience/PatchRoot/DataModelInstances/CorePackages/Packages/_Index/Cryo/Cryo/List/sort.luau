return function(p0, p1)
	local t = {}
	
	for i = 1, #p0 do
		t[i] = p0[i]
	end
	table.sort(t, p1)
	
	return t
end