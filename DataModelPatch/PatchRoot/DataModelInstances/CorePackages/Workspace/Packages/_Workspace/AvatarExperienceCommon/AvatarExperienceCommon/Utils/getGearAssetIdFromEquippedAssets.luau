return function(p1): number
	local Number: number? = nil
	local v1 = p1[tostring(Enum.AssetType.Gear.Value)]
	
	if v1 then
		local Key, _ = next(v1)
		
		if Key then
			Number = tonumber(Key)
		end
	end
	return Number
end