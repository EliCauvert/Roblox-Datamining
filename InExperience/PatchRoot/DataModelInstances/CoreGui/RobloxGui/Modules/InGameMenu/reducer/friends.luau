local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local cryo = inGameMenuDependenciesModule.Cryo

return inGameMenuDependenciesModule.Rodux.createReducer({}, {
	[require(script.Parent.Parent.Actions.SetFriendStatus).name] = function(p1, p2)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p1, { [p2.userId] = p2.friendStatus or cryo.None })
	end
})