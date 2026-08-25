local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local parentContainerContextModule = require(script.Parent.ParentContainerContext)

return function(p0)
	-- upvalues: reactModule (ref), parentContainerContextModule (ref)
	return reactModule.createElement(parentContainerContextModule.Provider, {
		value = {
			getParentContainer = p0.getParentContainer,
			visibilitySignal = p0.visibilitySignal,
			getRequestedRoute = p0.getRequestedRoute,
			requestedRouteSignal = p0.requestedRouteSignal,
			clearRequestedRoute = p0.clearRequestedRoute,
			getShouldSetAppChatVisible = p0.getShouldSetAppChatVisible,
			entryPoint = p0.entryPoint,
			hideParentContainer = p0.hideParentContainer,
			showParentContainer = p0.showParentContainer,
			updateCurrentSquadId = p0.updateCurrentSquadId,
			openFriendsChatConversation = p0.openFriendsChatConversation
		}
	}, p0.children)
end