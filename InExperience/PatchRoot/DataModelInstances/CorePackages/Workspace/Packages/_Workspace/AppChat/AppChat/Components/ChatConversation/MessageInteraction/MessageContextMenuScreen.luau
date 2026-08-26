local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local messageContextMenuContainerModule = require(script.Parent.MessageContextMenuContainer)

function MessageContextMenuScreen()
	-- upvalues: useNavigation (ref), reactModule (ref), messageContextMenuContainerModule (ref)
	local var1 = useNavigation()
	
	return reactModule.createElement(messageContextMenuContainerModule, {
		messageId = var1.getParam("messageId"),
		conversationId = var1.getParam("conversationId"),
		inputBoxRef = var1.getParam("inputBoxRef")
	})
end

return MessageContextMenuScreen