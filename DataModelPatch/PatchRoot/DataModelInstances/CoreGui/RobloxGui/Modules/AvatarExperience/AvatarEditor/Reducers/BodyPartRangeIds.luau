local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local t = {}

return require(CorePackages.Packages.Rodux).createReducer(t, {
	[require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AvatarEditor.Actions.SetBodyPartRangeIds).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return (CryoModule.Dictionary.join(p1, p2.bodyPartRangeIds))
	end,
	[require(CorePackages.Workspace.Packages.AvatarExperienceCommon).State.Actions.CharacterHistoryStateChangeButtonActivated.name] = function(p1, p2)
		-- upvalues: FFlagAXRootSlotBasedEditorFlag (copy)
		return if FFlagAXRootSlotBasedEditorFlag and p2.equipped and p2.equipped.BodyPartRangeIds then table.clone(p2.equipped.BodyPartRangeIds) else p1
	end,
	[require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).State.Actions.PurchaseItemsSuccess.name] = if require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping then function(p1, p2)
		-- upvalues: t (copy), CryoModule (copy)
		local P4 = p1 or t
		
		return if p2.bodyPartColorRangeIds then CryoModule.Dictionary.join(P4, p2.bodyPartColorRangeIds) else P4
	end else nil
})