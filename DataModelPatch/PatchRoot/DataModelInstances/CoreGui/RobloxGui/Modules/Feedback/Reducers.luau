local CorePackages = game:GetService("CorePackages")

return (require(CorePackages.Packages.Rodux).combineReducers({
	common = require(script.common),
	displayOptions = require(script.displayOptions),
	feedbackFlowState = require(script.feedbackFlowState),
	FetchingStatus = require(CorePackages.Workspace.Packages.Http).Reducers.FetchingStatus
}))