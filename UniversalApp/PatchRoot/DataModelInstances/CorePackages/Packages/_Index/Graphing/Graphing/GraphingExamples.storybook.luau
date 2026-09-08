local graphing = script:FindFirstAncestor("Graphing")
local parent = graphing.Parent

return {
	name = "Graphing Examples",
	storyRoots = { graphing.Stories },
	roact = require(parent.React),
	reactRoblox = require(parent.ReactRoblox)
}