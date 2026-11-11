local _ = require(script.RccRealtimeTypes)

return {
	["jest.config"] = script["jest.config"],
	RccEventReceiver = require(script.RccEventReceiver)
}