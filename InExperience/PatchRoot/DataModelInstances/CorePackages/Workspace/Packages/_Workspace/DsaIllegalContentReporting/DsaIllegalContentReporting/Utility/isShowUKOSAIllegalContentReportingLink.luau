local localizationService = game:GetService("LocalizationService")
local playersService = game:GetService("Players")
local enableOSAIllegalContentReporting = game:DefineFastFlag("EnableOSAIllegalContentReporting", false)
local var3 = false

if enableOSAIllegalContentReporting then
	task.spawn(function() --[[ line: 16 ]]
		-- upvalues: playersService (ref), localizationService (ref), var3 (write)
		local localPlayer = playersService.LocalPlayer
		while not localPlayer do
			playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
			localPlayer = playersService.LocalPlayer
		end
		local ok, status = pcall(localizationService.GetCountryRegionForPlayerAsync, localizationService, localPlayer)
		
		if not ok then return end
		if status == "GB" then
			var3 = true
		end
	end)
end
return function() --[[ line: 36 | named "isShowUKOSAIllegalContentReportingLink" ]]
	-- upvalues: enableOSAIllegalContentReporting (ref), var3 (write)
	return enableOSAIllegalContentReporting and var3
end