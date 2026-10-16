local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local _ = require(InExperienceSideSheet.Parent.Chrome)
local GetIntegrationsStoreModule = require(InExperienceSideSheet.Stores.GetIntegrationsStore)

return function(p1) --[[ Line: 20 ]]
	-- upvalues: GetIntegrationsStoreModule (copy)
	local IntegrationsStoreModule = GetIntegrationsStoreModule()
	IntegrationsStoreModule.setUnibarIntegrations(p1.unibarIntegrations)
	IntegrationsStoreModule.setAboveFoldIntegrations(p1.aboveFoldIntegrations)
	IntegrationsStoreModule.setBelowFoldIntegrations(p1.belowFoldIntegrations)
	IntegrationsStoreModule.setSessionActionIntegrations(p1.sessionActionIntegrations)
	IntegrationsStoreModule.setScrollableContentTopWidgetIntegrations(p1.scrollableContentTopWidgetIntegrations)
	IntegrationsStoreModule.setScrollableContentBottomWidgetIntegrations(p1.scrollableContentBottomWidgetIntegrations)
end