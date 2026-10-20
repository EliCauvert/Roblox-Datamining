local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local ParentContainerContextModule = require(script.Parent.ParentContainerContext)

return function(p1)
	-- upvalues: ReactModule (copy), ParentContainerContextModule (copy)
	return ReactModule.createElement(ParentContainerContextModule.Provider, {
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
			updateCurrentSquadId = p1.updateCurrentSquadId
		}
	}, p1.children)
end