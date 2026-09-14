local t = {
	getPlaceId = function()
		return game.PlaceId
	end,
	teleport = function(p1)
		game:GetService("TeleportService"):Teleport(p1)
	end
}

return function(p1)
	-- upvalues: t (ref)
	p1 = p1 or t
	local placeId = p1.getPlaceId()
	
	if placeId == 0 then
		warn("AccountUpgrade: cannot rejoin, PlaceId is 0")
		
		return false
	end
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), placeId (ref)
		p1.teleport(placeId)
	end)
	
	if not ok then
		warn(`AccountUpgrade: rejoin failed, {tostring(status)}`)
	end
	return ok
end