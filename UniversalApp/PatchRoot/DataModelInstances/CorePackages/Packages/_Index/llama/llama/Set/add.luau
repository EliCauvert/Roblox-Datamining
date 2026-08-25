return function(p0, ...)
	local t = {}
	
	for i, v in pairs(p0) do
		t[i] = true
	end
	for i_1 = 1, select("#", ...) do
		t[select(i_1, ...)] = true
	end
	return t
end