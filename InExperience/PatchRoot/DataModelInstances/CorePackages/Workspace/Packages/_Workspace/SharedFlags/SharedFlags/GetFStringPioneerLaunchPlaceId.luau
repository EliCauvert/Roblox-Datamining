game:DefineFastString("PioneerLaunchPlaceId", "")

return function() --[[ line: 3 ]]
	local var0 = tonumber(game:GetFastString("PioneerLaunchPlaceId"))
	
	return if var0 and var0 > 0 then var0 else nil
end