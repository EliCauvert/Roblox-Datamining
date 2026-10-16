local Parent = script.Parent
local Parent1 = script:FindFirstAncestor("Foundation").Parent
local GetStoriesModule = require(Parent.GetStories)

return {
	name = "Components",
	group = "Foundation",
	roact = require(Parent1.Roact),
	storyRoots = GetStoriesModule.getStorybookRoots("components"),
	exclude = GetStoriesModule.getComponentFolderExcludeList("components"),
	mapStory = require(Parent.StoryMiddleware),
	packages = {
		React = require(Parent1.React),
		ReactRoblox = require(Parent1.ReactRoblox)
	}
}