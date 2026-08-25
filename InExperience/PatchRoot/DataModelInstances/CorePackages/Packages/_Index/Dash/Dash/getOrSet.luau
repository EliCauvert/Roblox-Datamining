return function(value, p0, p1)
	if value[p0] == nil then
		value[p0] = p1(value, p0)
	end
	return value[p0]
end