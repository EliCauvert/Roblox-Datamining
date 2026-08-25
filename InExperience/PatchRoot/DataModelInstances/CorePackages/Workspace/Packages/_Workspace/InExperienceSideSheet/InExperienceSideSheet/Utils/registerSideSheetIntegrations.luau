local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local _ = require(inExperienceSideSheet.Parent.Chrome)
local getIntegrationsStoreModule = require(inExperienceSideSheet.Stores.GetIntegrationsStore)

return function(p0)
	-- upvalues: getIntegrationsStoreModule (ref)
	local var2 = getIntegrationsStoreModule()
	var2.setUnibarIntegrations(p0.unibarIntegrations)
	var2.setToggleIntegrations(p0.toggleIntegrations)
	var2.setPageIntegrations(p0.pageIntegrations)
	var2.setSessionActionIntegrations(p0.sessionActionIntegrations)
end