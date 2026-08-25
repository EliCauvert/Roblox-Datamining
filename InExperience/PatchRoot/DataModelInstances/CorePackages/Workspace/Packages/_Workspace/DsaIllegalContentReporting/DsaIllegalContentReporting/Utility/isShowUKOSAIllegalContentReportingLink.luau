local localizationService = game:GetService("LocalizationService")
local playersService = game:GetService("Players")
local var2 = false
task.spawn(function()
	-- upvalues: playersService (ref), localizationService (ref), var2 (write)
	local localPlayer = playersService.LocalPlayer
	while not localPlayer do
		playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
		localPlayer = playersService.LocalPlayer
	end
	local ok, status = pcall(localizationService.GetCountryRegionForPlayerAsync, localizationService, localPlayer)
	
	if not ok then return end
	if status == "GB" then
		var2 = true
	end
end)

return function()
	-- upvalues: var2 (write)
	return var2
end