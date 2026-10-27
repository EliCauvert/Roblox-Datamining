local GroupPeekSduiConstantsModule = require(script.GroupPeekSduiConstants)

return {
	["jest.config"] = script["jest.config"],
	fetchGroupPeekPage = require(script.fetchGroupPeekPage),
	registerGroupAnnouncementActions = require(script.registerGroupAnnouncementActions),
	AppPage = GroupPeekSduiConstantsModule.AppPage,
	Identifiers = GroupPeekSduiConstantsModule.Identifiers,
	getConfigKey = GroupPeekSduiConstantsModule.getConfigKey
}