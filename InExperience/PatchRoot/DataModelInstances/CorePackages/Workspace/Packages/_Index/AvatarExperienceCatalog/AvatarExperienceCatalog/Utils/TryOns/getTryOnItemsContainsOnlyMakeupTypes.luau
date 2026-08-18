local constants = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Constants

function getTryOnItemsContainsOnlyMakeupTypes(p0) --[[ line: 8 ]]
	-- upvalues: constants (ref)
	if #p0 == 0 then
		return false
	end
	for i, v in p0 do
		if not constants.MAKEUP_LOOK_ASSET_TYPES[v.itemSubType] then
			return false
		end
	end
	return true
end

return getTryOnItemsContainsOnlyMakeupTypes