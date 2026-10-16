local Parent = script.Parent.Parent
local _ = require(Parent.gameInviteModalType)

return (require(Parent.Parent.React).createContext({
	isFullHeight = false,
	isFullWidth = false,
	modalMode = "default",
	modalSize = UDim2.new(0, 0, 0, 0)
}))