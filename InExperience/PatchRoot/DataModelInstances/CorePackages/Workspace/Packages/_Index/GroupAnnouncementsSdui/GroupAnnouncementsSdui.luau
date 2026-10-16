local GroupAnnouncementSduiConstantsModule = require(script.GroupAnnouncementSduiConstants)

return {
	["jest.config"] = script["jest.config"],
	fetchGroupPeekPage = require(script.fetchGroupPeekPage),
	AppPage = GroupAnnouncementSduiConstantsModule.AppPage,
	getConfigKey = GroupAnnouncementSduiConstantsModule.getConfigKey
}