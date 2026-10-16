return function(Callback) --[[ Line: 1 | Named "createSpy" ]]
	local config = { callCount = 0, valuesLength = 0, values = {} }
	
	function config.value(...) --[[ Line: 8 ]]
		-- upvalues: config (copy), Callback (copy)
		config.callCount += 1
		config.values = { ... }
		config.valuesLength = select("#", ...)
		
		if Callback == nil then return end
		return Callback(...)
	end
	
	function config:assertCalledWith(...) --[[ Line: 18 ]]
		-- upvalues: config (copy)
		local Selected = select("#", ...)
		assert(config.valuesLength, Selected, "length of expected values differs from stored values")
		
		for i = 1, Selected do
			assert(config.values[i], select(i, ...), "value differs")
		end
	end
	
	setmetatable(config, {
		__index = function(_, p1) --[[ Line: 30 ]]
			error(("%q is not a valid member of spy"):format(p1))
		end
	})
	
	return config
end