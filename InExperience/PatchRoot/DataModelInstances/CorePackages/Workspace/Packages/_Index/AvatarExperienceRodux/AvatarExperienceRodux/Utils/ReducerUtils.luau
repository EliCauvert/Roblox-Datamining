local parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local constants = require(parent.AvatarExperienceCommon).Constants
local fFlagAXCatalogMakeupSupport = require(parent.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport
local assetTypeToAssetCategory = require(script.Parent.Parent.Constants).AssetTypeToAssetCategory
local _ = require(script.Parent.Parent.Types.BodyColors)
local _ = require(script.Parent.Parent.Types.OutfitTryOn)
local LOOK_TYPE = constants.LOOK_TYPE

return {
	filterTryOns = function(p0, p1) --[[ line: 42 ]]
		-- upvalues: assetTypeToAssetCategory (ref)
		local t = {}
		local var1 = nil
		
		for i, v in p0 do
			local itemSubType = assetTypeToAssetCategory[p1.itemSubType]
			
			if v.itemSubType == p1.itemSubType or not (not itemSubType or assetTypeToAssetCategory[v.itemSubType] ~= itemSubType) then
				var1 = v
			else
				t[i] = v
			end
		end
		return t, var1
	end,
	convertDefaultBodyColorRanges = function(p2) --[[ line: 62 ]]
		local t = {}
		
		for i, v in p2 do
			table.insert(t, { rangeId = v[1]:ToHex(), range = v })
		end
		return t
	end,
	generateTryOnItemIdKey = function(p3, p4, p5) --[[ line: 76 ]]
		-- upvalues: LOOK_TYPE (ref), fFlagAXCatalogMakeupSupport (ref)
		return if p5 == nil or p5 ~= LOOK_TYPE.Avatar and (not fFlagAXCatalogMakeupSupport or p5 ~= LOOK_TYPE.Makeup) then p3 else tostring(p3) .. "-" .. p4
	end,
	generateRecommendedItemsKey = function(p6, p7) --[[ line: 89 ]]
		return (p7 or "") .. "-" .. (p6 or "")
	end
}