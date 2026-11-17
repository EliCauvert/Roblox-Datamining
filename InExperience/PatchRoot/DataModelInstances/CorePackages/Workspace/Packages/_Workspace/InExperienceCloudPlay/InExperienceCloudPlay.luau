local UnsuccessfulJoinModule = require(script.UnsuccessfulJoin)

return {
	markUnsuccessfulJoin = UnsuccessfulJoinModule.markUnsuccessfulJoin,
	consumeUnsuccessfulJoin = UnsuccessfulJoinModule.consumeUnsuccessfulJoin,
	mountCloudPlayUIOverlay = require(script.mountCloudPlayUIOverlay),
	getCloudClientService = require(script.getCloudClientService),
	showUnsupportedFeatureSnackbar = require(script.showUnsupportedFeatureSnackbar),
	["jest.config"] = script["jest.config"]
}