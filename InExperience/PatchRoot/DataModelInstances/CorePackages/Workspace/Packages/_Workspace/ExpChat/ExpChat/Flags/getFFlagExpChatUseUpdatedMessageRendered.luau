game:DefineFastFlag("ExpChatUseUpdatedMessageRendered", false)

return function() --[[ Line: 3 ]]
	return game:GetFastFlag("ExpChatUseUpdatedMessageRendered") and game:GetEngineFeature("ExpChatAddMessageRenderedSurfaceFields")
end