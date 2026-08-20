return {
	getFFlagEnableModularExternalNavigationHandler = require(script.getFFlagEnableModularExternalNavigationHandler),
	getFFlagEnableStandaloneAppChat = require(script.getFFlagEnableStandaloneAppChat),
	getFFlagChatTabHideGroupsLinkOnVR = require(script.getFFlagChatTabHideGroupsLinkOnVR),
	FFlagAppChatConversationStore = require(script.FFlagAppChatConversationStore),
	FFlagAppChatSignalsMessageStore = require(script.FFlagAppChatSignalsMessageStore),
	FFlagAppChatSignalsReplyStore = require(script.FFlagAppChatSignalsReplyStore),
	FFlagAppChatPresenceStoreMigration = require(script.FFlagAppChatPresenceStoreMigration),
	FFlagAppChatUnreadMessageCountStore = require(script.FFlagAppChatUnreadMessageCountStore)
}