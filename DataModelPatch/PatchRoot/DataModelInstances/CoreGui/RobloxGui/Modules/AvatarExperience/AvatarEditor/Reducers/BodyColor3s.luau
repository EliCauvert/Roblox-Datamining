local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(Modules.AvatarExperience.Common.Types)
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local config = {
	headColor3 = ConstantsModule.DefaultBodyColor3,
	leftArmColor3 = ConstantsModule.DefaultBodyColor3,
	leftLegColor3 = ConstantsModule.DefaultBodyColor3,
	rightArmColor3 = ConstantsModule.DefaultBodyColor3,
	rightLegColor3 = ConstantsModule.DefaultBodyColor3,
	torsoColor3 = ConstantsModule.DefaultBodyColor3
}

return require(CorePackages.Packages.Rodux).createReducer(config, {
	[require(Modules.AvatarExperience.AvatarEditor.Actions.SetBodyColor3s).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return (CryoModule.Dictionary.join(p1, p2.bodyColor3s))
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData).name] = function(_, p1)
		return p1.avatarData.bodyColor3s
	end,
	[require(CorePackages.Workspace.Packages.AvatarExperienceCommon).State.Actions.CharacterHistoryStateChangeButtonActivated.name] = function(p1, p2)
		-- upvalues: FFlagAXRootSlotBasedEditorFlag (copy)
		return if FFlagAXRootSlotBasedEditorFlag and p2.equipped and p2.equipped.BodyColor3s then table.clone(p2.equipped.BodyColor3s) else p1
	end,
	[require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).State.Actions.PurchaseItemsSuccess.name] = if require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping then function(p1, p2)
		-- upvalues: config (copy), CryoModule (copy)
		local P6 = p1 or config
		
		return if p2.bodyColor3s then CryoModule.Dictionary.join(P6, p2.bodyColor3s) else P6
	end else nil
})