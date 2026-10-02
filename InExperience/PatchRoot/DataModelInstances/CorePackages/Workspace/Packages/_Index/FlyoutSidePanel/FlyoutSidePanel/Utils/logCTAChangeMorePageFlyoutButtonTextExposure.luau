local flyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local fFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled = require(flyoutSidePanel.Parent.SharedFlags).FFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled
local fStringCTAChangeMorePageFlyoutButtonTextIxpLayerModule = require(flyoutSidePanel.Flags.FStringCTAChangeMorePageFlyoutButtonTextIxpLayer)

return function(p1)
	-- upvalues: fFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled (ref), fStringCTAChangeMorePageFlyoutButtonTextIxpLayerModule (ref)
	if not fFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled then return end
	if fStringCTAChangeMorePageFlyoutButtonTextIxpLayerModule == "" then return end
	local var1 = p1
	
	if var1 == nil then
		if not game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then return end
		var1 = game:GetService("IXPService")
	end
	assert(var1 ~= nil, "IXPService is required to log layer exposure")
	pcall(function()
		-- upvalues: var1 (ref), fStringCTAChangeMorePageFlyoutButtonTextIxpLayerModule (ref)
		var1:LogFlagLinkedUserLayerExposure(fStringCTAChangeMorePageFlyoutButtonTextIxpLayerModule)
	end)
end