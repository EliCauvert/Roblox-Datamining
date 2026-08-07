local settings = script:FindFirstAncestor("Settings")
local integrations = settings.Integrations

return {
	Settings = if require(settings.Flags).FFlagRefactorInExpSettingsInDevelopment then require(integrations.Settings) else nil,
	Constants = require(integrations.Constants),
	Utils = require(integrations.Utils)
}