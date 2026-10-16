local Settings = script:FindFirstAncestor("Settings")
local Integrations = Settings.Integrations

return {
	Settings = if require(Settings.Flags).FFlagRefactorInExpSettingsInDevelopment then require(Integrations.Settings) else nil,
	Constants = require(Integrations.Constants),
	Utils = require(Integrations.Utils)
}