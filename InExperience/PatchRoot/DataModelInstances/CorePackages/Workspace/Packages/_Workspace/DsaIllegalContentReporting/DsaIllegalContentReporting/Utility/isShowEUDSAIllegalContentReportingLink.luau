local dsaIllegalContentReporting = script:FindFirstAncestor("DsaIllegalContentReporting")
local constantsModule = require(dsaIllegalContentReporting.Utility.Constants)
local isInDSAFeaturesOverrideListModule = require(dsaIllegalContentReporting.Utility.isInDSAFeaturesOverrideList)
local getFFlagDSAIllegalContentReporting = require(dsaIllegalContentReporting.Parent.SharedFlags).GetFFlagDSAIllegalContentReporting
local localizationService = game:GetService("LocalizationService")
local playersService = game:GetService("Players")
local var5 = false

if getFFlagDSAIllegalContentReporting() then
	task.spawn(function()
		-- upvalues: playersService (ref), localizationService (ref), constantsModule (ref), var5 (write)
		local localPlayer = playersService.LocalPlayer
		while not localPlayer do
			playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
			localPlayer = playersService.LocalPlayer
		end
		local ok, status = pcall(localizationService.GetCountryRegionForPlayerAsync, localizationService, localPlayer)
		
		if not ok then return end
		for i, v in ipairs(constantsModule.ELIGIBLE_COUNTRY_REGION_CODES) do
			if status == v then
				var5 = true
				
				return
			end
		end
	end)
end
function isShowEUDSAIllegalContentReportingLink()
	-- upvalues: isInDSAFeaturesOverrideListModule (ref), getFFlagDSAIllegalContentReporting (ref), var5 (write)
	return if isInDSAFeaturesOverrideListModule() then true else getFFlagDSAIllegalContentReporting() and var5
end

return isShowEUDSAIllegalContentReportingLink