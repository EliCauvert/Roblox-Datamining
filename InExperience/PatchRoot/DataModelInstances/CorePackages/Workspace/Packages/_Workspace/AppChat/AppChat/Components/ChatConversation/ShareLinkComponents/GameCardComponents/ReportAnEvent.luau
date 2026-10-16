local GamePlayIntentFunction = require(script:FindFirstAncestor("AppChat").Parent.DiscoveryAnalytics).Events.gamePlayIntent

return function(p1, p2, p3) --[[ Line: 9 | Named "ReportAnEvent" ]]
	-- upvalues: GamePlayIntentFunction (copy)
	local config = nil
	local EventIngest = nil
	if p2 == "gamePlayIntent" then
		config = {
			conversationId = p1.conversationId,
			rootPlaceId = p1.placeId,
			joinAttemptId = p1.joinAttemptId
		}
		EventIngest = p1.eventIngest
	else
		config = { conversationId = p1.conversationId, placeId = p1.placeId }
		EventIngest = p1.eventStream
	end
	if p2 == "gamePlayIntent" then
		GamePlayIntentFunction(EventIngest, p3, {
			placeId = config.rootPlaceId,
			rootPlaceId = tonumber(config.rootPlaceId),
			conversationId = config.conversationId,
			joinAttemptId = config.joinAttemptId
		})
		
		return
	else
		EventIngest:setRBXEventStream(p3, p2, config)
	end
end