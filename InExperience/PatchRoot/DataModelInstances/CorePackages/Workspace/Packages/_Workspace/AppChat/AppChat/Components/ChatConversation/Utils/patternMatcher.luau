local argCheckModule = require(script:FindFirstAncestor("AppChat").Parent.ArgCheck)

return function(p0, p1) --[[ line: 6 ]]
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p0, "string", "patternMatcher.string")
	argCheckModule.isType(p1, "string", "patternMatcher.pattern")
	local var1, var2 = p0:lower():find(p1)
	
	if var1 then
		return true, { prefix = p0:sub(1, var1 - 1), suffix = p0:sub(var2 + 1) }
	end
	return false, nil
end