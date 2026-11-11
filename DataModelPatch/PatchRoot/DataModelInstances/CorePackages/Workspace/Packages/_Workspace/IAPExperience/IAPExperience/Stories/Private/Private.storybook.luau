local Parent = script.Parent.Parent.Parent

return {
	group = "/IAPExperience",
	roact = require(Parent.Parent.Roact),
	mapStory = require(Parent.Utility.StoryMiddleware)
}