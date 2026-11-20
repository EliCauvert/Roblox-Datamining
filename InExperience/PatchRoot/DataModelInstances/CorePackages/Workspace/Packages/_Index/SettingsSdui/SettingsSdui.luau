return {
	["jest.config"] = script["jest.config"],
	SduiSettingsPage = require(script.SduiSettingsPage),
	fetchSettingsPage = require(script.fetchSettingsPage),
	registerUserSettingsActions = require(script.registerUserSettingsActions),
	getSduiUpdateUserSettingsAction = function()
		return require(script.SduiUpdateUserSettingsAction)
	end
}