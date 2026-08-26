local parent = script:FindFirstAncestor("DsaIllegalContentReporting").Parent
local localizationService = game:GetService("LocalizationService")
local playersService = game:GetService("Players")
local fFlagAddTakeItDownReportLinkToSurfaces = require(parent.SharedFlags).FFlagAddTakeItDownReportLinkToSurfaces
local countriesWithTakeItDownReport = game:DefineFastString("CountriesWithTakeItDownReport", "US")
local var1 = false

if fFlagAddTakeItDownReportLinkToSurfaces then
	task.spawn(function()
		-- upvalues: playersService (ref), localizationService (ref), countriesWithTakeItDownReport (ref), var1 (write)
		local localPlayer = playersService.LocalPlayer
		while not localPlayer do
			playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
			localPlayer = playersService.LocalPlayer
		end
		local ok, status = pcall(localizationService.GetCountryRegionForPlayerAsync, localizationService, localPlayer)
		
		if not ok then return end
		for i, v in ipairs(countriesWithTakeItDownReport:split(",")) do
			if status == v then
				var1 = true
				
				return
			end
		end
	end)
end
return function()
	-- upvalues: fFlagAddTakeItDownReportLinkToSurfaces (ref), var1 (write)
	return fFlagAddTakeItDownReportLinkToSurfaces and var1
end