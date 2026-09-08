local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local fFlagParseHeadShapeFromAPIResponse = require(parent.AvatarExperienceFlags).FFlagParseHeadShapeFromAPIResponse
local constants = require(parent.AvatarExperienceCommon).Constants

return function(value)
	-- upvalues: constants (ref), fFlagParseHeadShapeFromAPIResponse (ref)
	table.sort(value, function(p1, p2)
		return tonumber(p1.itemRecency) < tonumber(p2.itemRecency)
	end)
	local t = {}
	
	for i, v in value do
		if v.itemId ~= constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
			if v.itemType == Enum.AvatarItemType.Asset.Name then
				table.insert(t, {
					assetId = v.itemId,
					assetTypeId = v.itemSubType,
					order = v.order
				})
			elseif v.itemType == Enum.AvatarItemType.Bundle.Name then
				for i_1, v_1 in v.bundleInfo do
					table.insert(t, {
						assetId = i_1,
						assetTypeId = v_1.assetType,
						headShape = if fFlagParseHeadShapeFromAPIResponse and v_1 then v_1.headShape else nil
					})
				end
			end
		end
	end
	return t
end