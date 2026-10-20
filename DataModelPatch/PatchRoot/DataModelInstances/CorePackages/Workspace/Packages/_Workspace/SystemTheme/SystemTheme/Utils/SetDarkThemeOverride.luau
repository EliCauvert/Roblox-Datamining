local MessageBusService = game:GetService("MessageBusService")
local SystemThemeMessageId = MessageBusService:GetMessageId("SystemTheme", "systemThemeSetThemeOverride")
local GetSystemThemeEnabledModule = require(script:FindFirstAncestor("SystemTheme").Utils.GetSystemThemeEnabled)

return function()
	-- upvalues: GetSystemThemeEnabledModule (copy), MessageBusService (copy), SystemThemeMessageId (copy)
	if GetSystemThemeEnabledModule() then
		MessageBusService:Publish(SystemThemeMessageId, { ThemeOverride = "dark" })
	end
end