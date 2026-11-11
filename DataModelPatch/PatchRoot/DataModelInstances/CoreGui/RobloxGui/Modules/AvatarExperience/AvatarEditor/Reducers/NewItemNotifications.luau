local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.Common.Actions.AddNewAssetNotification).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.assetTypeId] = true })
	end,
	[require(Modules.AvatarExperience.Common.Actions.RemoveNewAssetNotification).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.assetTypeId] = false })
	end,
	[require(Modules.AvatarExperience.Common.Actions.AddNewOutfitNotification).name] = function(p1, p2)
		-- upvalues: GetFFlagAXEnableSlotBasedEditorModule (copy), CryoModule (copy), ConstantsModule (copy)
		return if GetFFlagAXEnableSlotBasedEditorModule() then CryoModule.Dictionary.join(p1, { [p2.outfitType] = true }) elseif p2.outfitType == ConstantsModule.OutfitTypes.DynamicHead then CryoModule.Dictionary.join(p1, { [ConstantsModule.NewDHOutfitNotificationKey] = true }) else CryoModule.Dictionary.join(p1, { [ConstantsModule.NewOutfitNotificationKey] = true })
	end,
	[require(Modules.AvatarExperience.Common.Actions.RemoveNewOutfitNotification).name] = function(p1, p2)
		-- upvalues: GetFFlagAXEnableSlotBasedEditorModule (copy), CryoModule (copy), ConstantsModule (copy)
		return if GetFFlagAXEnableSlotBasedEditorModule() then CryoModule.Dictionary.join(p1, { [p2.outfitType] = false }) elseif p2.outfitType == ConstantsModule.OutfitTypes.DynamicHead then CryoModule.Dictionary.join(p1, { [ConstantsModule.NewDHOutfitNotificationKey] = false }) else CryoModule.Dictionary.join(p1, { [ConstantsModule.NewOutfitNotificationKey] = false })
	end
})