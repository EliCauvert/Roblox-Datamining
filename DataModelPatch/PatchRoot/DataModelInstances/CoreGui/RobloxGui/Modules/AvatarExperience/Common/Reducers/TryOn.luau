local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag

return require(CorePackages.Packages.Rodux).createReducer({
	AnimationPreview = nil,
	AnimationPreviewAssetTypeIdString = nil
}, {
	[require(Modules.AvatarExperience.Common.Actions.ClearAnimationPreview).name] = function(p1, _)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			AnimationPreview = CryoModule.None,
			AnimationPreviewAssetTypeIdString = CryoModule.None
		})
	end,
	[require(Modules.AvatarExperience.Common.Actions.SetAnimationPreview).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			AnimationPreview = p2.assetId,
			AnimationPreviewAssetTypeIdString = p2.assetTypeIdString
		})
	end,
	[require(CorePackages.Workspace.Packages.AvatarExperienceCommon).State.Actions.CharacterHistoryStateChangeButtonActivated.name] = function(p1, p2)
		-- upvalues: FFlagAXRootSlotBasedEditorFlag (copy)
		return if FFlagAXRootSlotBasedEditorFlag and p2.tryOn and p2.tryOn.TryOn then table.clone(p2.tryOn.TryOn) else p1
	end
})