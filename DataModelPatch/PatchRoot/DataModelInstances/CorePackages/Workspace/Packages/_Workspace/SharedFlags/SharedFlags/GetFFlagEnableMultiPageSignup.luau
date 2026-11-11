game:DefineFastFlag("EnableMultiPageSignup5", false)

return function()
	return game:GetFastFlag("EnableMultiPageSignup5") and game:GetEngineFeature("MultipageSignupMetadataMapKeyAvailable")
end