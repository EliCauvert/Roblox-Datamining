local ConstantsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants)

return function(p1)
	-- upvalues: ConstantsModule (copy)
	local EquippedAssets = p1.AvatarExperience.AvatarEditor.Character.EquippedAssets
	
	if EquippedAssets == nil then
		return {}
	end
	local List = {}
	
	for i, _ in ConstantsModule.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE do
		if EquippedAssets[i] then
			for _, value in EquippedAssets[i] do
				table.insert(List, value)
			end
		end
	end
	return List
end