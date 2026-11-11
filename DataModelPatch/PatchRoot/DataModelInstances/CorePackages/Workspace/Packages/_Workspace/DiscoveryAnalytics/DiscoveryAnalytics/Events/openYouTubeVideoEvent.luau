return function(p1, p2, VideoTitle, VideoID, UniverseId, InteractionType)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	p1:setRBXEventStream(p2, "openYouTubeVideo", {
		videoTitle = VideoTitle,
		videoID = VideoID,
		universeId = UniverseId,
		interactionType = InteractionType
	})
end