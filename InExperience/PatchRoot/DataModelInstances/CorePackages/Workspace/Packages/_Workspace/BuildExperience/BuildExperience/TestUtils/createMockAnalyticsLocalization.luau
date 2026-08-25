local robloxAppLocalesModule = require(script:FindFirstAncestor("BuildExperience").Parent.RobloxAppLocales)
local t = {
	["Feature.Build.Analytics.Percent"] = "{number}%",
	["Feature.Build.Analytics.DurationHours"] = "{number} hrs"
}

return function()
	-- upvalues: robloxAppLocalesModule (ref), t (ref)
	local var2 = robloxAppLocalesModule.Localization.new("en-us")
	
	function var2.Format(_, p0, p1)
		-- upvalues: t (copy)
		local var3 = t[p0] or p0
		
		if p1 ~= nil then
			var3 = string.gsub(var3, "{(%w+)}", function(p2)
				-- upvalues: p1 (ref)
				local var4 = p1[p2]
				
				return if var4 == nil then "{" .. p2 .. "}" else tostring(var4)
			end)
		end
		return var3
	end
	
	return var2
end