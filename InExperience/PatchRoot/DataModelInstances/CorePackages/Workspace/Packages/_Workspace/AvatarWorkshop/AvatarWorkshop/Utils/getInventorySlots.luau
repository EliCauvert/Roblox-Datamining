local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local InventoryPagesDataModule = require(AvatarWorkshop.Constants.InventoryPagesData)
local InventorySlotsDataModule = require(AvatarWorkshop.Constants.InventorySlotsData)
local _ = require(AvatarWorkshop.Components.ItemSlots.ItemSlotCard)
local GetEquippedAssetIdsOfTypesModule = require(script.Parent.getEquippedAssetIdsOfTypes)
local CirclePlus = require(AvatarWorkshop.Parent.Foundation).Enums.IconName.CirclePlus

local function getSlotAssetIds(p1, p2)
	-- upvalues: InventorySlotsDataModule (copy), InventoryPagesDataModule (copy), GetEquippedAssetIdsOfTypesModule (copy)
	local InventorySlotsDataModuleEntry = InventorySlotsDataModule[p1]
	local InventoryPagesDataModuleEntry = InventoryPagesDataModule[p1]
	local EquippedAssetTypes = InventorySlotsDataModuleEntry and InventorySlotsDataModuleEntry.equippedAssetTypes or InventoryPagesDataModuleEntry and InventoryPagesDataModuleEntry.assetTypes
	
	if EquippedAssetTypes == nil then
		return {}
	end
	local List = {}
	
	for _, value in GetEquippedAssetIdsOfTypesModule(p2, EquippedAssetTypes) do
		local Number: number? = tonumber(value)
		
		if Number then
			table.insert(List, Number)
		end
	end
	return List
end

return function(p3, p4)
	-- upvalues: InventorySlotsDataModule (copy), CirclePlus (copy), getSlotAssetIds (copy)
	local InventorySlotsDataModuleEntry = InventorySlotsDataModule[p3]
	local PlaceholderIcon = if InventorySlotsDataModuleEntry then InventorySlotsDataModuleEntry.placeholderIcon else CirclePlus
	local config = {
		slotType = "Asset",
		content = { placeholderIcon = PlaceholderIcon }
	}
	
	if p4 == nil then
		return { config }
	end
	if InventorySlotsDataModuleEntry and InventorySlotsDataModuleEntry.showsBody then
		local HumanoidDescription = p4.humanoidDescription
		
		return {
			{
				slotType = "Body",
				content = {
					head = HumanoidDescription.Head,
					torso = HumanoidDescription.Torso,
					rightArm = HumanoidDescription.RightArm,
					leftArm = HumanoidDescription.LeftArm,
					rightLeg = HumanoidDescription.RightLeg,
					leftLeg = HumanoidDescription.LeftLeg
				}
			}
		}
	end
	local SlotAssetIds = getSlotAssetIds(p3, p4)
	
	if #SlotAssetIds == 0 then
		return { config }
	end
	local List = {}
	
	for _, slotAssetId in SlotAssetIds do
		table.insert(List, {
			slotType = "Asset",
			content = { assetId = slotAssetId, placeholderIcon = PlaceholderIcon }
		})
	end
	return List
end