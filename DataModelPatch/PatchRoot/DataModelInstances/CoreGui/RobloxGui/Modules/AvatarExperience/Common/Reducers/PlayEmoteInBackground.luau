local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return (require(CorePackages.Packages.Rodux).createReducer({ shouldPlayEmoteInBackground = false }, {
	[require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Actions.SetPlayEmoteInBackground).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			shouldPlayEmoteInBackground = p2.shouldPlayEmoteInBackground
		})
	end
}))