return function(p0) --[[ line: 8 | named "createSpy" ]]
	local t = { callCount = 0, valuesLength = 0, values = {} }
	
	function t.value(...) --[[ line: 15 ]]
		-- upvalues: t (ref), p0 (ref)
		t.callCount += 1
		t.values = { ... }
		t.valuesLength = select("#", ...)
		
		if p0 == nil then
			return
		end
		return p0(...)
	end
	
	function t.assertCalledWith(_, ...) --[[ line: 27 ]]
		-- upvalues: t (ref)
		local var1 = select("#", ...)
		
		if t.valuesLength ~= var1 then
			error(("Expected %d arguments, but was called with %d arguments"):format(t.valuesLength, var1), 2)
		end
		for i = 1, var1 do
			local var2 = select(i, ...)
			assert(t.values[i] == var2, "value differs; got " .. tostring(t.values[i]) .. ", expected " .. tostring(var2))
		end
	end
	
	function t.captureValues(_, ...) --[[ line: 44 ]]
		-- upvalues: t (ref)
		local var3 = select("#", ...)
		local t_1 = {}
		assert(t.valuesLength == var3, "length of expected values differs from stored values")
		
		for i = 1, var3 do
			t_1[select(i, ...)] = t.values[i]
		end
		return t_1
	end
	
	setmetatable(t, {
		__index = function(_, p1) --[[ line: 59 ]]
			error(("%q is not a valid member of spy"):format(p1))
		end
	})
	
	return t
end