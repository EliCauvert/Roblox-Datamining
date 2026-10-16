local config = {
	getPlaceId = function() --[[ Line: 14 ]]
		return game.PlaceId
	end,
	teleport = function(PlaceId) --[[ Line: 17 ]]
		game:GetService("TeleportService"):Teleport(PlaceId)
	end
}

return function(p1) --[[ Line: 22 | Named "respawnIntoExperience" ]]
	-- upvalues: config (copy)
	local P1 = p1 or config
	local PlaceId = P1.getPlaceId()
	
	if PlaceId == 0 then
		warn("AccountUpgrade: cannot rejoin, PlaceId is 0")
		
		return false
	end
	local Success, Result = pcall(function() --[[ Line: 32 ]]
		-- upvalues: P1 (copy), PlaceId (copy)
		P1.teleport(PlaceId)
	end)
	
	if not Success then
		warn(`AccountUpgrade: rejoin failed, {tostring(Result)}`)
	end
	return Success
end