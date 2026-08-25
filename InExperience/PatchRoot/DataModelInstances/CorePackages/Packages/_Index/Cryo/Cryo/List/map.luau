return function(p0, p1)
	local t = {}
	
	for i = 1, #p0 do
		t[i] = p1(p0[i], i)
	end
	return t
end