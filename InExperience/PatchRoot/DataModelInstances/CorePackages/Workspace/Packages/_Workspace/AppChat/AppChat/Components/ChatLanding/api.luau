local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

return {
	ConversationListUltimate = function(p1) --[[ Line: 6 ]]
		-- upvalues: ReactModule (copy)
		return ReactModule.createElement(require(script.Parent.ConversationListUltimate), p1)
	end,
	ConversationRow = require(script.Parent.ConversationRow),
	logger = require(script.Parent.Logger),
	screenComponent = require(script.Parent.ChatLandingScreen)
}