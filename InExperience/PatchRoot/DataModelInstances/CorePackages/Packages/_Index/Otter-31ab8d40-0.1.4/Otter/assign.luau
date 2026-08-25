return function(value, ...)
	for i_1 = 1, select("#", ...) do
		for i, v in pairs(select(i_1, ...)) do
			value[i] = v
		end
	end
	return value
end