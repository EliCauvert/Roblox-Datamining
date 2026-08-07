return function(p0, p1, p2, p3, p4, p5) --[[ line: 3 ]]
	assert(type(p1) == "string", "Expected eventContext to be a string")
	p0:setRBXEventStream(p1, "openYouTubeVideo", {
		videoTitle = p2,
		videoID = p3,
		universeId = p4,
		interactionType = p5
	})
end