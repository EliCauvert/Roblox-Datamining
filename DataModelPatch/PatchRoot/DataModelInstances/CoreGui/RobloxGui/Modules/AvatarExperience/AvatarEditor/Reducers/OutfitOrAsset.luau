local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(Modules.AvatarExperience.Common.Types)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.AvatarEditor.Actions.SetOutfitOrAsset).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local P0 = p1 or {}
		local ItemType = p2.itemType
		local ItemTypes = {}
		
		for _, id in p2.ids do
			ItemTypes[id] = ItemType
		end
		return CryoModule.Dictionary.join(P0, ItemTypes)
	end,
	[require(Modules.AvatarExperience.Common.Actions.OutfitInformationReceived).name] = if require(Modules.AvatarExperience.Experiments.AXCombineGetOutfitDispatchesIXP).isEnabled() then function(p3, p4)
		-- upvalues: ConstantsModule (copy)
		local Copy = table.clone(p3 or {})
		local Outfit = ConstantsModule.OutfitOrAsset.Outfit
		
		for i, _ in p4.outfits do
			Copy[i] = Outfit
		end
		return Copy
	end else nil
})