local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView

return require(CorePackages.Packages.Rodux).createReducer(require(Modules.AvatarExperience.Common.Constants).FullViewPageDefaults, {
	[require(Modules.AvatarExperience.Common.Actions.SetFullView).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.avatarScreen] = p2.fullViewStatus })
	end
})