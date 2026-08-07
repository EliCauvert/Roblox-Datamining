local parent = script:FindFirstAncestor("MomentsCreationFlow").Parent
local dashModule = require(parent.Dash)

return require(parent.React).createContext({
	captures = {},
	capturesPagesIsFinished = dashModule.noop,
	createMoment = dashModule.noop,
	exitCreationFlow = dashModule.noop,
	fetchAdditionalCaptures = dashModule.noop,
	fetchInitialCaptures = dashModule.noop,
	fireEvent = dashModule.noop,
	getLocalization = dashModule.noop,
	getUserConfiguration = dashModule.noop,
	isTextFiltered = dashModule.noop,
	setScreenOrientation = dashModule.noop
})