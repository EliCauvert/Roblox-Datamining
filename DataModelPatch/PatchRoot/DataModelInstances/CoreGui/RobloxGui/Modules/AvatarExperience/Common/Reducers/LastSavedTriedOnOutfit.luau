local CorePackages = game:GetService("CorePackages")
local _ = require(script.Parent.OutfitTryOn)
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Actions.SetLastSavedTriedOnOutfit).name] = function(_, p1)
		return p1.savedOutfit
	end,
	[require(CorePackages.Workspace.Packages.AvatarExperienceCommon).State.Actions.CharacterHistoryStateChangeButtonActivated.name] = function(p1, p2)
		-- upvalues: FFlagAXRootSlotBasedEditorFlag (copy)
		return if FFlagAXRootSlotBasedEditorFlag and p2.tryOn and p2.tryOn.LastSavedTriedOnOutfit then table.clone(p2.tryOn.LastSavedTriedOnOutfit) else p1
	end
})