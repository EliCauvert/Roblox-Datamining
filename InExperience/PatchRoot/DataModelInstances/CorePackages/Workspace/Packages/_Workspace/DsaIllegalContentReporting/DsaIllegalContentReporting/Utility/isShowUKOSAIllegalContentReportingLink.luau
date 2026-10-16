local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")
local Flag = false
task.spawn(function() --[[ Line: 12 ]]
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

return function() --[[ Line: 31 | Named "isShowUKOSAIllegalContentReportingLink" ]]
	-- upvalues: Flag (ref)
	return Flag
end