local appStorageService = game:GetService("AppStorageService")
local enableConsoleExpControlsIXP684 = game:DefineFastFlag("EnableConsoleExpControlsIXP684", false)
local _ = { HAMBURGER = "hamburger", SUBMENU = "submenu" }
local ok, status = pcall(function()
	-- upvalues: appStorageService (ref)
	return appStorageService:GetItem("ExperienceMenuVersion")
end)

return if ok and (status == "hamburger" or status == "submenu") then enableConsoleExpControlsIXP684 else false