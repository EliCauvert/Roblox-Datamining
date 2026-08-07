local parent = script.Parent
local parent_1 = parent.Parent

return {
	name = "InlineLayout",
	exclude = { "_Index" },
	storyRoots = { parent },
	mapStory = require(parent_1.MarkdownCore).StoryMiddleware,
	roact = require(parent_1.Dev.Roact)
}