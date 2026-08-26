local argCheckModule = require(script:FindFirstAncestor("AppChat").Parent.ArgCheck)

return function(p1, p2)
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p1, "string", "patternMatcher.string")
	argCheckModule.isType(p2, "string", "patternMatcher.pattern")
	local var1, var2 = p1:lower():find(p2)
	
	if var1 then
		return true, { prefix = p1:sub(1, var1 - 1), suffix = p1:sub(var2 + 1) }
	end
	return false, nil
end