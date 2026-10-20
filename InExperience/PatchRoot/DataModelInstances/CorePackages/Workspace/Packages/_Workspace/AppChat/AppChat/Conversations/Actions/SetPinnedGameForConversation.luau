return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(UniverseId, RootPlaceId, ConversationId)
	return {
		universeId = UniverseId,
		rootPlaceId = RootPlaceId,
		conversationId = ConversationId
	}
end)