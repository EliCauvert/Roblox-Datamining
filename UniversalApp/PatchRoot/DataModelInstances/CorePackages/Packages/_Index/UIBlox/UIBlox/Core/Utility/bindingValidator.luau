return function(p1)
	return function(p2)
		-- upvalues: p1 (ref)
		if typeof(p2) ~= "table" or not string.match(tostring(p2), "RoactBinding") then
			warn(string.format("RoactBinding expected, got %s", typeof(p2)))
			
			return false
		end
		local ok, status = pcall(function()
			-- upvalues: p2 (ref)
			return p2:getValue()
		end)
		
		if not ok then
			warn("getValue() not defined")
			
			return false
		end
		local var1, var2 = p1(status)
		
		if var1 then
			return true
		end
		warn(string.format("RoactBinding value: %s", var2))
		
		return false
	end
end