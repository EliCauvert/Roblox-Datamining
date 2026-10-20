local ReceivedCanShowUserAliasFunction = require(game:GetService("CorePackages").Workspace.Packages.AppChat.RoduxAliases).Actions.ReceivedCanShowUserAlias

return function(Callback)
	-- upvalues: ReceivedCanShowUserAliasFunction (copy)
	return {
		receivedCanShowUserAlias = function(p1)
			-- upvalues: Callback (copy), ReceivedCanShowUserAliasFunction (upval)
			Callback(ReceivedCanShowUserAliasFunction(p1))
		end
	}
end