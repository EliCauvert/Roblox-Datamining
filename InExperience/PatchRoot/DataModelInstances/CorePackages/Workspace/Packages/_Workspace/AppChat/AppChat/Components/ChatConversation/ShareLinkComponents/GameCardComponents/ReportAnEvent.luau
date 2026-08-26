local gamePlayIntent = require(script:FindFirstAncestor("AppChat").Parent.DiscoveryAnalytics).Events.gamePlayIntent

return function(p1, p2, p3)
	-- upvalues: gamePlayIntent (ref)
	local t, eventIngest
	local _ = nil
	local _ = nil
	
	if p2 == "gamePlayIntent" then
		t = {
			conversationId = p1.conversationId,
			rootPlaceId = p1.placeId,
			joinAttemptId = p1.joinAttemptId
		}
		eventIngest = p1.eventIngest
	else
		t = { conversationId = p1.conversationId, placeId = p1.placeId }
		eventIngest = p1.eventStream
	end
	if p2 == "gamePlayIntent" then
		gamePlayIntent(eventIngest, p3, {
			placeId = t.rootPlaceId,
			rootPlaceId = tonumber(t.rootPlaceId),
			conversationId = t.conversationId,
			joinAttemptId = t.joinAttemptId
		})
		
		return
	end
	eventIngest:setRBXEventStream(p3, p2, t)
end