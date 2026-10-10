local constantsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants)

return function(value)
	-- upvalues: constantsModule (ref)
	if value == nil then
		return {}
	end
	local t = {}
	
	for i, v in constantsModule.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE do
		if value[i] then
			for i_1, v_1 in value[i] do
				table.insert(t, v_1)
			end
		end
	end
	return t
end