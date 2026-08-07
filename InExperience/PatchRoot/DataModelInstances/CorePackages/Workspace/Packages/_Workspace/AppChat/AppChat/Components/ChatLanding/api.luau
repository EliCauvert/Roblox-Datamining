local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

return {
	ConversationListUltimate = function(p0) --[[ line: 6 ]]
		-- upvalues: reactModule (ref)
		return reactModule.createElement(require(script.Parent.ConversationListUltimate), p0)
	end,
	ConversationRow = require(script.Parent.ConversationRow),
	logger = require(script.Parent.Logger),
	screenComponent = require(script.Parent.ChatLandingScreen)
}