return function(p1, ...)
	local t = {}
	
	for i, v in pairs(p1) do
		t[i] = true
	end
	for i_1 = 1, select("#", ...) do
		t[select(i_1, ...)] = true
	end
	return t
end