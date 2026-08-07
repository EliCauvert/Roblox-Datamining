local reactModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.React)

return function(p0, p1, p2) --[[ line: 5 | named "useLocalAnalyticsData" ]]
	-- upvalues: reactModule (ref)
	return reactModule.useMemo(function() --[[ line: 6 ]]
		-- upvalues: p2 (ref), p0 (ref), p1 (ref)
		local var1 = p2 or {}
		var1.configKey = p0
		var1.appPage = p1
		
		return var1
	end, { p0, p1, p2 })
end