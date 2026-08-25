local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local messageContextMenuContainerModule = require(script.Parent.MessageContextMenuContainer)

function MessageContextMenuScreen()
	-- upvalues: useNavigation (ref), reactModule (ref), messageContextMenuContainerModule (ref)
	local var2 = useNavigation()
	
	return reactModule.createElement(messageContextMenuContainerModule, {
		messageId = var2.getParam("messageId"),
		conversationId = var2.getParam("conversationId"),
		inputBoxRef = var2.getParam("inputBoxRef")
	})
end

return MessageContextMenuScreen