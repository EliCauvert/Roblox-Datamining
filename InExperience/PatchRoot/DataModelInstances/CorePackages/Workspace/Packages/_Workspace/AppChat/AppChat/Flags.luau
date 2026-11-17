return {
	getFFlagEnableStandaloneAppChat = require(script.getFFlagEnableStandaloneAppChat),
	getFFlagChatTabHideGroupsLinkOnVR = require(script.getFFlagChatTabHideGroupsLinkOnVR),
	FFlagAppChatConversationStore = require(script.FFlagAppChatConversationStore),
	FFlagAppChatSignalsReplyStore = require(script.FFlagAppChatSignalsReplyStore),
	FFlagAppChatPresenceStoreMigration = require(script.FFlagAppChatPresenceStoreMigration),
	FFlagAppChatMigrateChatExternalEventReceiver = require(script.FFlagAppChatMigrateChatExternalEventReceiver)
}