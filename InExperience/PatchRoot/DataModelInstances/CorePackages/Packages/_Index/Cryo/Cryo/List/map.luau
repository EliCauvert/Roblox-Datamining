return function(p0, p1) --[[ line: 4 | named "map" ]]
	local t = {}
	
	for i = 1, #p0 do
		t[i] = p1(p0[i], i)
	end
	return t
end