local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local AXCommonModule = require(parent.AXCommon)
local cryoModule = require(parent.Cryo)
local constants = AXCommonModule.Constants
local itemTypeEnum = AXCommonModule.Enums.ItemTypeEnum
local ASSET_TYPE_TO_ACCESSORY_TYPE = constants.ASSET_TYPE_TO_ACCESSORY_TYPE
local ASSET_TYPE_NAME_TO_ID_STRING = constants.ASSET_TYPE_NAME_TO_ID_STRING
local ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP = constants.ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP
local LAYERED_CLOTHING_ORDER = constants.LAYERED_CLOTHING_ORDER
local LAYERED_ASSET_TYPES = constants.LAYERED_ASSET_TYPES
local BODY_BUNDLE_TYPE_ID = constants.BODY_BUNDLE_TYPE_ID
local SHOES_BUNDLE_TYPE_ID = constants.SHOES_BUNDLE_TYPE_ID
local DYNAMIC_HEAD_BUNDLE_TYPE_ID = constants.DYNAMIC_HEAD_BUNDLE_TYPE_ID
local _ = require(avatarExperienceInspectAndBuy.Types)

local _ = function(p0, p1)
	-- upvalues: LAYERED_CLOTHING_ORDER (ref), ASSET_TYPE_TO_ACCESSORY_TYPE (ref), LAYERED_ASSET_TYPES (ref)
	return {
		AssetId = tonumber(p1) or 0,
		Order = LAYERED_CLOTHING_ORDER[p0],
		AccessoryType = ASSET_TYPE_TO_ACCESSORY_TYPE[p0],
		IsLayered = LAYERED_ASSET_TYPES[p0] ~= nil
	}
end

local _ = function(p2, p3)
	-- upvalues: cryoModule (ref)
	return cryoModule.List.filter(p2, function(p4)
		-- upvalues: p3 (ref)
		for i, v in p3 do
			if p4.AccessoryType == v then
				return false
			end
		end
		return true
	end)
end

local var3 = function(p5, p6)
	-- upvalues: ASSET_TYPE_TO_ACCESSORY_TYPE (ref), LAYERED_CLOTHING_ORDER (ref), LAYERED_ASSET_TYPES (ref)
	local var7
	local t = {}
	
	for i, v in p5 do
		local assetType = v.assetType
		local id = v.id
		
		if assetType and id then
			local var6 = ASSET_TYPE_TO_ACCESSORY_TYPE[assetType]
			var7 = true
			
			if p6 then
				var7 = false
				
				for i_1, v_1 in p6 do
					if var6 == v_1 then
						var7 = true
						break
					end
				end
			end
			if var7 and var6 then
				table.insert(t, {
					AssetId = tonumber(id) or 0,
					Order = LAYERED_CLOTHING_ORDER[assetType],
					AccessoryType = ASSET_TYPE_TO_ACCESSORY_TYPE[assetType],
					IsLayered = LAYERED_ASSET_TYPES[assetType] ~= nil
				})
			end
		end
	end
	return t
end

local var4 = function(p7, p8)
	-- upvalues: cryoModule (ref)
	local var8 = p7:GetAccessories(true)
	local t = {}
	
	for i, v in p8 do
		table.insert(t, v.AccessoryType)
	end
	p7:SetAccessories(cryoModule.List.join(cryoModule.List.filter(var8, function(p9)
		-- upvalues: t (ref)
		for i, v in t do
			if p9.AccessoryType == v then
				return false
			end
		end
		return true
	end), p8), true)
end

return function(p10, p11)
	-- upvalues: itemTypeEnum (ref), ASSET_TYPE_TO_ACCESSORY_TYPE (ref), ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP (ref), ASSET_TYPE_NAME_TO_ID_STRING (ref), LAYERED_CLOTHING_ORDER (ref), LAYERED_ASSET_TYPES (ref), var4 (ref), BODY_BUNDLE_TYPE_ID (ref), var3 (ref), SHOES_BUNDLE_TYPE_ID (ref), DYNAMIC_HEAD_BUNDLE_TYPE_ID (ref)
	local itemSubType
	if p10.itemType == itemTypeEnum.Asset and (ASSET_TYPE_TO_ACCESSORY_TYPE[p10.itemSubType] or ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[p10.itemSubType]) then
		itemSubType = p10.itemSubType
		local itemId = p10.itemId
		local var10 = ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[itemSubType]
		
		if itemId and itemSubType ~= ASSET_TYPE_NAME_TO_ID_STRING.Gear and ASSET_TYPE_TO_ACCESSORY_TYPE[itemSubType] then
			var4(p11, {
				{
					AssetId = tonumber(itemId) or 0,
					Order = LAYERED_CLOTHING_ORDER[itemSubType],
					AccessoryType = ASSET_TYPE_TO_ACCESSORY_TYPE[itemSubType],
					IsLayered = LAYERED_ASSET_TYPES[itemSubType] ~= nil
				}
			})
		elseif var10 and itemId then
			p11[var10] = itemId
		end
	end
	if p10.itemType == itemTypeEnum.Bundle and p10.assetsInBundle and p10.itemSubType == BODY_BUNDLE_TYPE_ID then
		itemSubType = var3(p10.assetsInBundle, { Enum.AccessoryType.Hair })
		
		if #itemSubType > 0 then
			var4(p11, itemSubType)
		end
		for i, v in p10.assetsInBundle do
			local assetType = v.assetType
			
			if assetType then
				local var11 = ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[assetType]
				
				if ASSET_TYPE_TO_ACCESSORY_TYPE[assetType] ~= Enum.AccessoryType.Hair and var11 and v.id then
					p11[var11] = v.id
				end
			end
		end
	end
	if p10.itemSubType == SHOES_BUNDLE_TYPE_ID and p10.assetsInBundle then
		itemSubType = var3(p10.assetsInBundle, {
			Enum.AccessoryType.LeftShoe,
			Enum.AccessoryType.RightShoe
		})
		
		if #itemSubType > 0 then
			var4(p11, itemSubType)
		end
	end
	if p10.itemSubType == DYNAMIC_HEAD_BUNDLE_TYPE_ID and p10.assetsInBundle then
		for i, v in p10.assetsInBundle do
			local assetType = v.assetType
			local id = v.id
			
			if assetType then
				local var12 = ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[assetType]
				
				if var12 and id then
					p11[var12] = id
				end
			end
		end
	end
end