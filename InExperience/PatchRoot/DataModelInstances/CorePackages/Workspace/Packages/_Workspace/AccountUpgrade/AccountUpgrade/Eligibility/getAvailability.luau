local accountUpgradeFlowModule = require(script:FindFirstAncestor("AccountUpgrade").AccountUpgradeFlow)
local getPioneerAccountUpgradeAvailabilityModule = require(script.Parent.getPioneerAccountUpgradeAvailability)
local t = {
	[accountUpgradeFlowModule.Pioneer] = getPioneerAccountUpgradeAvailabilityModule,
	[accountUpgradeFlowModule.PioneerU13] = getPioneerAccountUpgradeAvailabilityModule
}

return function(p1)
	-- upvalues: t (ref)
	local var1 = t[p1]
	assert(var1 ~= nil, `Unsupported account upgrade flow: {p1}`)
	
	return var1()
end