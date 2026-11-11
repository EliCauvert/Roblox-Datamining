local _ = require(script.BugReporterTypes)

return {
	BugReporterEventReceiver = require(script.BugReporterEventReceiver),
	BugReporterModalContainer = require(script.BugReporterModalContainer),
	["jest.config"] = script["jest.config"]
}