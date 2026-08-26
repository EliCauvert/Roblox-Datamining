local localizationService = game:GetService("LocalizationService")
local playersService = game:GetService("Players")
local var1 = false
task.spawn(function()
	-- upvalues: playersService (ref), localizationService (ref), var1 (write)
	local localPlayer = playersService.LocalPlayer
	while not localPlayer do
		playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
		localPlayer = playersService.LocalPlayer
	end
	local ok, status = pcall(localizationService.GetCountryRegionForPlayerAsync, localizationService, localPlayer)
	
	if not ok then return end
	if status == "GB" then
		var1 = true
	end
end)

return function()
	-- upvalues: var1 (write)
	return var1
end