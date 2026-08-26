local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE = require(avatarExperienceCommon.Constants).ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE
local destroyMakeupDescriptionsModule = require(avatarExperienceCommon.Utils.Humanoid.destroyMakeupDescriptions)

return function(value, p1)
	-- upvalues: destroyMakeupDescriptionsModule (ref), ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE (ref)
	destroyMakeupDescriptionsModule(value)
	
	for i, v in p1 do
		if ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[i] then
			for i_1, v_1 in v do
				local makeupDescription = Instance.new("MakeupDescription")
				makeupDescription.MakeupType = ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[i]
				makeupDescription.AssetId = tonumber(i_1) or 0
				makeupDescription.Parent = value
				
				if v_1.order then
					makeupDescription.Order = v_1.order
				end
			end
		end
	end
end