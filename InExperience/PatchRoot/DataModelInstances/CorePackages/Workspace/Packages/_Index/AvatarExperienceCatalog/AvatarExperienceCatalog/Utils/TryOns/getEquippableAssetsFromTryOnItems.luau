local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local FFlagParseHeadShapeFromAPIResponse = require(Parent.AvatarExperienceFlags).FFlagParseHeadShapeFromAPIResponse
local Constants = require(Parent.AvatarExperienceCommon).Constants

return function(List) --[[ Line: 16 | Named "getEquippableAssetsFromTryOnItems" ]]
	-- upvalues: Constants (copy), FFlagParseHeadShapeFromAPIResponse (copy)
	table.sort(List, function(A, B): boolean --[[ Line: 29 ]]
		return tonumber(A.itemRecency) < tonumber(B.itemRecency)
	end)
	local List1 = {}
	
	for _, value in List do
		if value.itemId ~= Constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
			if value.itemType == Enum.AvatarItemType.Asset.Name then
				table.insert(List1, {
					assetId = value.itemId,
					assetTypeId = value.itemSubType,
					order = value.order
				})
			elseif value.itemType == Enum.AvatarItemType.Bundle.Name then
				for AssetId, value1 in value.bundleInfo do
					table.insert(List1, {
						assetId = AssetId,
						assetTypeId = value1.assetType,
						headShape = if FFlagParseHeadShapeFromAPIResponse and value1 then value1.headShape else nil
					})
				end
			end
		end
	end
	return List1
end