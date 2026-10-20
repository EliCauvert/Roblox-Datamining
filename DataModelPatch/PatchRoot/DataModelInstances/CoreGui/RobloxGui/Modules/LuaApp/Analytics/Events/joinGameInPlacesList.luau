local Players = game:GetService("Players")

return function(p1, PlayerId, PlaceId, RootPlaceId, GameInstanceId, JoinAttemptJoinId, Source)
	-- upvalues: Players (copy)
	assert(type(PlayerId) == "string", "Expected playerId to be a string")
	assert(type(PlaceId) == "string", "Expected placeId to be a string")
	assert(type(RootPlaceId) == "number", "Expected rootPlaceId to be a number")
	
	if GameInstanceId then
		assert(type(GameInstanceId) == "string", "Expected gameInstanceId to be a string")
	end
	if JoinAttemptJoinId then
		assert(type(JoinAttemptJoinId) == "string", "Expected joinAttemptId to be a string")
	end
	if Source then
		assert(type(Source) == "string", "Expected source to be a string")
	end
	p1:setRBXEventStream("PlacesList", "joinGameInPlacesList", {
		uid = tostring(Players.LocalPlayer.UserId),
		playerId = PlayerId,
		placeId = PlaceId,
		rootPlaceId = RootPlaceId,
		gameInstanceId = GameInstanceId,
		joinAttemptJoinId = JoinAttemptJoinId,
		source = Source
	})
end