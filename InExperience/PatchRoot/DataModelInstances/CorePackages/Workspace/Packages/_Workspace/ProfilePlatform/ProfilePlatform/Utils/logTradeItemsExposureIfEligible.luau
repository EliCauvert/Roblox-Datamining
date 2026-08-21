local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local fFlagProfileTradeItemsExposureLoggingModule = require(profilePlatform.Flags.FFlagProfileTradeItemsExposureLogging)
local fStringProfileTradeItemsIxpLayerModule = require(profilePlatform.Flags.FStringProfileTradeItemsIxpLayer)

return function(p0) --[[ line: 15 | named "logTradeItemsExposureIfEligible" ]]
	-- upvalues: fFlagProfileTradeItemsExposureLoggingModule (ref), fStringProfileTradeItemsIxpLayerModule (ref)
	if not fFlagProfileTradeItemsExposureLoggingModule then return end
	if tostring(p0.profileId) == tostring(p0.localUserId) then return end
	if not p0.localHasPaidTradingAccess or not p0.otherHasPaidTradingAccess then return end
	if fStringProfileTradeItemsIxpLayerModule == "" then return end
	local ixpService = p0.ixpService
	
	if ixpService == nil then
		if not game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then return end
		ixpService = game:GetService("IXPService")
	end
	assert(ixpService ~= nil, "IXPService is required to log layer exposure")
	pcall(function() --[[ line: 43 ]]
		-- upvalues: ixpService (ref), fStringProfileTradeItemsIxpLayerModule (ref)
		ixpService:LogFlagLinkedUserLayerExposure(fStringProfileTradeItemsIxpLayerModule)
	end)
end