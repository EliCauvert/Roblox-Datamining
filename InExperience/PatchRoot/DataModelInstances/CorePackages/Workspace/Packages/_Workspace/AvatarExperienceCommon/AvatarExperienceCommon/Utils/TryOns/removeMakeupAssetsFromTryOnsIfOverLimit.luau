local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local _ = require(AvatarExperienceCommon.Parent.AvatarExperienceModel)
local ConstantsModule = require(AvatarExperienceCommon.Constants)

function removeMakeupAssetsFromTryOnsIfOverLimit(List) --[[ Line: 6 ]]
	-- upvalues: ConstantsModule (copy)
	local Count = 0
	local Smallest = 1e999
	
	for i, value in List do
		if ConstantsModule.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[value.itemSubType] then
			Count += 1
			Smallest = math.min(value.itemRecency, Smallest)
		end
	end
	if ConstantsModule.MAX_MAKEUP_LAYERS < Count then
		for i, value1 in List do
			if value1.itemRecency == Smallest then
				List[i] = nil
			end
		end
	end
	return List
end

return removeMakeupAssetsFromTryOnsIfOverLimit