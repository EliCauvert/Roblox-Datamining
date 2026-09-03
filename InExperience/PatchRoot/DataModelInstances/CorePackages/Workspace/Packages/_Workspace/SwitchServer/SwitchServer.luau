return {
	Constants = require(script.Constants),
	SwitchServerConfirmation = require(script.SwitchServerConfirmation),
	SwitchServerTelemetry = require(script.Telemetry.SwitchServerTelemetry),
	GetSwitchServerStore = require(script.Stores.GetSwitchServerStore),
	["jest.config"] = script["jest.config"]
}