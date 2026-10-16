local Parent = script.Parent.Parent
local _ = require(Parent.gameInviteModalType)

return (require(Parent.Parent.React).createContext({
	serverType = "",
	promptMessage = "",
	trigger = "",
	isCoreScript = false,
	gameDetails = {}
}))