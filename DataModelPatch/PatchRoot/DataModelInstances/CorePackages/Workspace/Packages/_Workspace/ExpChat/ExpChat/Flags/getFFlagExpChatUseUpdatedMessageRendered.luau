game:DefineFastFlag("ExpChatUseUpdatedMessageRendered", false)

return function()
	return game:GetFastFlag("ExpChatUseUpdatedMessageRendered") and game:GetEngineFeature("ExpChatAddMessageRenderedSurfaceFields")
end