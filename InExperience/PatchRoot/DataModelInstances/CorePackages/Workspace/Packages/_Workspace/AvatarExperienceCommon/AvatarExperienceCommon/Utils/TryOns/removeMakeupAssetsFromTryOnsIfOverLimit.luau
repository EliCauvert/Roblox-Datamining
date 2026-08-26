local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local constantsModule = require(avatarExperienceCommon.Constants)
local _ = require(avatarExperienceCommon.Enums.ItemTypeEnum)

function removeMakeupAssetsFromTryOnsIfOverLimit(value)
	-- upvalues: constantsModule (ref)
	local var1 = 0
	local var2 = 1e999
	
	for i, v in value do
		if constantsModule.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[v.itemSubType] then
			var1 += 1
			var2 = math.min(v.itemRecency, var2)
		end
	end
	if constantsModule.MAX_MAKEUP_LAYERS < var1 then
		for i_1, v_1 in value do
			if v_1.itemRecency == var2 then
				value[i_1] = nil
			end
		end
	end
	return value
end

return removeMakeupAssetsFromTryOnsIfOverLimit