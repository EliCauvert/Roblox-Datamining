local parent = script.Parent

return {
	name = "MarkdownCore",
	exclude = { "_Index" },
	storyRoots = { parent },
	mapStory = require(parent.StoryMiddleware),
	roact = require(parent.Parent.Dev.Roact)
}