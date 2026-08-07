game:DefineFastFlag("ExpChatUseUpdatedMessageRendered", false)

return function() --[[ line: 3 ]]
	return game:GetFastFlag("ExpChatUseUpdatedMessageRendered") and game:GetEngineFeature("ExpChatAddMessageRenderedSurfaceFields")
end