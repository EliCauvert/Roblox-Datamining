local constants = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Constants

function getTryOnItemsContainsOnlyMakeupTypes(p1)
	-- upvalues: constants (ref)
	if #p1 == 0 then
		return false
	end
	for i, v in p1 do
		if not constants.MAKEUP_LOOK_ASSET_TYPES[v.itemSubType] then
			return false
		end
	end
	return true
end

return getTryOnItemsContainsOnlyMakeupTypes