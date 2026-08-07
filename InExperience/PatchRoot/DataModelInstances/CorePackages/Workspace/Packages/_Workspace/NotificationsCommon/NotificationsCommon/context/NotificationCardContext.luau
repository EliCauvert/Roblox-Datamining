local parent = script.Parent.Parent
local _ = require(parent.type)

return require(parent.Parent.React).createContext({
	notificationPayload = nil,
	state = nil,
	cardSize = nil,
	handleActions = nil,
	openMetaActions = nil,
	readOnly = nil,
	cardTransparency = nil
})