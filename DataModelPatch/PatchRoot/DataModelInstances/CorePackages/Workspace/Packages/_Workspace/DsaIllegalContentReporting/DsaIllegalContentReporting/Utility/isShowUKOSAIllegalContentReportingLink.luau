local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")
local EnableOSAIllegalContentReporting = game:DefineFastFlag("EnableOSAIllegalContentReporting", false)
local Flag = false

if EnableOSAIllegalContentReporting then
	task.spawn(function()
		-- upvalues: Players (copy), LocalizationService (copy), Flag (ref)
		local LocalPlayer = Players.LocalPlayer
		while not LocalPlayer do
			Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
			LocalPlayer = Players.LocalPlayer
		end
		local Success, Result = pcall(LocalizationService.GetCountryRegionForPlayerAsync, LocalizationService, LocalPlayer)
		
		if not Success then return end
		if Result == "GB" then
			Flag = true
		end
	end)
end
return function()
	-- upvalues: EnableOSAIllegalContentReporting (copy), Flag (ref)
	return EnableOSAIllegalContentReporting and Flag
end