return {
	["jest.config"] = script["jest.config"],
	installReducer = require(script.Rodux.installReducer),
	RoduxKey = require(script.Common.Constants).RODUX_KEY,
	PurchaseExperienceModal = require(script.Components.PurchaseExperienceModal),
	UnableToJoinExperienceModal = require(script.Components.UnableToJoinExperienceModal),
	useJoinUserInExperience = require(script.Hooks.useJoinUserInExperience)
}