local _ = require(script.Types)
local Stopwatch = require(script.initializeStopwatch)()

return {
	["jest.config"] = script["jest.config"],
	Events = require(script.Events),
	Stopwatch = Stopwatch,
	TestUtils = { resetStopwatchState = Stopwatch._unsafeClearEventLog }
}