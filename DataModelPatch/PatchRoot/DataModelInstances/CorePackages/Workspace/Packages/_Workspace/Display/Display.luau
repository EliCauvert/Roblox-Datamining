return {
	["jest.config"] = script["jest.config"],
	Flags = require(script.Flags),
	GetDisplayStore = require(script.Stores.GetDisplayStore),
	getGlobalGuiInset = require(script.getGlobalGuiInset)
}