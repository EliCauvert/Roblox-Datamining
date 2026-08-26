local parent = script:FindFirstAncestor("UserLib").Parent
local dateTime = require(parent.Time).DateTime

return require(parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: dateTime (ref)
	local var1 = 0
	
	if p7 ~= nil then
		local var2 = dateTime.fromIsoDate(p7)
		
		if var2 ~= nil then
			var1 = var2:GetUnixTimestamp()
		end
	end
	return {
		userId = p1,
		presence = p2,
		lastLocation = p3,
		placeId = p4,
		rootPlaceId = p5,
		gameInstanceId = p6,
		lastOnline = var1,
		universeId = p8,
		previousUniverseId = p9
	}
end)