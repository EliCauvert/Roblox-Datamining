local DsaIllegalContentReporting = script:FindFirstAncestor("DsaIllegalContentReporting")
local ConstantsModule = require(DsaIllegalContentReporting.Utility.Constants)
local IsInDSAFeaturesOverrideListModule = require(DsaIllegalContentReporting.Utility.isInDSAFeaturesOverrideList)
local GetFFlagDSAIllegalContentReportingFunction = require(DsaIllegalContentReporting.Parent.SharedFlags).GetFFlagDSAIllegalContentReporting
local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")
local Flag = false

if GetFFlagDSAIllegalContentReportingFunction() then
	task.spawn(function() --[[ Line: 18 ]]
		-- upvalues: Players (copy), LocalizationService (copy), ConstantsModule (copy), Flag (ref)
		local LocalPlayer = Players.LocalPlayer
		while not LocalPlayer do
			Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
			LocalPlayer = Players.LocalPlayer
		end
		local Success, Result = pcall(LocalizationService.GetCountryRegionForPlayerAsync, LocalizationService, LocalPlayer)
		
		if not Success then return end
		for _, eLIGIBLECOUNTRYREGIONCODE in ipairs(ConstantsModule.ELIGIBLE_COUNTRY_REGION_CODES) do
			if Result == eLIGIBLECOUNTRYREGIONCODE then
				Flag = true
				break
			end
		end
	end)
end
function isShowEUDSAIllegalContentReportingLink() --[[ Line: 41 ]]
	-- upvalues: IsInDSAFeaturesOverrideListModule (copy), GetFFlagDSAIllegalContentReportingFunction (copy), Flag (ref)
	return if IsInDSAFeaturesOverrideListModule() then true else GetFFlagDSAIllegalContentReportingFunction() and Flag
end

return isShowEUDSAIllegalContentReportingLink