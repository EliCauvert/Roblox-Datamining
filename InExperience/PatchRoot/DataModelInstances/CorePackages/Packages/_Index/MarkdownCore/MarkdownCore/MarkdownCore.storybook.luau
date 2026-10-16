local Parent = script.Parent

return {
	name = "MarkdownCore",
	exclude = { "_Index" },
	storyRoots = { Parent },
	mapStory = require(Parent.StoryMiddleware),
	roact = require(Parent.Parent.Dev.Roact)
}