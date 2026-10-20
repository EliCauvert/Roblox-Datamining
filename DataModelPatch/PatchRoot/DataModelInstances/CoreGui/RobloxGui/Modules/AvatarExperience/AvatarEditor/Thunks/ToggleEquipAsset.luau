local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local TutilsModule = require(CorePackages.Packages.tutils)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarExperienceRoduxModule = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local ToggleEquipAssetModule = require(Modules.AvatarExperience.AvatarEditor.Actions.ToggleEquipAsset)
local ClearTryOnsFunction = AvatarExperienceRoduxModule.Actions.ClearTryOns
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ClearCurrentSortModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.ClearCurrentSort)
local StartedWaitingOnLCUpdateModule = require(Modules.AvatarExperience.Common.Actions.StartedWaitingOnLCUpdate)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local _ = require(Modules.AvatarExperience.Common.Types)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local ToggleTryOnFunction = AvatarExperienceRoduxModule.Actions.ToggleTryOn
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local MaxHats = require(Modules.AvatarExperience.AvatarEditor.Constants).MaxHats
local config = {
	toastMessage = "Feature.Avatar.Message.HatLimitTooltip",
	isLocalized = false,
	toastType = ToastTypeModule.InformationMessage
}
local config1 = {
	toastMessage = "Feature.Avatar.EmoteAlreadyAssigned",
	isLocalized = false,
	toastType = ToastTypeModule.InformationMessage
}

return function(EmoteAnimation, AssetId, p1, p2, Order, p3, p4)
	-- upvalues: CryoModule (copy), ClearTryOnsFunction (copy), NavigationUtilsModule (copy), FFlagAXMISEnableMultiShopping (copy), ToggleTryOnFunction (copy), ConstantsModule (copy), SetCurrentToastMessageModule (copy), config1 (copy), TutilsModule (copy), MaxHats (copy), config (copy), ClearCurrentSortModule (copy), StartedWaitingOnLCUpdateModule (copy), UtilsModule (copy), ToggleEquipAssetModule (copy), FFlagAXCustomizeMakeupSupport (copy)
	return function(p5): boolean
		-- upvalues: p2 (copy), CryoModule (upval), ClearTryOnsFunction (upval), p1 (copy), NavigationUtilsModule (upval), FFlagAXMISEnableMultiShopping (upval), ToggleTryOnFunction (upval), ConstantsModule (upval), EmoteAnimation (copy), AssetId (copy), SetCurrentToastMessageModule (upval), config1 (upval), TutilsModule (upval), MaxHats (upval), config (upval), ClearCurrentSortModule (upval), StartedWaitingOnLCUpdateModule (upval), UtilsModule (upval), ToggleEquipAssetModule (upval), FFlagAXCustomizeMakeupSupport (upval), p4 (copy), Order (copy), p3 (copy)
		local EquippedAssets = p5:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets
		
		if not EquippedAssets then
			return false
		end
		if p5:getState().AvatarExperience.LayeredClothingSort.CharacterUpdatesLocked then
			return false
		end
		if p2 then
			if FFlagAXMISEnableMultiShopping then
				p5:dispatch(ToggleTryOnFunction(ConstantsModule.ItemType.Asset, EmoteAnimation, AssetId, false))
				
				if p1 then
					NavigationUtilsModule.closeFiltersAndItemDetails(p1)
				end
			end
		elseif not CryoModule.isEmpty(p5:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems) then
			p5:dispatch(ClearTryOnsFunction())
			
			if p1 then
				NavigationUtilsModule.closeFiltersAndItemDetails(p1)
			end
		end
		if EmoteAnimation == ConstantsModule.AssetTypeIdStrings.EmoteAnimation then
			local EquippedEmotes = p5:getState().AvatarExperience.AvatarEditor.EquippedEmotes
			local Slot = EquippedEmotes.slotInfo[EquippedEmotes.selectedSlot]
			
			if not Slot or Slot.assetId ~= AssetId then
				for _, value in EquippedEmotes.slotInfo do
					if value.assetId == AssetId then
						p5:dispatch(SetCurrentToastMessageModule(config1))
						
						return false
					end
				end
			end
		end
		local EquippedAsset = EquippedAssets[ConstantsModule.AssetTypeIdStrings.Hat]
		local FieldCountResult = if EquippedAsset then TutilsModule.fieldCount(EquippedAsset) else 0
		
		if EmoteAnimation == ConstantsModule.AssetTypeIdStrings.Hat and EquippedAsset and MaxHats <= FieldCountResult then
			local EquippedAsset1 = EquippedAsset or {}
			
			if not (if EquippedAsset1[AssetId] then true else false) then
				p5:dispatch(SetCurrentToastMessageModule(config))
				
				return false
			end
		end
		if #p5:getState().AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList ~= 0 then
			p5:dispatch(ClearCurrentSortModule())
		end
		if ConstantsModule.LayeredAssetTypes[EmoteAnimation] ~= nil then
			p5:dispatch(StartedWaitingOnLCUpdateModule())
		end
		local IsDynamicHeadEquipped = UtilsModule.isDynamicHeadEquipped(EquippedAssets)
		
		if EmoteAnimation == ConstantsModule.AssetTypeIdStrings.Face and IsDynamicHeadEquipped then
			for i1, _ in ConstantsModule.DynamicHeadAssetTypes do
				for _, value3 in UtilsModule.getEquippedAssetIdsForType(EquippedAssets, i1) do
					p5:dispatch(ToggleEquipAssetModule(i1, value3))
				end
			end
		end
		if FFlagAXCustomizeMakeupSupport and p4 then
			for _, value1 in p4 do
				if EquippedAssets[value1] then
					for i, value2 in EquippedAssets[value1] do
						if value2.order == Order then
							p5:dispatch(ToggleEquipAssetModule(value1, i))
						end
					end
				end
			end
		end
		p5:dispatch(ToggleEquipAssetModule(EmoteAnimation, AssetId, Order, p3))
		
		return true
	end
end