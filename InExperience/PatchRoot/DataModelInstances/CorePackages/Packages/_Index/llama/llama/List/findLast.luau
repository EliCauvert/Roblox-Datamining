return function(p1, p2, p3): number?
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local P2 = p3 or #p1
	for i = P2, 1, -1 do
		if p1[i] == p2 then
			return i
		end
	end
	return nil
end