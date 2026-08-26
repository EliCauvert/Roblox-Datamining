return function(p1, p2, p3, p4, p5, p6)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	p1:setRBXEventStream(p2, "openYouTubeVideo", {
		videoTitle = p3,
		videoID = p4,
		universeId = p5,
		interactionType = p6
	})
end