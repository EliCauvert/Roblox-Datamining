local UnsuccessfulJoinModule = require(script.UnsuccessfulJoin)

return {
	markUnsuccessfulJoin = UnsuccessfulJoinModule.markUnsuccessfulJoin,
	consumeUnsuccessfulJoin = UnsuccessfulJoinModule.consumeUnsuccessfulJoin,
	mountCloudPlayUIOverlay = require(script.mountCloudPlayUIOverlay),
	["jest.config"] = script["jest.config"]
}