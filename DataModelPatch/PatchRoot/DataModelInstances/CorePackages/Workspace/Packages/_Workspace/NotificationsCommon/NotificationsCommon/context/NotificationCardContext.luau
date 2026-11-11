local Parent = script.Parent.Parent
local _ = require(Parent.type)

return (require(Parent.Parent.React).createContext({
	notificationPayload = nil,
	state = nil,
	cardSize = nil,
	handleActions = nil,
	openMetaActions = nil,
	readOnly = nil,
	cardTransparency = nil
}))