local SendBuildExperienceEventModule = require(script:FindFirstAncestor("BuildExperience").Telemetry.sendBuildExperienceEvent)

return function(Source, p1, Item)
	-- upvalues: SendBuildExperienceEventModule (copy)
	SendBuildExperienceEventModule("CONFIGURATION_ROW_CLICK", {
		universeId = p1.universeId,
		placeId = p1.placeId,
		conversationId = p1.sessionId
	}, {
		item = Item,
		source = Source,
		surface = if game.GameId == 0 then "app" else "in_experience"
	})
end