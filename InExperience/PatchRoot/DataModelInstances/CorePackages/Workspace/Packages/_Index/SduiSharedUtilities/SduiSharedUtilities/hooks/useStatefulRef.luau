local reactModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.React)

return function(p0)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(nil)
	
	return var1, reactModule.useCallback(function(p1)
		-- upvalues: p0 (ref), var2 (ref)
		if typeof(p0) == "function" then
			p0(p1)
		elseif typeof(p0) == "table" then
			p0.current = p1
		end
		var2(p1)
	end, { p0 })
end