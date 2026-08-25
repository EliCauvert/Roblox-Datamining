game:DefineFastFlag("EnableReadAloudInUA2", false)

return function()
	return game:GetEngineFeature("EnableReadAloudSetting") and game:GetFastFlag("EnableReadAloudInUA2")
end