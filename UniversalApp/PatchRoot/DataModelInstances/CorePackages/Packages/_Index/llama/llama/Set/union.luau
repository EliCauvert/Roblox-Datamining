return function(...) --[[ line: 2 | named "union" ]]
	local t = {}
	
	for i_1 = 1, select("#", ...) do
		for i, v in pairs(select(i_1, ...)) do
			t[i] = true
		end
	end
	return t
end