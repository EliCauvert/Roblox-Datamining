return function(...)
	local t = {}
	
	for i = 1, select("#", ...) do
		for i1, value in pairs(select(i, ...)) do
			t[i1] = value
		end
	end
	return t
end