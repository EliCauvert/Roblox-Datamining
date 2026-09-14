local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local _ = require(inExperienceSideSheet.Parent.Chrome)
local getIntegrationsStoreModule = require(inExperienceSideSheet.Stores.GetIntegrationsStore)

return function(p1)
	-- upvalues: getIntegrationsStoreModule (ref)
	local var1 = getIntegrationsStoreModule()
	var1.setUnibarIntegrations(p1.unibarIntegrations)
	var1.setAboveFoldIntegrations(p1.aboveFoldIntegrations)
	var1.setBelowFoldIntegrations(p1.belowFoldIntegrations)
	var1.setSessionActionIntegrations(p1.sessionActionIntegrations)
	var1.setScrollableContentTopWidgetIntegrations(p1.scrollableContentTopWidgetIntegrations)
	var1.setScrollableContentBottomWidgetIntegrations(p1.scrollableContentBottomWidgetIntegrations)
end