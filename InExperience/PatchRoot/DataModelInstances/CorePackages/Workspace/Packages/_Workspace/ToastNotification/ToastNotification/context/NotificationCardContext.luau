local Parent = script.Parent.Parent
local _ = require(Parent.type)

return (require(Parent.Parent.React).createContext({
	state = nil,
	cardSize = nil,
	handleActions = nil,
	cardTransparency = nil,
	notificationReceivedTimestampMs = nil,
	timers = nil,
	displayTimestampMs = nil
}))