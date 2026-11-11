local CompleteExternalNavigationIntoChatModule = require(game:GetService("CorePackages").Workspace.Packages.AppChat.CompleteExternalNavigationIntoChat)

return function(Callback)
	-- upvalues: CompleteExternalNavigationIntoChatModule (copy)
	return {
		completeExternalNavigation = function(p1)
			-- upvalues: Callback (copy), CompleteExternalNavigationIntoChatModule (upval)
			Callback(CompleteExternalNavigationIntoChatModule(p1))
		end
	}
end