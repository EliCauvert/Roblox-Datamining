game:DefineFastFlag("FixLimitedBundleResalePrerequisite", false)

return function()
	return game:GetFastFlag("FixLimitedBundleResalePrerequisite") and game:GetEngineFeature("FixLimitedBundleResale")
end