local parent = script.Parent.Parent
local _ = require(parent.gameInviteModalType)

return require(parent.Parent.React).createContext({
	isFullHeight = false,
	isFullWidth = false,
	modalMode = "default",
	modalSize = UDim2.new(0, 0, 0, 0)
})