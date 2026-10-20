local ConstantsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants)

return function(p1)
	-- upvalues: ConstantsModule (copy)
	if p1 == nil then
		return {}
	end
	local List = {}
	
	for i, _ in ConstantsModule.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE do
		if p1[i] then
			for _, value in p1[i] do
				table.insert(List, value)
			end
		end
	end
	return List
end