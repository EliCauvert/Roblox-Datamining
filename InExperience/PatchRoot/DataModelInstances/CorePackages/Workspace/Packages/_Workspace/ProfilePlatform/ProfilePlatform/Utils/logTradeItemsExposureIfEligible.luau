local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local fFlagProfileTradeItemsExposureLoggingModule = require(profilePlatform.Flags.FFlagProfileTradeItemsExposureLogging)
local fStringProfileTradeItemsIxpLayerModule = require(profilePlatform.Flags.FStringProfileTradeItemsIxpLayer)

return function(p1)
	-- upvalues: fFlagProfileTradeItemsExposureLoggingModule (ref), fStringProfileTradeItemsIxpLayerModule (ref)
	if not fFlagProfileTradeItemsExposureLoggingModule then return end
	if tostring(p1.profileId) == tostring(p1.localUserId) then return end
	if not p1.localHasPaidTradingAccess or not p1.otherHasPaidTradingAccess then return end
	if fStringProfileTradeItemsIxpLayerModule == "" then return end
	local ixpService = p1.ixpService
	
	if ixpService == nil then
		if not game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then return end
		ixpService = game:GetService("IXPService")
	end
	assert(ixpService ~= nil, "IXPService is required to log layer exposure")
	pcall(function()
		-- upvalues: ixpService (ref), fStringProfileTradeItemsIxpLayerModule (ref)
		ixpService:LogFlagLinkedUserLayerExposure(fStringProfileTradeItemsIxpLayerModule)
	end)
end