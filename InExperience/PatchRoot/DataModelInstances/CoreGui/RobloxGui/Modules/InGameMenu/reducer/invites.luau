local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local cryo = inGameMenuDependenciesModule.Cryo

return inGameMenuDependenciesModule.Rodux.createReducer({}, {
	[require(script.Parent.Parent.Actions.ReceivedUserInviteStatus).name] = function(p0, p1)
		-- upvalues: cryo (ref)
		return cryo.Dictionary.join(p0, { [p1.userId] = p1.inviteStatus })
	end
})