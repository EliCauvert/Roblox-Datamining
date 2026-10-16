local Graphing = script:FindFirstAncestor("Graphing")
local Parent = Graphing.Parent

return {
	name = "Graphing Examples",
	storyRoots = { Graphing.Stories },
	roact = require(Parent.React),
	reactRoblox = require(Parent.ReactRoblox)
}