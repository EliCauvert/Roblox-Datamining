local _ = require(script.createPageTracker)

return {
	["jest.config"] = script["jest.config"],
	usePageTracker = require(script.Hooks.usePageTracker),
	ComponentTracker = require(script.Components.ComponentTracker)
}