return function(value)
	local var1 = nil
	local value_1 = value[tostring(Enum.AssetType.Gear.Value)]
	
	if value_1 then
		local var2, _ = next(value_1)
		
		if var2 then
			var1 = tonumber(var2)
		end
	end
	return var1
end