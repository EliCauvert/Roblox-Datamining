local reactModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.React)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: p3 (ref), p1 (ref), p2 (ref)
		local var1 = p3 or {}
		var1.configKey = p1
		var1.appPage = p2
		
		return var1
	end, { p1, p2, p3 })
end