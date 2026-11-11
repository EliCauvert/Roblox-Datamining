local Constants = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Constants

function removeMakeupAssetsFromTryOnsIfOverLimit(List)
	-- upvalues: Constants (copy)
	local Count = 0
	local Smallest = 1e999
	
	for i, value in List do
		if Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[value.itemSubType] then
			Count += 1
			Smallest = math.min(value.itemRecency, Smallest)
		end
	end
	if Constants.MAX_MAKEUP_LAYERS < Count then
		for i, value1 in List do
			if value1.itemRecency == Smallest then
				List[i] = nil
			end
		end
	end
	return List
end

return removeMakeupAssetsFromTryOnsIfOverLimit