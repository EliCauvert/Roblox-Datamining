local corePackagesService = game:GetService("CorePackages")

return require(corePackagesService.Packages.Rodux).combineReducers({
	common = require(script.common),
	displayOptions = require(script.displayOptions),
	feedbackFlowState = require(script.feedbackFlowState),
	FetchingStatus = require(corePackagesService.Workspace.Packages.Http).Reducers.FetchingStatus
})