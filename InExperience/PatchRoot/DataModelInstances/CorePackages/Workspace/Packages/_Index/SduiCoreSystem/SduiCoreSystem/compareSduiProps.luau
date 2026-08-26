local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local tutilsModule = require(parent.tutils)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local t = {
	extraLocalProps = true,
	localAnalyticsData = true,
	parentAnalyticsContext = true,
	conditionalProps = true
}

if require(parent.SharedFlags).FFlagSduiPoolBackedFeed then
	t.extraLocalPropSignals = true
end
return function(p1, p2)
	-- upvalues: t (ref), tutilsModule (ref)
	if p1 == p2 then
		return true
	end
	for i in t do
		local var1 = p1[i]
		local var2 = p2[i]
		
		if typeof(var1) == "table" and typeof(var2) == "table" then
			if not tutilsModule.shallowEqual(var1, var2) then
				return false
			end
		elseif var1 and not var2 or var2 and not var1 then
			return false
		end
	end
	return tutilsModule.shallowEqual(p1, p2, t)
end