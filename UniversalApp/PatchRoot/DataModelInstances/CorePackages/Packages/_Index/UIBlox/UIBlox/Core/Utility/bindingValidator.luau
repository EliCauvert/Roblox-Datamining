return function(Callback) --[[ Line: 4 | Named "bindingValidator" ]]
	return function(p1): boolean --[[ Line: 5 ]]
		-- upvalues: Callback (copy)
		local Match: string? = string.match(tostring(p1), "RoactBinding")
		
		if typeof(p1) ~= "table" or not Match then
			warn(string.format("RoactBinding expected, got %s", (typeof(p1))))
			
			return false
		end
		local Success, Result = pcall(function() --[[ Line: 13 ]]
			-- upvalues: p1 (copy)
			return p1:getValue()
		end)
		
		if not Success then
			warn("getValue() not defined")
			
			return false
		end
		local CallbackResult, CallbackResult2 = Callback(Result)
		
		if CallbackResult then
			return true
		else
			warn(string.format("RoactBinding value: %s", CallbackResult2))
			
			return false
		end
	end
end