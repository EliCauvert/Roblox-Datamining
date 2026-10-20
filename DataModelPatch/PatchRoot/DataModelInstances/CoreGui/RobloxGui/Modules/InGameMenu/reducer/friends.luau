local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Cryo = InGameMenuDependenciesModule.Cryo

return InGameMenuDependenciesModule.Rodux.createReducer({}, {
	[require(script.Parent.Parent.Actions.SetFriendStatus).name] = function(p1, p2)
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(p1, { [p2.userId] = p2.friendStatus or Cryo.None })
	end
})