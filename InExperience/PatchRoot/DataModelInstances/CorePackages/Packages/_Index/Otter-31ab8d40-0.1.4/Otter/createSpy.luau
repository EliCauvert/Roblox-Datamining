return function(p0) --[[ line: 1 | named "createSpy" ]]
	local t = { callCount = 0, valuesLength = 0, values = {} }
	
	function t.value(...) --[[ line: 8 ]]
		-- upvalues: t (ref), p0 (ref)
		t.callCount += 1
		t.values = { ... }
		t.valuesLength = select("#", ...)
		
		if p0 == nil then
			return
		end
		return p0(...)
	end
	
	function t.assertCalledWith(_, ...) --[[ line: 18 ]]
		-- upvalues: t (ref)
		local var1 = select("#", ...)
		assert(t.valuesLength, var1, "length of expected values differs from stored values")
		
		for i = 1, var1 do
			assert(t.values[i], select(i, ...), "value differs")
		end
	end
	
	setmetatable(t, {
		__index = function(_, p1) --[[ line: 30 ]]
			error(("%q is not a valid member of spy"):format(p1))
		end
	})
	
	return t
end