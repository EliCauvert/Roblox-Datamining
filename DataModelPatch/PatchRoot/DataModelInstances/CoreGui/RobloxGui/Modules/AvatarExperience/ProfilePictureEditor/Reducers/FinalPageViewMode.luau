local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({
	finalPageViewMode = require(Modules.AvatarExperience.ProfilePictureEditor.PPEThumbnailType).Closeup
}, {
	[require(Modules.AvatarExperience.ProfilePictureEditor.Actions.SetFinalPageViewMode).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { finalPageViewMode = p2.finalPageViewMode })
	end
})