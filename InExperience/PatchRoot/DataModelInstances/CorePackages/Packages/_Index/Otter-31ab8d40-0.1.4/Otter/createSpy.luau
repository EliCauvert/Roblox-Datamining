return function(p0)
	local t = { callCount = 0, valuesLength = 0, values = {} }
	
	function t.value(...)
		-- upvalues: t (ref), p0 (ref)
		t.callCount += 1
		t.values = { ... }
		t.valuesLength = select("#", ...)
		
		if p0 == nil then
			return
		end
		return p0(...)
	end
	
	function t.assertCalledWith(_, ...)
		-- upvalues: t (ref)
		local var1 = select("#", ...)
		assert(t.valuesLength, var1, "length of expected values differs from stored values")
		
		for i = 1, var1 do
			assert(t.values[i], select(i, ...), "value differs")
		end
	end
	
	setmetatable(t, {
		__index = function(_, p1)
			error(("%q is not a valid member of spy"):format(p1))
		end
	})
	
	return t
end