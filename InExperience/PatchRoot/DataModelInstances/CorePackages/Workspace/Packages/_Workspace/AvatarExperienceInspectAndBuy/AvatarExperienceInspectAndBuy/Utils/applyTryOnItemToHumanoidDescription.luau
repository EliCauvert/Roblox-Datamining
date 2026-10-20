local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local CryoModule = require(Parent.Cryo)
local Constants = require(Parent.AXCommon).Constants
local ItemTypeEnum = require(Parent.AvatarExperienceModel).Enums.ItemTypeEnum
local ASSETTYPETOACCESSORYTYPE = Constants.ASSET_TYPE_TO_ACCESSORY_TYPE
local ASSETTYPENAMETOIDSTRING = Constants.ASSET_TYPE_NAME_TO_ID_STRING
local ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROP = Constants.ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP
local LAYEREDCLOTHINGORDER = Constants.LAYERED_CLOTHING_ORDER
local LAYEREDASSETTYPES = Constants.LAYERED_ASSET_TYPES
local BODYBUNDLETYPEID = Constants.BODY_BUNDLE_TYPE_ID
local SHOESBUNDLETYPEID = Constants.SHOES_BUNDLE_TYPE_ID
local DYNAMICHEADBUNDLETYPEID = Constants.DYNAMIC_HEAD_BUNDLE_TYPE_ID
local _ = require(AvatarExperienceInspectAndBuy.Types)

local function _(p1, p2)
	-- upvalues: LAYEREDCLOTHINGORDER (copy), ASSETTYPETOACCESSORYTYPE (copy), LAYEREDASSETTYPES (copy)
	return {
		AssetId = tonumber(p2) or 0,
		Order = LAYEREDCLOTHINGORDER[p1],
		AccessoryType = ASSETTYPETOACCESSORYTYPE[p1],
		IsLayered = LAYEREDASSETTYPES[p1] ~= nil
	}
end

local _ = function(p1, AccessoryTypes)
	-- upvalues: CryoModule (copy)
	return CryoModule.List.filter(p1, function(p2): boolean
		-- upvalues: AccessoryTypes (copy)
		for _, value in AccessoryTypes do
			if p2.AccessoryType == value then
				return false
			end
		end
		return true
	end)
end

local function v16(AssetsInBundle, List)
	-- upvalues: ASSETTYPETOACCESSORYTYPE (copy), LAYEREDCLOTHINGORDER (copy), LAYEREDASSETTYPES (copy)
	local List1 = {}
	local Flag = nil
	
	for _, value in AssetsInBundle do
		local AssetType = value.assetType
		local Id = value.id
		
		if AssetType and Id then
			local ASSETTYPETOACCESSORYTYPEEntry = ASSETTYPETOACCESSORYTYPE[AssetType]
			Flag = true
			
			if List then
				Flag = false
				
				for _, value1 in List do
					if ASSETTYPETOACCESSORYTYPEEntry == value1 then
						Flag = true
						break
					end
				end
			end
			if Flag and ASSETTYPETOACCESSORYTYPEEntry then
				table.insert(List1, {
					AssetId = tonumber(Id) or 0,
					Order = LAYEREDCLOTHINGORDER[AssetType],
					AccessoryType = ASSETTYPETOACCESSORYTYPE[AssetType],
					IsLayered = LAYEREDASSETTYPES[AssetType] ~= nil
				})
			end
		end
	end
	return List1
end

local function v17(Humanoid: Humanoid, List)
	-- upvalues: CryoModule (copy)
	local Accessories = Humanoid:GetAccessories(true)
	local AccessoryTypes = {}
	
	for _, value in List do
		table.insert(AccessoryTypes, value.AccessoryType)
	end
	Humanoid:SetAccessories(CryoModule.List.join(CryoModule.List.filter(Accessories, function(p2): boolean
		-- upvalues: AccessoryTypes (copy)
		for _, value in AccessoryTypes do
			if p2.AccessoryType == value then
				return false
			end
		end
		return true
	end), List), true)
end

return function(p2, Humanoid: Humanoid)
	-- upvalues: ItemTypeEnum (copy), ASSETTYPETOACCESSORYTYPE (copy), ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROP (copy), ASSETTYPENAMETOIDSTRING (copy), LAYEREDCLOTHINGORDER (copy), LAYEREDASSETTYPES (copy), v17 (copy), BODYBUNDLETYPEID (copy), v16 (copy), SHOESBUNDLETYPEID (copy), DYNAMICHEADBUNDLETYPEID (copy)
	if p2.itemType == ItemTypeEnum.Asset and (ASSETTYPETOACCESSORYTYPE[p2.itemSubType] or ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROP[p2.itemSubType]) then
		local ItemSubType = p2.itemSubType
		local ItemId = p2.itemId
		local ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry = ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROP[ItemSubType]
		
		if ItemId and ItemSubType ~= ASSETTYPENAMETOIDSTRING.Gear and ASSETTYPETOACCESSORYTYPE[ItemSubType] then
			v17(Humanoid, {
				{
					AssetId = tonumber(ItemId) or 0,
					Order = LAYEREDCLOTHINGORDER[ItemSubType],
					AccessoryType = ASSETTYPETOACCESSORYTYPE[ItemSubType],
					IsLayered = LAYEREDASSETTYPES[ItemSubType] ~= nil
				}
			})
		elseif ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry and ItemId then
			Humanoid[ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry] = ItemId
		end
	end
	if p2.itemType == ItemTypeEnum.Bundle and p2.assetsInBundle and p2.itemSubType == BODYBUNDLETYPEID then
		local v1 = v16(p2.assetsInBundle, { Enum.AccessoryType.Hair })
		
		if #v1 > 0 then
			v17(Humanoid, v1)
		end
		for _, value in p2.assetsInBundle do
			local AssetType = value.assetType
			
			if AssetType then
				local ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry = ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROP[AssetType]
				
				if ASSETTYPETOACCESSORYTYPE[AssetType] ~= Enum.AccessoryType.Hair and ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry and value.id then
					Humanoid[ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry] = value.id
				end
			end
		end
	end
	if p2.itemSubType == SHOESBUNDLETYPEID and p2.assetsInBundle then
		local v2 = v16(p2.assetsInBundle, {
			Enum.AccessoryType.LeftShoe,
			Enum.AccessoryType.RightShoe
		})
		
		if #v2 > 0 then
			v17(Humanoid, v2)
		end
	end
	if p2.itemSubType == DYNAMICHEADBUNDLETYPEID and p2.assetsInBundle then
		for _, value1 in p2.assetsInBundle do
			local AssetType = value1.assetType
			local Id = value1.id
			
			if AssetType then
				local ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry = ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROP[AssetType]
				
				if ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry and Id then
					Humanoid[ASSETTYPEIDSTRINGTOHUMANOIDDESCRIPTIONPROPEntry] = Id
				end
			end
		end
	end
end