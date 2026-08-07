-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:51 2026 Pacific Standard Time.

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