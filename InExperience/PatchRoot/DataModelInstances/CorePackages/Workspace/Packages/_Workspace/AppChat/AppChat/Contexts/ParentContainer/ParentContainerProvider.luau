local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local parentContainerContextModule = require(script.Parent.ParentContainerContext)

return function(p1)
	-- upvalues: reactModule (ref), parentContainerContextModule (ref)
	return reactModule.createElement(parentContainerContextModule.Provider, {
		value = {
			getParentContainer = p1.getParentContainer,
			visibilitySignal = p1.visibilitySignal,
			getRequestedRoute = p1.getRequestedRoute,
			requestedRouteSignal = p1.requestedRouteSignal,
			clearRequestedRoute = p1.clearRequestedRoute,
			getShouldSetAppChatVisible = p1.getShouldSetAppChatVisible,
			entryPoint = p1.entryPoint,
			hideParentContainer = p1.hideParentContainer,
			showParentContainer = p1.showParentContainer,
			updateCurrentSquadId = p1.updateCurrentSquadId,
			openFriendsChatConversation = p1.openFriendsChatConversation
		}
	}, p1.children)
end