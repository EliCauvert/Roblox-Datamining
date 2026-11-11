local Parent = script:FindFirstAncestor("UserLib").Parent
local _DateTime = require(Parent.Time).DateTime

return require(Parent.Rodux).makeActionCreator(script.Name, function(UserId, Presence, LastLocation, PlaceId, RootPlaceId, GameInstanceId, p1, UniverseId, PreviousUniverseId)
	-- upvalues: _DateTime (copy)
	local UnixTimestamp = 0
	
	if p1 ~= nil then
		local FromIsoDateResult = _DateTime.fromIsoDate(p1)
		
		if FromIsoDateResult ~= nil then
			UnixTimestamp = FromIsoDateResult:GetUnixTimestamp()
		end
	end
	return {
		userId = UserId,
		presence = Presence,
		lastLocation = LastLocation,
		placeId = PlaceId,
		rootPlaceId = RootPlaceId,
		gameInstanceId = GameInstanceId,
		lastOnline = UnixTimestamp,
		universeId = UniverseId,
		previousUniverseId = PreviousUniverseId
	}
end)