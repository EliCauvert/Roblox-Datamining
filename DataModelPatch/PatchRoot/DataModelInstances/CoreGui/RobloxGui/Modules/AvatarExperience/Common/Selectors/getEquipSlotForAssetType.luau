local CorePackages = game:GetService("CorePackages")
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)
local SlotEditorCategories = AvatarExperienceSlotBasedEditorModule.Constants.SlotEditorCategories
local Categories = AvatarExperienceSlotBasedEditorModule.Enums.Categories
local FFlagAXCustomizeMakeupSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport
local t = {}

for _, slotEditorCategory in SlotEditorCategories do
	for _, slot in slotEditorCategory.slots do
		if not slot.hide and slot.assetTypes then
			for _, assetType in slot.assetTypes do
				t[tostring(assetType.Value)] = {
					categoryKey = slotEditorCategory.nameTranslationKey,
					slotKey = slot.nameTranslationKey
				}
			end
		end
	end
end
if FFlagAXCustomizeMakeupSupport then
	local NameTranslationKey = SlotEditorCategories[Categories.Makeup].nameTranslationKey
	t[ConstantsModule.AssetTypeIdStrings.EyeMakeup] = {
		slotKey = "Feature.Catalog.Label.EyeMakeup",
		categoryKey = NameTranslationKey
	}
	t[ConstantsModule.AssetTypeIdStrings.FaceMakeup] = {
		slotKey = "Feature.Catalog.Label.FaceMakeup",
		categoryKey = NameTranslationKey
	}
	t[ConstantsModule.AssetTypeIdStrings.LipMakeup] = {
		slotKey = "Feature.Catalog.Label.LipMakeup",
		categoryKey = NameTranslationKey
	}
end
t[ConstantsModule.AssetTypeIdStrings.EmoteAnimation] = {
	categoryKey = SlotEditorCategories[Categories.Emotes].nameTranslationKey
}
local config = {
	[ConstantsModule.BundleTypeIdStrings.BodyParts] = {
		slotKey = "Feature.Catalog.Label.FullBody",
		categoryKey = SlotEditorCategories[Categories.Body].nameTranslationKey
	},
	[ConstantsModule.BundleTypeIdStrings.DynamicHead] = {
		slotKey = "Feature.Avatar.Label.Head",
		categoryKey = SlotEditorCategories[Categories.Body].nameTranslationKey
	},
	[ConstantsModule.BundleTypeIdStrings.Shoes] = {
		slotKey = "Feature.Avatar.Label.Shoes",
		categoryKey = SlotEditorCategories[Categories.Clothing].nameTranslationKey
	},
	[ConstantsModule.BundleTypeIdStrings.Animations] = {
		slotKey = "Feature.Avatar.Label.AnimationFullSet",
		categoryKey = SlotEditorCategories[Categories.Animations].nameTranslationKey
	}
}

return function(Asset, p1)
	-- upvalues: ConstantsModule (copy), t (copy), config (copy)
	return if Asset == ConstantsModule.ItemType.Asset then t[p1] elseif Asset == ConstantsModule.ItemType.Bundle then config[p1] else nil
end