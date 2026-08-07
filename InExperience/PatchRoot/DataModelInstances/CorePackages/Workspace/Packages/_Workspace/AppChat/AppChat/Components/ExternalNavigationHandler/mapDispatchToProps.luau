local completeExternalNavigationIntoChatModule = require(script.Parent.Parent.Parent.Actions.CompleteExternalNavigationIntoChat)

return function(p0) --[[ line: 3 ]]
	-- upvalues: completeExternalNavigationIntoChatModule (ref)
	return {
		completeExternalNavigation = function(p1) --[[ line: 5 ]]
			-- upvalues: p0 (ref), completeExternalNavigationIntoChatModule (copy)
			p0(completeExternalNavigationIntoChatModule(p1))
		end
	}
end