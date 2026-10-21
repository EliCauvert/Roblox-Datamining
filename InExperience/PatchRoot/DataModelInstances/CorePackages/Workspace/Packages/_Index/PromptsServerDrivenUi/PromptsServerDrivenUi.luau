return {
	["jest.config"] = script["jest.config"],
	SduiPromptsRegister = require(script.System.SduiPromptsRegister),
	registerPromptsActions = require(script.Actions.registerPromptsActions),
	registerPromptsImpressions = require(script.Impressions.registerPromptsImpressions),
	setPromptDismissedInPageScope = require(script.Actions.setPromptDismissedInPageScope)
}