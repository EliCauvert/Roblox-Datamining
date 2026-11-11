local RbxAnalyticsService = game:GetService("RbxAnalyticsService")

return function(EventName, AdditionalArgs)
	-- upvalues: RbxAnalyticsService (copy)
	if not AdditionalArgs then
		AdditionalArgs = {}
	end
	assert(AdditionalArgs ~= nil, "eventTable must not be nil")
	AdditionalArgs.gameId = tostring(game.GameId)
	AdditionalArgs.placeId = tostring(game.PlaceId)
	RbxAnalyticsService:SendEventDeferred("rcc", "lua_chat_system", EventName, AdditionalArgs)
end