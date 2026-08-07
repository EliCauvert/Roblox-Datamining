local parent = script.Parent.Parent
local _ = require(parent.type)

return require(parent.Parent.React).createContext({
	state = nil,
	cardSize = nil,
	handleActions = nil,
	cardTransparency = nil,
	notificationReceivedTimestampMs = nil,
	timers = nil,
	displayTimestampMs = nil
})