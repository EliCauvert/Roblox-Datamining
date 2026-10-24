local DestinationModule = require(script.Destination)

return {
	fallbackWebUrl = DestinationModule.fallbackWebUrl,
	resolveDestination = DestinationModule.resolveDestination,
	logExposure = DestinationModule.logExposure,
	resolveAndLogDestination = DestinationModule.resolveAndLogDestination,
	logBuyRobuxRoutingCallsite = require(script.logBuyRobuxRoutingCallsite),
	["jest.config"] = script["jest.config"]
}