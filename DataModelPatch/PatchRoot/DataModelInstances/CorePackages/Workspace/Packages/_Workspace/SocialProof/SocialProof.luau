return {
	["jest.config"] = script["jest.config"],
	RoduxKey = require(script.Common.Constants).RODUX_KEY,
	installReducer = require(script.Rodux.installReducer),
	Chips = require(script.Containers.Chips),
	UserLists = require(script.Containers.UserLists)
}