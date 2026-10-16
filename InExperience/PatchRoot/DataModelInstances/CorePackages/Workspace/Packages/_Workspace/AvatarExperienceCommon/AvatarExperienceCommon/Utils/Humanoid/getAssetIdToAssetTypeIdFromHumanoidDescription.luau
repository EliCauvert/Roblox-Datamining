local ConstantsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Constants)

return function(Humanoid: Humanoid) --[[ Line: 5 | Named "getAssetIdToAssetTypeIdFromHumanoidDescription" ]]
	-- upvalues: ConstantsModule (copy)
	local ACCESSORYTYPETOASSETTYPEEntries = {}
	
	for i, value in ConstantsModule.ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP do
		if ConstantsModule.ASSET_TYPE_TO_ACCESSORY_TYPE[tostring(i)] == nil then
			local HumanoidEntry = Humanoid[value]
			
			if typeof(HumanoidEntry) == "number" and HumanoidEntry > 0 then
				ACCESSORYTYPETOASSETTYPEEntries[tostring(HumanoidEntry)] = tostring(i)
			elseif typeof(HumanoidEntry) == "string" and HumanoidEntry ~= "" then
				for i1 in HumanoidEntry:gmatch("([%d]+),?") do
					ACCESSORYTYPETOASSETTYPEEntries[i1] = tostring(i)
				end
			end
		end
	end
	for _, accessory in Humanoid:GetAccessories(true) do
		ACCESSORYTYPETOASSETTYPEEntries[tostring(accessory.AssetId)] = ConstantsModule.ACCESSORY_TYPE_TO_ASSET_TYPE[accessory.AccessoryType]
	end
	return ACCESSORYTYPETOASSETTYPEEntries
end