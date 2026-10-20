return {
	addConversation = require(script.addConversation),
	reportToDiagByCountryCode = require(script.reportToDiagByCountryCode),
	getAppChatNavbarItemConfig = require(script.getAppChatNavbarItemConfig),
	getAppChatCommunitiesVisualConfig = require(script.getAppChatCommunitiesVisualConfig),
	shouldShowOSAForConversation = require(script.shouldShowOSAForConversation),
	shouldShowU13ChatOptInForConversation = require(script.shouldShowU13ChatOptInForConversation),
	shouldBlockConversationAccess = require(script.shouldBlockConversationAccess),
	navigateWithOsaGate = require(script.navigateWithOsaGate)
}