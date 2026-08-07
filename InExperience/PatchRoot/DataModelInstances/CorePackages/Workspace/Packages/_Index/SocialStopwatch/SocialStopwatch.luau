local eventsModule = require(script.Events)
local _ = require(script.Types)
local var1 = require(script.initializeStopwatch)()

return {
	["jest.config"] = script["jest.config"],
	Events = eventsModule,
	Stopwatch = var1,
	TestUtils = { resetStopwatchState = var1._unsafeClearEventLog }
}