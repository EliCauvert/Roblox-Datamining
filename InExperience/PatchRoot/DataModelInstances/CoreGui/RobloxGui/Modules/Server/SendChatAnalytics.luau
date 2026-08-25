local rbxAnalyticsService = game:GetService("RbxAnalyticsService")

return function(p0, p1)
	-- upvalues: rbxAnalyticsService (ref)
	if not p1 then
		p1 = {}
	end
	assert(p1 ~= nil, "eventTable must not be nil")
	p1.gameId = tostring(game.GameId)
	p1.placeId = tostring(game.PlaceId)
	rbxAnalyticsService:SendEventDeferred("rcc", "lua_chat_system", p0, p1)
end