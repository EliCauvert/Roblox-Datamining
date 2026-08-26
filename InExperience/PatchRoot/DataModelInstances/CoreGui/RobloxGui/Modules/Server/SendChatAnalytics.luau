local rbxAnalyticsService = game:GetService("RbxAnalyticsService")

return function(p1, p2)
	-- upvalues: rbxAnalyticsService (ref)
	if not p2 then
		p2 = {}
	end
	assert(p2 ~= nil, "eventTable must not be nil")
	p2.gameId = tostring(game.GameId)
	p2.placeId = tostring(game.PlaceId)
	rbxAnalyticsService:SendEventDeferred("rcc", "lua_chat_system", p1, p2)
end