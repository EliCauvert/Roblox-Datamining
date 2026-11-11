local Parent = script.Parent.Parent

return {
	projects = {
		require(Parent.ScreenTime)["jest.config"],
		require(Parent.SettingsTabVisibility)["jest.config"],
		require(Parent.VerifiedParentalConsentDialog)["jest.config"],
		require(Parent.LegallySensitiveContent)["jest.config"]
	}
}