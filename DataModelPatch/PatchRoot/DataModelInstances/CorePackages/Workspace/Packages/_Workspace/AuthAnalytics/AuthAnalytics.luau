return {
	dependencies = require(script.dependencies),
	Events = require(script.Events),
	EventStreamConstants = require(script.Constants.EventStreamConstants),
	authTimingUtil = require(script.Utils.authTimingUtil),
	TelemetryConfigs = require(script.RobloxTelemetry.TelemetryConfigs),
	RobloxTelemetry = require(script.RobloxTelemetry),
	["jest.config"] = script["jest.config"]
}