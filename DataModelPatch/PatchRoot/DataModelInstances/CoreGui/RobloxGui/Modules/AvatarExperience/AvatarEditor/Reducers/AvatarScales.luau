local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local config = {
	height = 1,
	width = 1,
	depth = 1,
	head = 1,
	bodyType = 0,
	proportion = 0
}

return require(CorePackages.Packages.Rodux).createReducer(config, {
	[require(Modules.AvatarExperience.AvatarEditor.Actions.SetAvatarScales).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, p2.scales)
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData).name] = function(p1, p2)
		return if p2.avatarData then p2.avatarData.scales else p1
	end,
	[require(CorePackages.Workspace.Packages.AvatarExperienceCommon).State.Actions.CharacterHistoryStateChangeButtonActivated.name] = function(p1, p2)
		-- upvalues: FFlagAXRootSlotBasedEditorFlag (copy)
		return if FFlagAXRootSlotBasedEditorFlag and p2.equipped and p2.equipped.AvatarScales then table.clone(p2.equipped.AvatarScales) else p1
	end,
	[require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).State.Actions.PurchaseItemsSuccess.name] = if require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping then function(p1, p2)
		-- upvalues: config (copy), CryoModule (copy)
		local P6 = p1 or config
		
		return if p2.bodyScales then CryoModule.Dictionary.join(P6, p2.bodyScales) else P6
	end else nil
})