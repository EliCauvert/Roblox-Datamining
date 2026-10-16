local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")
local EnableGenericIllegalContentReporting3 = game:DefineFastFlag("EnableGenericIllegalContentReporting3", false)
local CountriesWithGenericIllegalContentReporting2 = game:DefineFastString("CountriesWithGenericIllegalContentReporting2", "AT,BE,BG,CY,CZ,DE,DK,EE,ES,FI,FR,GR,HR,HU,IE,IT,LT,LU,LV,MT,NL,PL,PT,RO,SE,SI,SK,GB,AU")
local Flag = false

if EnableGenericIllegalContentReporting3 then
	task.spawn(function() --[[ Line: 18 ]]
		-- upvalues: Players (copy), LocalizationService (copy), CountriesWithGenericIllegalContentReporting2 (copy), Flag (ref)
		local LocalPlayer = Players.LocalPlayer
		while not LocalPlayer do
			Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
			LocalPlayer = Players.LocalPlayer
		end
		local Success, Result = pcall(LocalizationService.GetCountryRegionForPlayerAsync, LocalizationService, LocalPlayer)
		
		if not Success then return end
		for _, value in ipairs((CountriesWithGenericIllegalContentReporting2:split(","))) do
			if Result == value then
				Flag = true
				break
			end
		end
	end)
end
return function() --[[ Line: 42 | Named "isShowGenericIllegalContentReportingLink" ]]
	-- upvalues: EnableGenericIllegalContentReporting3 (copy), Flag (ref)
	return EnableGenericIllegalContentReporting3 and Flag
end