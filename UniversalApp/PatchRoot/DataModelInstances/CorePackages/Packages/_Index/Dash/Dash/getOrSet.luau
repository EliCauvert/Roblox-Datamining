return function(value, p1, p2)
	if value[p1] == nil then
		value[p1] = p2(value, p1)
	end
	return value[p1]
end