local parent = script.Parent
local parent_1 = script:FindFirstAncestor("Foundation").Parent

return {
	name = "Hooks",
	group = "Foundation",
	roact = require(parent_1.Roact),
	storyRoots = require(parent.GetStories)("hooks"),
	mapStory = require(parent.StoryMiddleware),
	packages = {
		React = require(parent_1.React),
		ReactRoblox = require(parent_1.ReactRoblox)
	}
}