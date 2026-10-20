local AccountUpgradeFlowModule = require(script:FindFirstAncestor("AccountUpgrade").AccountUpgradeFlow)
local GetPioneerAccountUpgradeAvailabilityModule = require(script.Parent.getPioneerAccountUpgradeAvailability)
local config = {
	[AccountUpgradeFlowModule.Pioneer] = GetPioneerAccountUpgradeAvailabilityModule,
	[AccountUpgradeFlowModule.PioneerU13] = GetPioneerAccountUpgradeAvailabilityModule
}

return function(p1)
	-- upvalues: config (copy)
	local Entry = config[p1]
	assert(Entry ~= nil, `Unsupported account upgrade flow: {p1}`)
	
	return Entry()
end