local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local tutilsModule = require(sduiCoreSystem.Parent.tutils)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local t = { analyticsData = true, ancestorAnalyticsData = true }

return function(p0, p1) --[[ line: 17 ]]
	-- upvalues: t (ref), tutilsModule (ref)
	if p0 == p1 then
		return true
	end
	for i in t do
		local var3 = p0[i]
		local var4 = p1[i]
		
		if typeof(var3) == "table" and typeof(var4) == "table" then
			if not tutilsModule.shallowEqual(var3, var4) then
				return false
			end
		elseif var3 and not var4 or var4 and not var3 then
			return false
		end
	end
	return tutilsModule.shallowEqual(p0, p1, t)
end