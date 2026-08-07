local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local outfitTypesModule = require(avatarExperienceCommon.Enums.OutfitTypes)
local _ = require(avatarExperienceCommon.Types.CategoryTypes.CategoryTypes)
local NON_EDITABLE_MAKEUP_GRANT_KEY = require(avatarExperienceCommon.Constants).NON_EDITABLE_MAKEUP_GRANT_KEY

return function(p0, p1, p2) --[[ line: 33 | named "getGrantedOutfitIds" ]]
	-- upvalues: outfitTypesModule (ref), NON_EDITABLE_MAKEUP_GRANT_KEY (ref)
	if not p0 then
		return {}
	end
	local var2 = if p1 == outfitTypesModule.Avatar then if p2 == nil then {
		outfitTypesModule.EditableAvatar,
		outfitTypesModule.Avatar
	} elseif p2 then { outfitTypesModule.EditableAvatar } else { outfitTypesModule.Avatar } elseif p1 == outfitTypesModule.Makeup then if p2 == nil then { outfitTypesModule.Makeup, NON_EDITABLE_MAKEUP_GRANT_KEY } elseif p2 then { outfitTypesModule.Makeup } else { NON_EDITABLE_MAKEUP_GRANT_KEY } else { p1 }
	local t = {}
	local t_1 = {}
	
	for i, v in var2 do
		local var5 = p0.grantedOutfitsByType[v]
		
		if var5 then
			for i_1, v_1 in var5 do
				local var6 = tostring(v_1)
				
				if not t_1[var6] then
					t_1[var6] = true
					table.insert(t, var6)
				end
			end
		end
	end
	return t
end