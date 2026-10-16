local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local OutfitTypesModule = require(AvatarExperienceCommon.Enums.OutfitTypes)
local _ = require(AvatarExperienceCommon.Types.CategoryTypes.CategoryTypes)
local NONEDITABLEMAKEUPGRANTKEY = require(AvatarExperienceCommon.Constants).NON_EDITABLE_MAKEUP_GRANT_KEY

return function(p1, Avatar, p2) --[[ Line: 33 | Named "getGrantedOutfitIds" ]]
	-- upvalues: OutfitTypesModule (copy), NONEDITABLEMAKEUPGRANTKEY (copy)
	if not p1 then
		return {}
	end
	local List = {}
	local t = {}
	
	for _, value in if Avatar == OutfitTypesModule.Avatar then if p2 == nil then {
		OutfitTypesModule.EditableAvatar,
		OutfitTypesModule.Avatar
	} elseif p2 then { OutfitTypesModule.EditableAvatar } else { OutfitTypesModule.Avatar } elseif Avatar == OutfitTypesModule.Makeup then if p2 == nil then { OutfitTypesModule.Makeup, NONEDITABLEMAKEUPGRANTKEY } elseif p2 then { OutfitTypesModule.Makeup } else { NONEDITABLEMAKEUPGRANTKEY } else { Avatar } do
		local GrantedOutfitsByTypeEntry = p1.grantedOutfitsByType[value]
		
		if GrantedOutfitsByTypeEntry then
			for _, value1 in GrantedOutfitsByTypeEntry do
				local Text = tostring(value1)
				
				if not t[Text] then
					t[Text] = true
					table.insert(List, Text)
				end
			end
		end
	end
	return List
end