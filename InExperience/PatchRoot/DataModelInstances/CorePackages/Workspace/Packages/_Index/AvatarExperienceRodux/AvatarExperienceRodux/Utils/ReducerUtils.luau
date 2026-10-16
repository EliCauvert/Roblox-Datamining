local Parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local FFlagAXCatalogMakeupSupport = require(Parent.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport
local AssetTypeToAssetCategory = require(script.Parent.Parent.Constants).AssetTypeToAssetCategory
local _ = require(script.Parent.Parent.Types.BodyColors)
local _ = require(script.Parent.Parent.Types.OutfitTryOn)
local LOOKTYPE = require(Parent.AvatarExperienceCommon).Constants.LOOK_TYPE

return {
	filterTryOns = function(List, p1) --[[ Line: 42 ]]
		-- upvalues: AssetTypeToAssetCategory (copy)
		local t = {}
		local v1 = nil
		
		for i, value in List do
			local AssetTypeToAssetCategoryEntry = AssetTypeToAssetCategory[p1.itemSubType]
			local NoAssetTypeToAssetCategoryEntry: boolean = not AssetTypeToAssetCategoryEntry or AssetTypeToAssetCategory[value.itemSubType] ~= AssetTypeToAssetCategoryEntry
			
			if value.itemSubType == p1.itemSubType or not NoAssetTypeToAssetCategoryEntry then
				v1 = value
			else
				t[i] = value
			end
		end
		return t, v1
	end,
	convertDefaultBodyColorRanges = function(List) --[[ Line: 62 ]]
		local List1 = {}
		
		for _, Range in List do
			table.insert(List1, { rangeId = Range[1]:ToHex(), range = Range })
		end
		return List1
	end,
	generateTryOnItemIdKey = function(p2, Text, Avatar) --[[ Line: 76 ]]
		-- upvalues: LOOKTYPE (copy), FFlagAXCatalogMakeupSupport (copy)
		return if Avatar == nil or Avatar ~= LOOKTYPE.Avatar and (not FFlagAXCatalogMakeupSupport or Avatar ~= LOOKTYPE.Makeup) then p2 else tostring(p2) .. "-" .. Text
	end,
	generateRecommendedItemsKey = function(p2, p3): string --[[ Line: 89 ]]
		return (p3 or "") .. "-" .. (p2 or "")
	end
}