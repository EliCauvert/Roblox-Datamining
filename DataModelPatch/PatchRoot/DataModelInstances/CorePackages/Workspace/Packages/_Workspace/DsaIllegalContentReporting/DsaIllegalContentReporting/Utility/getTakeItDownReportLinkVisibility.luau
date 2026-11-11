local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")
local FFlagAddTakeItDownReportLinkToSurfaces = require(script:FindFirstAncestor("DsaIllegalContentReporting").Parent.SharedFlags).FFlagAddTakeItDownReportLinkToSurfaces
local CountriesWithTakeItDownReport = game:DefineFastString("CountriesWithTakeItDownReport", "US")
local Flag = false

if FFlagAddTakeItDownReportLinkToSurfaces then
	task.spawn(function()
		-- upvalues: Players (copy), LocalizationService (copy), CountriesWithTakeItDownReport (copy), Flag (ref)
		local LocalPlayer = Players.LocalPlayer
		while not LocalPlayer do
			Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
			LocalPlayer = Players.LocalPlayer
		end
		local Success, Result = pcall(LocalizationService.GetCountryRegionForPlayerAsync, LocalizationService, LocalPlayer)
		
		if not Success then return end
		for _, value in ipairs((CountriesWithTakeItDownReport:split(","))) do
			if Result == value then
				Flag = true
				break
			end
		end
	end)
end
return function()
	-- upvalues: FFlagAddTakeItDownReportLinkToSurfaces (copy), Flag (ref)
	return FFlagAddTakeItDownReportLinkToSurfaces and Flag
end