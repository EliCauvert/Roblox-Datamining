local parent = script.Parent.Parent
local _ = require(parent.gameInviteModalType)

return require(parent.Parent.React).createContext({
	serverType = "",
	promptMessage = "",
	trigger = "",
	isCoreScript = false,
	gameDetails = {}
})