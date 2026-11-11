local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local _ = require(InExperienceSideSheet.Parent.Chrome)
local GetIntegrationsStoreModule = require(InExperienceSideSheet.Stores.GetIntegrationsStore)

return function(p1)
	-- upvalues: GetIntegrationsStoreModule (copy)
	local IntegrationsStoreModule = GetIntegrationsStoreModule()
	IntegrationsStoreModule.setUnibarIntegrations(p1.unibarIntegrations)
	IntegrationsStoreModule.setToggleIntegrations(p1.toggleIntegrations)
	IntegrationsStoreModule.setPageIntegrations(p1.pageIntegrations)
	IntegrationsStoreModule.setSessionActionIntegrations(p1.sessionActionIntegrations)
end