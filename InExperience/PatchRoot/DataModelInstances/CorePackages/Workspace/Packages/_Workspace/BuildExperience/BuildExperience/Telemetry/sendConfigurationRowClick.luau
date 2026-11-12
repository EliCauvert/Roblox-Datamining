local SendBuildExperienceEventModule = require(script:FindFirstAncestor("BuildExperience").Telemetry.sendBuildExperienceEvent)

return function(Context, p1, Item)
	-- upvalues: SendBuildExperienceEventModule (copy)
	SendBuildExperienceEventModule("CONFIGURATION_ROW_CLICK", {
		universeId = p1.universeId,
		placeId = p1.placeId,
		conversationId = p1.sessionId
	}, {
		item = Item,
		context = Context,
		isInExperience = if game.GameId == 0 then "false" else "true"
	})
end