local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(p1 or false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref)
		if p1 ~= nil then
			var2(p1)
		end
	end, { p1 })
	
	return var1, reactModule.useCallback(function(p3)
		-- upvalues: p1 (ref), var2 (ref), p2 (ref)
		if p1 == nil then
			var2(p3)
		end
		p2(p3)
	end, { p1, p2 })
end