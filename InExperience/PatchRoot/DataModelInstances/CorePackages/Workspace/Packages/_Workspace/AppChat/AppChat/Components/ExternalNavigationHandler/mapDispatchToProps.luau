local completeExternalNavigationIntoChatModule = require(script.Parent.Parent.Parent.Actions.CompleteExternalNavigationIntoChat)

return function(p1)
	-- upvalues: completeExternalNavigationIntoChatModule (ref)
	return {
		completeExternalNavigation = function(p2)
			-- upvalues: p1 (ref), completeExternalNavigationIntoChatModule (copy)
			p1(completeExternalNavigationIntoChatModule(p2))
		end
	}
end