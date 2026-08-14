local robloxAppLocalesModule = require(script:FindFirstAncestor("BuildExperience").Parent.RobloxAppLocales)

return function() --[[ line: 6 | named "createMockLocalization" ]]
	-- upvalues: robloxAppLocalesModule (ref)
	local var1 = robloxAppLocalesModule.Localization.new("en-us")
	
	function var1.Format(_, p0) --[[ line: 8 ]]
		return p0
	end
	
	return var1
end