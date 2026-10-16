game:DefineFastFlag("EnableStorePreviousAccountData", false)

return function() --[[ Line: 3 ]]
	return game:GetFastFlag("EnableStorePreviousAccountData") and game:GetEngineFeature("PreviousAccountsListAvailable")
end