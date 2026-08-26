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

local _ = function(p1, p2)
	-- upvalues: LAYERED_CLOTHING_ORDER (ref), ASSET_TYPE_TO_ACCESSORY_TYPE (ref), LAYERED_ASSET_TYPES (ref)
	return {
		AssetId = tonumber(p2) or 0,
		Order = LAYERED_CLOTHING_ORDER[p1],
		AccessoryType = ASSET_TYPE_TO_ACCESSORY_TYPE[p1],
		IsLayered = LAYERED_ASSET_TYPES[p1] ~= nil
	}
end

local _ = function(p1, p2)
	-- upvalues: cryoModule (ref)
	return cryoModule.List.filter(p1, function(p3)
		-- upvalues: p2 (ref)
		for i, v in p2 do
			if p3.AccessoryType == v then
				return false
			end
		end
		return true
	end)
end

local var1 = function(p3, p4)
	-- upvalues: ASSET_TYPE_TO_ACCESSORY_TYPE (ref), LAYERED_CLOTHING_ORDER (ref), LAYERED_ASSET_TYPES (ref)
	local var2
	local t = {}
	
	for i, v in p3 do
		local assetType = v.assetType
		local id = v.id
		
		if assetType and id then
			local var3 = ASSET_TYPE_TO_ACCESSORY_TYPE[assetType]
			var2 = true
			
			if p4 then
				var2 = false
				
				for i_1, v_1 in p4 do
					if var3 == v_1 then
						var2 = true
						break
					end
				end
			end
			if var2 and var3 then
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

local var4 = function(p5, p6)
	-- upvalues: cryoModule (ref)
	local var5 = p5:GetAccessories(true)
	local t = {}
	
	for i, v in p6 do
		table.insert(t, v.AccessoryType)
	end
	p5:SetAccessories(cryoModule.List.join(cryoModule.List.filter(var5, function(p7)
		-- upvalues: t (ref)
		for i, v in t do
			if p7.AccessoryType == v then
				return false
			end
		end
		return true
	end), p6), true)
end

return function(p7, p8)
	-- upvalues: itemTypeEnum (ref), ASSET_TYPE_TO_ACCESSORY_TYPE (ref), ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP (ref), ASSET_TYPE_NAME_TO_ID_STRING (ref), LAYERED_CLOTHING_ORDER (ref), LAYERED_ASSET_TYPES (ref), var4 (ref), BODY_BUNDLE_TYPE_ID (ref), var1 (ref), SHOES_BUNDLE_TYPE_ID (ref), DYNAMIC_HEAD_BUNDLE_TYPE_ID (ref)
	local itemSubType
	if p7.itemType == itemTypeEnum.Asset and (ASSET_TYPE_TO_ACCESSORY_TYPE[p7.itemSubType] or ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[p7.itemSubType]) then
		itemSubType = p7.itemSubType
		local itemId = p7.itemId
		local var6 = ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[itemSubType]
		
		if itemId and itemSubType ~= ASSET_TYPE_NAME_TO_ID_STRING.Gear and ASSET_TYPE_TO_ACCESSORY_TYPE[itemSubType] then
			var4(p8, {
				{
					AssetId = tonumber(itemId) or 0,
					Order = LAYERED_CLOTHING_ORDER[itemSubType],
					AccessoryType = ASSET_TYPE_TO_ACCESSORY_TYPE[itemSubType],
					IsLayered = LAYERED_ASSET_TYPES[itemSubType] ~= nil
				}
			})
		elseif var6 and itemId then
			p8[var6] = itemId
		end
	end
	if p7.itemType == itemTypeEnum.Bundle and p7.assetsInBundle and p7.itemSubType == BODY_BUNDLE_TYPE_ID then
		itemSubType = var1(p7.assetsInBundle, { Enum.AccessoryType.Hair })
		
		if #itemSubType > 0 then
			var4(p8, itemSubType)
		end
		for i, v in p7.assetsInBundle do
			local assetType = v.assetType
			
			if assetType then
				local var7 = ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[assetType]
				
				if ASSET_TYPE_TO_ACCESSORY_TYPE[assetType] ~= Enum.AccessoryType.Hair and var7 and v.id then
					p8[var7] = v.id
				end
			end
		end
	end
	if p7.itemSubType == SHOES_BUNDLE_TYPE_ID and p7.assetsInBundle then
		itemSubType = var1(p7.assetsInBundle, {
			Enum.AccessoryType.LeftShoe,
			Enum.AccessoryType.RightShoe
		})
		
		if #itemSubType > 0 then
			var4(p8, itemSubType)
		end
	end
	if p7.itemSubType == DYNAMIC_HEAD_BUNDLE_TYPE_ID and p7.assetsInBundle then
		for i, v in p7.assetsInBundle do
			local assetType = v.assetType
			local id = v.id
			
			if assetType then
				local var8 = ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[assetType]
				
				if var8 and id then
					p8[var8] = id
				end
			end
		end
	end
end