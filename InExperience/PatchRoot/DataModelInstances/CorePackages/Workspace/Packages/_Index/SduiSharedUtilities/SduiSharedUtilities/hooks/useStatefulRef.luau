local reactModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(nil)
	
	return var1, reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), var2 (ref)
		if typeof(p1) == "function" then
			p1(p2)
		elseif typeof(p1) == "table" then
			p1.current = p2
		end
		var2(p2)
	end, { p1 })
end