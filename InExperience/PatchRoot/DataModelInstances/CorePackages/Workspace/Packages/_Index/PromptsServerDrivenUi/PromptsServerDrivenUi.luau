return {
	["jest.config"] = script["jest.config"],
	registerPromptsActions = require(script.Actions.registerPromptsActions),
	registerPromptsImpressions = require(script.Impressions.registerPromptsImpressions),
	setPromptDismissedInPageScope = require(script.Actions.setPromptDismissedInPageScope)
}