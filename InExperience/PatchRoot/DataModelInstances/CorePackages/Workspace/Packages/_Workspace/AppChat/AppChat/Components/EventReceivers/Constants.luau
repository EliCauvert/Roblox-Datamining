return {
	TrustedConnections = {
		Namespace = "TrustedConnectionNotifications",
		EventTypes = {
			TrustedConnectionCreated = 1,
			TrustedConnectionDeleted = 2,
			TrustedConnectionRequestSent = 3,
			TrustedConnectionRequestAccepted = 4,
			TrustedConnectionRequestIgnored = 5
		}
	},
	PlatformChatConversation = {
		Namespace = "PlatformChatConversationMessage",
		Types = {
			ConversationSuggestionsGenerated = "ConversationSuggestionsGenerated"
		}
	}
}