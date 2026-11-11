local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local TutilsModule = require(Parent.tutils)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local config = {
	extraLocalProps = true,
	localAnalyticsData = true,
	parentAnalyticsContext = true,
	conditionalProps = true
}

if require(Parent.SharedFlags).FFlagSduiPoolBackedFeed then
	config.extraLocalPropSignals = true
end
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