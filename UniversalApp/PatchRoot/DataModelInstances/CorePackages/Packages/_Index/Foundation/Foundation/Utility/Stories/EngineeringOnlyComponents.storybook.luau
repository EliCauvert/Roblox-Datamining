local parent = script.Parent
local parent_1 = script:FindFirstAncestor("Foundation").Parent

return {
	name = "Components [engineering-only]",
	group = "Foundation",
	roact = require(parent_1.Roact),
	storyRoots = require(parent.GetStories)("engineering-only"),
	mapStory = require(parent.StoryMiddleware),
	packages = {
		React = require(parent_1.React),
		ReactRoblox = require(parent_1.ReactRoblox)
	}
}