return function(p1, p2, p3)
	local Success, Result = pcall(p1)
	
	if Success then
		return { pass = false, message = "Expected function to throw" }
	elseif typeof(p2) == "string" then
		local Result1 = if typeof(Result) == "string" then Result elseif typeof(Result) == "table" and typeof(Result.message) == "string" then Result.message else nil
		
		return if Result1 == nil then {
			pass = false,
			message = string.format("Matcher Error:\nExpected function to throw a string or an Error object, but it threw an error of type '%s'.\nYou may wish to use `pcall` instead and run custom expectations on the returned error", (typeof(Result)))
		} elseif Result1:find(p2, 1, not p3) == nil then {
			pass = false,
			message = string.format("Expected function to throw with\n'%s'\nbut threw\n'%s'\ninstead", p2, Result1)
		} else {
			pass = true,
			message = string.format("Expected function not to throw with '%s'", p2)
		}
	else
		return { pass = true, message = "Expected function not to throw" }
	end
end