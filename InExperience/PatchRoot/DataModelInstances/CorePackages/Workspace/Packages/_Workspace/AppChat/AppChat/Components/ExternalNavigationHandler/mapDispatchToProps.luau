local CompleteExternalNavigationIntoChatModule = require(script.Parent.Parent.Parent.Actions.CompleteExternalNavigationIntoChat)

return function(Callback) --[[ Line: 3 ]]
	-- upvalues: CompleteExternalNavigationIntoChatModule (copy)
	return {
		completeExternalNavigation = function(p1) --[[ Line: 5 ]]
			-- upvalues: Callback (copy), CompleteExternalNavigationIntoChatModule (upval)
			Callback(CompleteExternalNavigationIntoChatModule(p1))
		end
	}
end