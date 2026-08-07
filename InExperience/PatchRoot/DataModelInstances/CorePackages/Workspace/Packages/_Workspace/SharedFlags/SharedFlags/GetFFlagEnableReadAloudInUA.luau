game:DefineFastFlag("EnableReadAloudInUA2", false)

return function() --[[ line: 3 ]]
	return game:GetEngineFeature("EnableReadAloudSetting") and game:GetFastFlag("EnableReadAloudInUA2")
end