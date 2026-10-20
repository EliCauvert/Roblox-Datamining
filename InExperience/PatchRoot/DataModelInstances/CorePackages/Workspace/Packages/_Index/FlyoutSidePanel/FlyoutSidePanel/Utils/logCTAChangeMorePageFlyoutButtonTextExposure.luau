local FlyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local FFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled = require(FlyoutSidePanel.Parent.SharedFlags).FFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled
local FStringCTAChangeMorePageFlyoutButtonTextIxpLayerModule = require(FlyoutSidePanel.Flags.FStringCTAChangeMorePageFlyoutButtonTextIxpLayer)

return function(IXPService)
	-- upvalues: FFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled (copy), FStringCTAChangeMorePageFlyoutButtonTextIxpLayerModule (copy)
	if not FFlagCTAChangeMorePageFlyoutButtonTextIxpEnabled then return end
	if FStringCTAChangeMorePageFlyoutButtonTextIxpLayerModule == "" then return end
	local IXPService1 = IXPService
	
	if IXPService1 == nil then
		if not game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then return end
		IXPService1 = game:GetService("IXPService")
	end
	assert(IXPService1 ~= nil, "IXPService is required to log layer exposure")
	pcall(function()
		-- upvalues: IXPService1 (copy), FStringCTAChangeMorePageFlyoutButtonTextIxpLayerModule (copy)
		IXPService1:LogFlagLinkedUserLayerExposure(FStringCTAChangeMorePageFlyoutButtonTextIxpLayerModule)
	end)
end