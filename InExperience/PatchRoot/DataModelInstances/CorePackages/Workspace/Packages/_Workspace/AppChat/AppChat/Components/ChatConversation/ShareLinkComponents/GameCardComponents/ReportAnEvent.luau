local gamePlayIntent = require(script:FindFirstAncestor("AppChat").Parent.DiscoveryAnalytics).Events.gamePlayIntent

return function(p0, p1, p2)
	-- upvalues: gamePlayIntent (ref)
	local t, eventIngest
	local _ = nil
	local _ = nil
	
	if p1 == "gamePlayIntent" then
		t = {
			conversationId = p0.conversationId,
			rootPlaceId = p0.placeId,
			joinAttemptId = p0.joinAttemptId
		}
		eventIngest = p0.eventIngest
	else
		t = { conversationId = p0.conversationId, placeId = p0.placeId }
		eventIngest = p0.eventStream
	end
	if p1 == "gamePlayIntent" then
		gamePlayIntent(eventIngest, p2, {
			placeId = t.rootPlaceId,
			rootPlaceId = tonumber(t.rootPlaceId),
			conversationId = t.conversationId,
			joinAttemptId = t.joinAttemptId
		})
		
		return
	end
	eventIngest:setRBXEventStream(p2, p1, t)
end