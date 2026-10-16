local AppStorageService = game:GetService("AppStorageService")
local EnableConsoleExpControlsIXP684 = game:DefineFastFlag("EnableConsoleExpControlsIXP684", false)
local Success, Result = pcall(function() --[[ Line: 12 ]]
	-- upvalues: AppStorageService (copy)
	return AppStorageService:GetItem("ExperienceMenuVersion")
end)

return if Success and (Result == "hamburger" or Result == "submenu") then EnableConsoleExpControlsIXP684 else false