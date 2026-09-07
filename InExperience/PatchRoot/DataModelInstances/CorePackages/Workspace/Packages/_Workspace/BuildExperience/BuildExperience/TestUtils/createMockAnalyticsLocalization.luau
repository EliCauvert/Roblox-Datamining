local robloxAppLocalesModule = require(script:FindFirstAncestor("BuildExperience").Parent.RobloxAppLocales)
local t = {
	["Feature.Build.Analytics.Percent"] = "{number}%",
	["Feature.Build.Analytics.DurationHours"] = "{number} hrs"
}

return function()
	-- upvalues: robloxAppLocalesModule (ref), t (ref)
	local var1 = robloxAppLocalesModule.Localization.new("en-us")
	
	function var2.Format(_, p1, p2)
		-- upvalues: t (copy)
		local var2 = t[p1] or p1
		
		if p2 ~= nil then
			var2 = string.gsub(var2, "{(%w+)}", function(p3)
				-- upvalues: p2 (ref)
				local var3 = p2[p3]
				
				return if var3 == nil then "{" .. p2 .. "}" else tostring(var3)
			end)
		end
		return var2
	end
	
	return var1
end