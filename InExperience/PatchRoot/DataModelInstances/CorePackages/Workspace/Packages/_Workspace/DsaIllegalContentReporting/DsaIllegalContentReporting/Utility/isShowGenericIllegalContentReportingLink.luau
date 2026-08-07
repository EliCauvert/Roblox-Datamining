local localizationService = game:GetService("LocalizationService")
local playersService = game:GetService("Players")
local enableGenericIllegalContentReporting3 = game:DefineFastFlag("EnableGenericIllegalContentReporting3", false)
local countriesWithGenericIllegalContentReporting2 = game:DefineFastString("CountriesWithGenericIllegalContentReporting2", "AT,BE,BG,CY,CZ,DE,DK,EE,ES,FI,FR,GR,HR,HU,IE,IT,LT,LU,LV,MT,NL,PL,PT,RO,SE,SI,SK,GB,AU")
local var4 = false

if enableGenericIllegalContentReporting3 then
	task.spawn(function() --[[ line: 18 ]]
		-- upvalues: playersService (ref), localizationService (ref), countriesWithGenericIllegalContentReporting2 (ref), var4 (write)
		local localPlayer = playersService.LocalPlayer
		while not localPlayer do
			playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
			localPlayer = playersService.LocalPlayer
		end
		local ok, status = pcall(localizationService.GetCountryRegionForPlayerAsync, localizationService, localPlayer)
		
		if not ok then return end
		for i, v in ipairs(countriesWithGenericIllegalContentReporting2:split(",")) do
			if status == v then
				var4 = true
				
				return
			end
		end
	end)
end
return function() --[[ line: 42 | named "isShowGenericIllegalContentReportingLink" ]]
	-- upvalues: enableGenericIllegalContentReporting3 (ref), var4 (write)
	return enableGenericIllegalContentReporting3 and var4
end