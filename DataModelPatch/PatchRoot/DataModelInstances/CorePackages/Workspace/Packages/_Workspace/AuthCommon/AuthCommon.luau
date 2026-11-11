return {
	["jest.config"] = script["jest.config"],
	Components = require(script.Components),
	Common = require(script.Common),
	Actions = require(script.Actions),
	Enums = require(script.Enums),
	Http = require(script.Http),
	Models = require(script.Models),
	Thunks = require(script.Thunks),
	Utils = require(script.Utils),
	Reducers = require(script.Reducers),
	Analytics = require(script.Analytics),
	installReducer = require(script.Reducers.installReducer),
	RoduxKey = require(script.Common.Constants).RODUX_KEY,
	Hooks = require(script.Hooks),
	EventReceivers = require(script.EventReceivers),
	Experiments = require(script.Experiments),
	Stores = require(script.Stores)
}