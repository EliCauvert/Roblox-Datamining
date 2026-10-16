local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local FFlagProfileTradeItemsExposureLoggingModule = require(ProfilePlatform.Flags.FFlagProfileTradeItemsExposureLogging)
local FStringProfileTradeItemsIxpLayerModule = require(ProfilePlatform.Flags.FStringProfileTradeItemsIxpLayer)

return function(p1) --[[ Line: 15 | Named "logTradeItemsExposureIfEligible" ]]
	-- upvalues: FFlagProfileTradeItemsExposureLoggingModule (copy), FStringProfileTradeItemsIxpLayerModule (copy)
	if not FFlagProfileTradeItemsExposureLoggingModule then return end
	if tostring(p1.profileId) == tostring(p1.localUserId) then return end
	if not p1.localHasPaidTradingAccess or not p1.otherHasPaidTradingAccess then return end
	if FStringProfileTradeItemsIxpLayerModule == "" then return end
	local IxpService = p1.ixpService
	
	if IxpService == nil then
		if not game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then return end
		IxpService = game:GetService("IXPService")
	end
	assert(IxpService ~= nil, "IXPService is required to log layer exposure")
	pcall(function() --[[ Line: 43 ]]
		-- upvalues: IxpService (copy), FStringProfileTradeItemsIxpLayerModule (copy)
		IxpService:LogFlagLinkedUserLayerExposure(FStringProfileTradeItemsIxpLayerModule)
	end)
end