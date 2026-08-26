local parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local constants = require(parent.AvatarExperienceCommon).Constants
local fFlagAXCatalogMakeupSupport = require(parent.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport
local assetTypeToAssetCategory = require(script.Parent.Parent.Constants).AssetTypeToAssetCategory
local _ = require(script.Parent.Parent.Types.BodyColors)
local _ = require(script.Parent.Parent.Types.OutfitTryOn)
local LOOK_TYPE = constants.LOOK_TYPE

return {
	filterTryOns = function(p1, p2)
		-- upvalues: assetTypeToAssetCategory (ref)
		local t = {}
		local var1 = nil
		
		for i, v in p1 do
			local itemSubType = assetTypeToAssetCategory[p2.itemSubType]
			
			if v.itemSubType == p2.itemSubType or not (not itemSubType or assetTypeToAssetCategory[v.itemSubType] ~= itemSubType) then
				var1 = v
			else
				t[i] = v
			end
		end
		return t, var1
	end,
	convertDefaultBodyColorRanges = function(p3)
		local t = {}
		
		for i, v in p3 do
			table.insert(t, { rangeId = v[1]:ToHex(), range = v })
		end
		return t
	end,
	generateTryOnItemIdKey = function(p4, p5, p6)
		-- upvalues: LOOK_TYPE (ref), fFlagAXCatalogMakeupSupport (ref)
		return if p6 == nil or p6 ~= LOOK_TYPE.Avatar and (not fFlagAXCatalogMakeupSupport or p6 ~= LOOK_TYPE.Makeup) then p4 else tostring(p4) .. "-" .. p4
	end,
	generateRecommendedItemsKey = function(p4, p5)
		return (p5 or "") .. "-" .. (p4 or "")
	end
}