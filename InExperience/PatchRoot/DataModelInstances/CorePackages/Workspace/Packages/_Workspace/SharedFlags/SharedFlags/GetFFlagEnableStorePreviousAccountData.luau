game:DefineFastFlag("EnableStorePreviousAccountData", false)

return function()
	return game:GetFastFlag("EnableStorePreviousAccountData") and game:GetEngineFeature("PreviousAccountsListAvailable")
end