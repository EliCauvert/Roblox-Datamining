local CorePackages = game:GetService("CorePackages")
local ReducerUtils = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Utils.ReducerUtils

return (require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AvatarEditor.Actions.SetDefaultBodyColorRanges).name] = function(_, p1)
		-- upvalues: ReducerUtils (copy)
		return (ReducerUtils.convertDefaultBodyColorRanges(p1.defaultBodyColorRanges))
	end
}))