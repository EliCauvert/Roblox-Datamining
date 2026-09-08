local parent = script.Parent
local parent_1 = script:FindFirstAncestor("Foundation").Parent
local getStoriesModule = require(parent.GetStories)

return {
	name = "Components [Base]",
	group = "Foundation",
	roact = require(parent_1.Roact),
	storyRoots = getStoriesModule.getStorybookRoots("base"),
	exclude = getStoriesModule.getComponentFolderExcludeList("base"),
	mapStory = require(parent.StoryMiddleware),
	packages = {
		React = require(parent_1.React),
		ReactRoblox = require(parent_1.ReactRoblox)
	}
}