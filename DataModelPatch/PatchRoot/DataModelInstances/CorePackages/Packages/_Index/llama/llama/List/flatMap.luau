local function flatMap(p1, Callback)
	-- upvalues: flatMap (copy)
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local ValueType1 = type(Callback)
	assert(ValueType1 == "function", "expected a function for second argument, got " .. ValueType1)
	local t = {}
	local Count = 1
	
	for i = 1, #p1 do
		if type(p1[i]) == "table" then
			local FlatMapResult = flatMap(p1[i], Callback)
			
			for i1 = 1, #FlatMapResult do
				t[Count] = FlatMapResult[i1]
				Count += 1
			end
		else
			local CallbackResult = Callback(p1[i], i)
			
			if CallbackResult ~= nil then
				t[Count] = CallbackResult
				Count += 1
			end
		end
	end
	return t
end

return flatMap