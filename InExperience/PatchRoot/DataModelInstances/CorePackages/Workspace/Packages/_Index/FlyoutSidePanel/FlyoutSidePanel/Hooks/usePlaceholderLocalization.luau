local ReactModule = require(script:FindFirstAncestor("FlyoutSidePanel").Parent.React)
local config = {
	["Feature.RobloxSubscription.Description.ExclusiveBenefits"] = "Lorem ipsum dolor sit amet consectetur",
	["Feature.RobloxSubscription.Action.Subscribe"] = "Lorem"
}

return function(p1) --[[ Line: 18 | Named "usePlaceholderLocalization" ]]
	-- upvalues: ReactModule (copy), config (copy)
	return ReactModule.useMemo(function() --[[ Line: 19 ]]
		-- upvalues: p1 (copy), config (upval)
		local t = {}
		
		for i, value in pairs(p1) do
			local v1 = if typeof(value) == "table" then value[1] else value
			local Entry = config[v1] or v1
			
			if typeof(value) == "table" then
				for i1, value1 in pairs(value) do
					if typeof(i1) == "string" then
						Entry = string.gsub(Entry, "{" .. i1 .. "}", function(): string --[[ Line: 27 ]]
							-- upvalues: value1 (copy)
							return (tostring(value1))
						end)
					end
				end
			end
			t[i] = Entry
		end
		return t
	end, { p1 })
end