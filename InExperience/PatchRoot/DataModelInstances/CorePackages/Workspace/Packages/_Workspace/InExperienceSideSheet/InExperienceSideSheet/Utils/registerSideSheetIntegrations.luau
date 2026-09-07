local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local _ = require(inExperienceSideSheet.Parent.Chrome)
local getIntegrationsStoreModule = require(inExperienceSideSheet.Stores.GetIntegrationsStore)

return function(p1)
	-- upvalues: getIntegrationsStoreModule (ref)
	local var1 = getIntegrationsStoreModule()
	var1.setUnibarIntegrations(p1.unibarIntegrations)
	var1.setToggleIntegrations(p1.toggleIntegrations)
	var1.setPageIntegrations(p1.pageIntegrations)
	var1.setSessionActionIntegrations(p1.sessionActionIntegrations)
end