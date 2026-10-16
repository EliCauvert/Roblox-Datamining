local Parent = script.Parent
local Parent1 = script:FindFirstAncestor("Foundation").Parent

return {
	name = "Elements",
	group = "Foundation",
	roact = require(Parent1.Roact),
	storyRoots = require(Parent.GetStories).getStorybookRoots("elements"),
	mapStory = require(Parent.StoryMiddleware),
	packages = {
		React = require(Parent1.React),
		ReactRoblox = require(Parent1.ReactRoblox)
	}
}