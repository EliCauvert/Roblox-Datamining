local flyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local fFlagFlyoutTradesEntryExposureLoggingModule = require(flyoutSidePanel.Flags.FFlagFlyoutTradesEntryExposureLogging)
local fStringFlyoutTradesEntryIxpLayerModule = require(flyoutSidePanel.Flags.FStringFlyoutTradesEntryIxpLayer)

return function(p0) --[[ line: 7 | named "logFlyoutTradesEntryExposure" ]]
	-- upvalues: fFlagFlyoutTradesEntryExposureLoggingModule (ref), fStringFlyoutTradesEntryIxpLayerModule (ref)
	if not fFlagFlyoutTradesEntryExposureLoggingModule then return end
	if fStringFlyoutTradesEntryIxpLayerModule == "" then return end
	local var3 = p0
	
	if var3 == nil then
		if not game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then return end
		var3 = game:GetService("IXPService")
	end
	assert(var3 ~= nil, "IXPService is required to log layer exposure")
	pcall(function() --[[ line: 27 ]]
		-- upvalues: var3 (ref), fStringFlyoutTradesEntryIxpLayerModule (ref)
		var3:LogFlagLinkedUserLayerExposure(fStringFlyoutTradesEntryIxpLayerModule)
	end)
end