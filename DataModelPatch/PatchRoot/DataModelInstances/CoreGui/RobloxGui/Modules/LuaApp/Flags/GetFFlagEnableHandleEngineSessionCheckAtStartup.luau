game:DefineFastFlag("EnableHandleEngineSessionCheckAtStartup", false)

return function()
	return game:GetFastFlag("EnableHandleEngineSessionCheckAtStartup") and game:GetEngineFeature("SessionCheckInEngineEnabled")
end