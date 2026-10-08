local groupAnnouncementSduiConstantsModule = require(script.GroupAnnouncementSduiConstants)

return {
	["jest.config"] = script["jest.config"],
	fetchGroupPeekPage = require(script.fetchGroupPeekPage),
	AppPage = groupAnnouncementSduiConstantsModule.AppPage,
	getConfigKey = groupAnnouncementSduiConstantsModule.getConfigKey
}