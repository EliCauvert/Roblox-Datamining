return function(Callback)
	local config = { callCount = 0, valuesLength = 0, values = {} }
	
	function config.value(...)
		-- upvalues: config (copy), Callback (copy)
		config.callCount += 1
		config.values = { ... }
		config.valuesLength = select("#", ...)
		
		if Callback == nil then return end
		return Callback(...)
	end
	
	function config:assertCalledWith(...)
		-- upvalues: config (copy)
		local Selected = select("#", ...)
		
		if config.valuesLength ~= Selected then
			error(("Expected %d arguments, but was called with %d arguments"):format(config.valuesLength, Selected), 2)
		end
		for i = 1, Selected do
			local Selected1 = select(i, ...)
			assert(config.values[i] == Selected1, "value differs; got " .. tostring(config.values[i]) .. ", expected " .. tostring(Selected1))
		end
	end
	
	function config:captureValues(...)
		-- upvalues: config (copy)
		local Selected = select("#", ...)
		local t = {}
		assert(config.valuesLength == Selected, "length of expected values differs from stored values")
		
		for i = 1, Selected do
			t[select(i, ...)] = config.values[i]
		end
		return t
	end
	
	setmetatable(config, {
		__index = function(_, p1)
			error(("%q is not a valid member of spy"):format(p1))
		end
	})
	
	return config
end