local constantsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants)

return function(p0) --[[ line: 5 ]]
	-- upvalues: constantsModule (ref)
	local equippedAssets = p0.AvatarExperience.AvatarEditor.Character.EquippedAssets
	
	if equippedAssets == nil then
		return {}
	end
	local t = {}
	
	for i, v in constantsModule.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE do
		if equippedAssets[i] then
			for i_1, v_1 in equippedAssets[i] do
				table.insert(t, v_1)
			end
		end
	end
	return t
end