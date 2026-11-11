local Parent = script.Parent
local Parent1 = Parent.Parent

return {
	name = "Markdown",
	exclude = { "_Index" },
	storyRoots = { Parent },
	mapStory = require(Parent1.MarkdownCore).StoryMiddleware,
	roact = require(Parent1.Dev.Roact)
}