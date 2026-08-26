local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local outfitTypesModule = require(avatarExperienceCommon.Enums.OutfitTypes)
local _ = require(avatarExperienceCommon.Types.CategoryTypes.CategoryTypes)
local NON_EDITABLE_MAKEUP_GRANT_KEY = require(avatarExperienceCommon.Constants).NON_EDITABLE_MAKEUP_GRANT_KEY

return function(p1, p2, p3)
	-- upvalues: outfitTypesModule (ref), NON_EDITABLE_MAKEUP_GRANT_KEY (ref)
	if not p1 then
		return {}
	end
	local var1 = if p2 == outfitTypesModule.Avatar then if p3 == nil then {
		outfitTypesModule.EditableAvatar,
		outfitTypesModule.Avatar
	} elseif p3 then { outfitTypesModule.EditableAvatar } else { outfitTypesModule.Avatar } elseif p2 == outfitTypesModule.Makeup then if p3 == nil then { outfitTypesModule.Makeup, NON_EDITABLE_MAKEUP_GRANT_KEY } elseif p3 then { outfitTypesModule.Makeup } else { NON_EDITABLE_MAKEUP_GRANT_KEY } else { p2 }
	local t = {}
	local t_1 = {}
	
	for i, v in var1 do
		local var2 = p1.grantedOutfitsByType[v]
		
		if var2 then
			for i_1, v_1 in var2 do
				local var3 = tostring(v_1)
				
				if not t_1[var3] then
					t_1[var3] = true
					table.insert(t, var3)
				end
			end
		end
	end
	return t
end