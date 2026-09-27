local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function(value)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(Vector2.zero)
	
	return var1, reactModule.useCallback(function(p1)
		-- upvalues: var2 (ref), value (ref)
		var2(p1.AbsoluteSize)
		
		if value then
			value(p1)
		end
	end, { value })
end