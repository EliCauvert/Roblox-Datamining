local FlyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local FFlagFlyoutTradesEntryExposureLoggingModule = require(FlyoutSidePanel.Flags.FFlagFlyoutTradesEntryExposureLogging)
local FStringFlyoutTradesEntryIxpLayerModule = require(FlyoutSidePanel.Flags.FStringFlyoutTradesEntryIxpLayer)

return function(IXPService)
	-- upvalues: FFlagFlyoutTradesEntryExposureLoggingModule (copy), FStringFlyoutTradesEntryIxpLayerModule (copy)
	if not FFlagFlyoutTradesEntryExposureLoggingModule then return end
	if FStringFlyoutTradesEntryIxpLayerModule == "" then return end
	local IXPService1 = IXPService
	
	if IXPService1 == nil then
		if not game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then return end
		IXPService1 = game:GetService("IXPService")
	end
	assert(IXPService1 ~= nil, "IXPService is required to log layer exposure")
	pcall(function()
		-- upvalues: IXPService1 (copy), FStringFlyoutTradesEntryIxpLayerModule (copy)
		IXPService1:LogFlagLinkedUserLayerExposure(FStringFlyoutTradesEntryIxpLayerModule)
	end)
end