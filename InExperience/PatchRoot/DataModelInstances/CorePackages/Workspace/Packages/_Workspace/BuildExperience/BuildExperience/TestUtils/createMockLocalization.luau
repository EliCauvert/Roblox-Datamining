local robloxAppLocalesModule = require(script:FindFirstAncestor("BuildExperience").Parent.RobloxAppLocales)

return function(p1)
	-- upvalues: robloxAppLocalesModule (ref)
	local var1 = robloxAppLocalesModule.Localization.new("en-us")
	
	function var1.Format(_, p2)
		-- upvalues: p1 (ref)
		return `{p1 or ""}{p2}`
	end
	
	return var1
end