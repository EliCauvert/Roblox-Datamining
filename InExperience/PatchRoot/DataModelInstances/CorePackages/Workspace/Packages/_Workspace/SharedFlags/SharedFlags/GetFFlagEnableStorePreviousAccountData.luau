game:DefineFastFlag("EnableStorePreviousAccountData", false)

return function() --[[ line: 3 ]]
	return game:GetFastFlag("EnableStorePreviousAccountData") and game:GetEngineFeature("PreviousAccountsListAvailable")
end