game:DefineFastFlag("EnableMultiPageSignup5", false)

return function() --[[ Line: 3 ]]
	return game:GetFastFlag("EnableMultiPageSignup5") and game:GetEngineFeature("MultipageSignupMetadataMapKeyAvailable")
end