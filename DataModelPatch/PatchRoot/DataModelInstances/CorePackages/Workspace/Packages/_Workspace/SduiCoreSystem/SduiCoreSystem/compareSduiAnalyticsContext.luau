local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local TutilsModule = require(SduiCoreSystem.Parent.tutils)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local config = { analyticsData = true, ancestorAnalyticsData = true }

return function(p1, p2)
	-- upvalues: config (copy), TutilsModule (copy)
	if p1 == p2 then
		return true
	end
	for i in config do
		local v1 = p1[i]
		local v2 = p2[i]
		
		if typeof(v1) == "table" and typeof(v2) == "table" then
			if not TutilsModule.shallowEqual(v1, v2) then
				return false
			end
		elseif v1 and not v2 or v2 and not v1 then
			return false
		end
	end
	return TutilsModule.shallowEqual(p1, p2, config)
end