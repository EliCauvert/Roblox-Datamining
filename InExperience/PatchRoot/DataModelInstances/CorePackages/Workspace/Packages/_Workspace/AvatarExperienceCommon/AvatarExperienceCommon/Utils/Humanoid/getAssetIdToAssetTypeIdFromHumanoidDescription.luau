local constantsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants)

return function(value)
	-- upvalues: constantsModule (ref)
	local v_1
	local t = {}
	
	for i, v in constantsModule.ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP do
		if constantsModule.ASSET_TYPE_TO_ACCESSORY_TYPE[tostring(i)] == nil then
			v_1 = value[v]
			
			if typeof(v_1) == "number" and v_1 > 0 then
				t[tostring(v_1)] = tostring(i)
			elseif typeof(v_1) == "string" and v_1 ~= "" then
				for i_1 in v_1:gmatch("([%d]+),?") do
					t[i_1] = tostring(i)
				end
			end
		end
	end
	for i_1, v_1 in value:GetAccessories(true) do
		t[tostring(v_1.AssetId)] = constantsModule.ACCESSORY_TYPE_TO_ASSET_TYPE[v_1.AccessoryType]
	end
	return t
end