local flyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local fFlagFlyoutTradesEntryExposureLoggingModule = require(flyoutSidePanel.Flags.FFlagFlyoutTradesEntryExposureLogging)
local fStringFlyoutTradesEntryIxpLayerModule = require(flyoutSidePanel.Flags.FStringFlyoutTradesEntryIxpLayer)

return function(p1)
	-- upvalues: fFlagFlyoutTradesEntryExposureLoggingModule (ref), fStringFlyoutTradesEntryIxpLayerModule (ref)
	if not fFlagFlyoutTradesEntryExposureLoggingModule then return end
	if fStringFlyoutTradesEntryIxpLayerModule == "" then return end
	local var1 = p1
	
	if var1 == nil then
		if not game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then return end
		var1 = game:GetService("IXPService")
	end
	assert(var1 ~= nil, "IXPService is required to log layer exposure")
	pcall(function()
		-- upvalues: var1 (ref), fStringFlyoutTradesEntryIxpLayerModule (ref)
		var1:LogFlagLinkedUserLayerExposure(fStringFlyoutTradesEntryIxpLayerModule)
	end)
end