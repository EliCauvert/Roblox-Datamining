return function(p1, p2)
	local t = {}
	
	for i = 1, #p1 do
		t[i] = p2(p1[i], i)
	end
	return t
end