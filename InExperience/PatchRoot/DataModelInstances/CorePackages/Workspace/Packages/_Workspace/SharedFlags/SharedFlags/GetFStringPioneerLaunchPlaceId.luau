game:DefineFastString("PioneerLaunchPlaceId", "")

return function()
	local var1 = tonumber(game:GetFastString("PioneerLaunchPlaceId"))
	
	return if var1 and var1 > 0 then var1 else nil
end