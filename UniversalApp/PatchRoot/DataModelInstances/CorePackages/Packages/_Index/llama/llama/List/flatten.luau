local function flatten(p1)
	-- upvalues: flatten (copy)
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local t = {}
	local Count = 1
	
	for i = 1, #p1 do
		if type(p1[i]) ~= "table" then
			t[Count] = p1[i]
			Count += 1
			continue
		end
		local FlattenResult = flatten(p1[i])
		
		for i1 = 1, #FlattenResult do
			t[Count] = FlattenResult[i1]
			Count += 1
		end
	end
	return t
end

return flatten