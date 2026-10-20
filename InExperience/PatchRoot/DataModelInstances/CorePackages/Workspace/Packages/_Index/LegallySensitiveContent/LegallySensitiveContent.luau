local UserSettingsServiceModule = require(script.Services.userSettingsService)

return {
	["jest.config"] = script["jest.config"],
	ConsentName = require(script.Enums.ConsentName),
	UserSetting = require(script.Enums.UserSetting),
	useLegallySensitiveContentAndActions = require(script.useTranslatedLegallySensitiveContentAndActions),
	updateUserSettings = UserSettingsServiceModule.updateUserSettings,
	updateUserSettingV2 = UserSettingsServiceModule.updateUserSettingV2
}