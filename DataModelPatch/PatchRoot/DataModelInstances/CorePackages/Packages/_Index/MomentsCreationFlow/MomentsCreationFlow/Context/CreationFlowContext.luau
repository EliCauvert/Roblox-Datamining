local Parent = script:FindFirstAncestor("MomentsCreationFlow").Parent
local DashModule = require(Parent.Dash)

return require(Parent.React).createContext({
	captures = {},
	capturesPagesIsFinished = DashModule.noop,
	createMoment = DashModule.noop,
	exitCreationFlow = DashModule.noop,
	fetchAdditionalCaptures = DashModule.noop,
	fetchInitialCaptures = DashModule.noop,
	fireEvent = DashModule.noop,
	getLocalization = DashModule.noop,
	getUserConfiguration = DashModule.noop,
	isTextFiltered = DashModule.noop,
	setScreenOrientation = DashModule.noop
})