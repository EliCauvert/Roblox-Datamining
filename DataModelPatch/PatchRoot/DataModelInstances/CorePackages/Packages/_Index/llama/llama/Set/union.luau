return function(...)
	local t = {}
	
	for i = 1, select("#", ...) do
		for i1, _ in pairs(select(i, ...)) do
			t[i1] = true
		end
	end
	return t
end