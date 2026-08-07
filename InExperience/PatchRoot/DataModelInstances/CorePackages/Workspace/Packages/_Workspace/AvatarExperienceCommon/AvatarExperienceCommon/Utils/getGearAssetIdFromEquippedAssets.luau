return function(value) --[[ line: 1 | named "getGearAssetIdFromEquippedAssets" ]]
	local var0 = nil
	local value_1 = value[tostring(Enum.AssetType.Gear.Value)]
	
	if value_1 then
		local var1, _ = next(value_1)
		
		if var1 then
			var0 = tonumber(var1)
		end
	end
	return var0
end