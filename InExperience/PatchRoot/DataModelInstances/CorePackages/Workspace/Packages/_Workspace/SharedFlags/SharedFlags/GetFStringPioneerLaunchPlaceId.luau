game:DefineFastString("PioneerLaunchPlaceId", "")

return function() --[[ Line: 3 ]]
	local Number: number? = tonumber(game:GetFastString("PioneerLaunchPlaceId"))
	
	return if Number and Number > 0 then Number else nil
end