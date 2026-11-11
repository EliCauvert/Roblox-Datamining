return {
	Constants = require(script.Constants),
	HttpRequests = require(script.HttpRequests),
	Utils = require(script.Utils),
	GetFFlagScreenTimeSignalR = require(script.Flags.GetFFlagScreenTimeSignalR),
	GetFFlagEnableParentalControlsScreentimeEnforcement = require(script.Flags.GetFFlagEnableParentalControlsScreentimeEnforcement),
	["jest.config"] = script["jest.config"]
}