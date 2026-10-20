return function(p1, p2, Stage)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(Stage) == "string", "Expected appStage to be a string")
	p1:setRBXEventStream(p2, "appStageLoaded", { stage = Stage })
end