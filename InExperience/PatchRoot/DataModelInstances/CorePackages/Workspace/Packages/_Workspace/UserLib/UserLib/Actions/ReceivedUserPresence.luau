local parent = script:FindFirstAncestor("UserLib").Parent
local dateTime = require(parent.Time).DateTime

return require(parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: dateTime (ref)
	local var0 = 0
	
	if p6 ~= nil then
		local var1 = dateTime.fromIsoDate(p6)
		
		if var1 ~= nil then
			var0 = var1:GetUnixTimestamp()
		end
	end
	return {
		userId = p0,
		presence = p1,
		lastLocation = p2,
		placeId = p3,
		rootPlaceId = p4,
		gameInstanceId = p5,
		lastOnline = var0,
		universeId = p7,
		previousUniverseId = p8
	}
end)