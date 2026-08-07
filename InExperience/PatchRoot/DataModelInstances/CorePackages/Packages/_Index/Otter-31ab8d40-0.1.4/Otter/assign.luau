return function(value, ...) --[[ line: 1 | named "assign" ]]
	for i_1 = 1, select("#", ...) do
		for i, v in pairs(select(i_1, ...)) do
			value[i] = v
		end
	end
	return value
end