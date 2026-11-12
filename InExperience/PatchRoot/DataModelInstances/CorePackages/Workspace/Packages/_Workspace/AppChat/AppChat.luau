return {
	Components = require(script.Components),
	Hooks = {
		useConversationList = require(script.Hooks.useConversationList)
	},
	["jest.bench.config"] = script["jest.bench.config"],
	["jest.config"] = script["jest.config"]
}