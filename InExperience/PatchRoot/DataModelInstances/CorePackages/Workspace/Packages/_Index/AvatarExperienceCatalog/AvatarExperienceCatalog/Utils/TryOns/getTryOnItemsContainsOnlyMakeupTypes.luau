local Constants = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Constants

function getTryOnItemsContainsOnlyMakeupTypes(List): boolean --[[ Line: 8 ]]
	-- upvalues: Constants (copy)
	if #List == 0 then
		return false
	end
	for _, value in List do
		if not Constants.MAKEUP_LOOK_ASSET_TYPES[value.itemSubType] then
			return false
		end
	end
	return true
end

return getTryOnItemsContainsOnlyMakeupTypes