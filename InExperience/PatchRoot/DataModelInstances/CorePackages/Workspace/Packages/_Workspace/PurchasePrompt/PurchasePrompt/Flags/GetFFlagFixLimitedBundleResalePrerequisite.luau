game:DefineFastFlag("FixLimitedBundleResalePrerequisite", false)

return function() --[[ line: 3 ]]
	return game:GetFastFlag("FixLimitedBundleResalePrerequisite") and game:GetEngineFeature("FixLimitedBundleResale")
end