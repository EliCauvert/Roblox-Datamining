return {
	["jest.config"] = script["jest.config"],
	ConsentName = require(script.Enums.ConsentName),
	useLegallySensitiveContentAndActions = require(script.useTranslatedLegallySensitiveContentAndActions),
	updateUserSettings = require(script.Services.userSettingsService).updateUserSettings
}