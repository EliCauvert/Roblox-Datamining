local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local constantsModule = require(avatarExperienceCommon.Constants)
local _ = require(avatarExperienceCommon.Enums.ItemTypeEnum)

function removeMakeupAssetsFromTryOnsIfOverLimit(value)
	-- upvalues: constantsModule (ref)
	local var2 = 0
	local var3 = 1e999
	
	for i, v in value do
		if constantsModule.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[v.itemSubType] then
			var2 += 1
			var3 = math.min(v.itemRecency, var3)
		end
	end
	if constantsModule.MAX_MAKEUP_LAYERS < var2 then
		for i_1, v_1 in value do
			if v_1.itemRecency == var3 then
				value[i_1] = nil
			end
		end
	end
	return value
end

return removeMakeupAssetsFromTryOnsIfOverLimit