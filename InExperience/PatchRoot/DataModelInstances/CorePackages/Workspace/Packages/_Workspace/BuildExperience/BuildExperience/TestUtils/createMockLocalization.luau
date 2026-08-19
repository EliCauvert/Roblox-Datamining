local robloxAppLocalesModule = require(script:FindFirstAncestor("BuildExperience").Parent.RobloxAppLocales)

return function(p0) --[[ line: 6 | named "createMockLocalization" ]]
	-- upvalues: robloxAppLocalesModule (ref)
	local var1 = robloxAppLocalesModule.Localization.new("en-us")
	
	function var1.Format(_, p1) --[[ line: 8 ]]
		-- upvalues: p0 (ref)
		return `{p0 or ""}{p1}`
	end
	
	return var1
end