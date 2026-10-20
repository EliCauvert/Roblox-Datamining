local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local MessageContextMenuContainerModule = require(script.Parent.MessageContextMenuContainer)

function MessageContextMenuScreen()
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), MessageContextMenuContainerModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	
	return ReactModule.createElement(MessageContextMenuContainerModule, {
		messageId = UseNavigationResult.getParam("messageId"),
		conversationId = UseNavigationResult.getParam("conversationId"),
		inputBoxRef = UseNavigationResult.getParam("inputBoxRef")
	})
end

return MessageContextMenuScreen