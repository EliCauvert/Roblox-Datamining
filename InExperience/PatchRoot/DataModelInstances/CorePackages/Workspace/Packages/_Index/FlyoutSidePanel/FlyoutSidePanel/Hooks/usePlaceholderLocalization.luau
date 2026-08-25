local reactModule = require(script:FindFirstAncestor("FlyoutSidePanel").Parent.React)
local t = {
	["Feature.RobloxSubscription.Description.ExclusiveBenefits"] = "Lorem ipsum dolor sit amet consectetur",
	["Feature.RobloxSubscription.Action.Subscribe"] = "Lorem"
}

return function(p0)
	-- upvalues: reactModule (ref), t (ref)
	return reactModule.useMemo(function()
		-- upvalues: p0 (ref), t (copy)
		local t_1 = {}
		
		for i, v in pairs(p0) do
			local var3 = if typeof(v) == "table" then v[1] else v
			local var4 = t[var3] or var3
			
			if typeof(v) == "table" then
				for i_1, v_1 in pairs(v) do
					if typeof(i_1) == "string" then
						var4 = string.gsub(var4, "{" .. i_1 .. "}", function()
							-- upvalues: v_1 (ref)
							return tostring(v_1)
						end)
					end
				end
			end
			t_1[i] = var4
		end
		return t_1
	end, { p0 })
end