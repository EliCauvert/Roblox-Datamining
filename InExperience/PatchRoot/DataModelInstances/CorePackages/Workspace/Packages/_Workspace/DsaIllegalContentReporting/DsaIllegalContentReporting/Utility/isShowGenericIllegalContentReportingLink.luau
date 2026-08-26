local localizationService = game:GetService("LocalizationService")
local playersService = game:GetService("Players")
local enableGenericIllegalContentReporting3 = game:DefineFastFlag("EnableGenericIllegalContentReporting3", false)
local countriesWithGenericIllegalContentReporting2 = game:DefineFastString("CountriesWithGenericIllegalContentReporting2", "AT,BE,BG,CY,CZ,DE,DK,EE,ES,FI,FR,GR,HR,HU,IE,IT,LT,LU,LV,MT,NL,PL,PT,RO,SE,SI,SK,GB,AU")
local var1 = false

if enableGenericIllegalContentReporting3 then
	task.spawn(function()
		-- upvalues: playersService (ref), localizationService (ref), countriesWithGenericIllegalContentReporting2 (ref), var1 (write)
		local localPlayer = playersService.LocalPlayer
		while not localPlayer do
			playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
			localPlayer = playersService.LocalPlayer
		end
		local ok, status = pcall(localizationService.GetCountryRegionForPlayerAsync, localizationService, localPlayer)
		
		if not ok then return end
		for i, v in ipairs(countriesWithGenericIllegalContentReporting2:split(",")) do
			if status == v then
				var1 = true
				
				return
			end
		end
	end)
end
return function()
	-- upvalues: enableGenericIllegalContentReporting3 (ref), var1 (write)
	return enableGenericIllegalContentReporting3 and var1
end