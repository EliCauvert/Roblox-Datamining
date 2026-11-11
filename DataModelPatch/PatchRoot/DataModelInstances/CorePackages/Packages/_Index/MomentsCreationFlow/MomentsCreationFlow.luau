local _ = require(script.Parent.MomentsCommon)

return {
	EventNames = require(script.Analytics.EventNames),
	Actions = {
		CreationFlowStateUpdated = require(script.Actions.CreationFlowStateUpdated),
		SelectedCaptureUpdated = require(script.Actions.SelectedCaptureUpdated)
	},
	Constants = { RoduxKey = require(script.Constants).RoduxKey },
	installReducer = require(script.Reducers.installReducer),
	CreationFlowContext = require(script.Context.CreationFlowContext),
	CreationFlowContextProvider = require(script.Context.CreationFlowContextProvider),
	CreationFlowScreen = require(script.Components.CreationFlowScreen),
	Enums = {
		CreationFlowState = require(script.Enums.CreationFlowState)
	},
	CreationFlowLocalization = require(script.Enums.CreationFlowLocalization),
	["jest.config"] = script["jest.config"]
}