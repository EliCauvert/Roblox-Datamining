local graphing = script:FindFirstAncestor("Graphing")
local parent = graphing.Parent

return {
	name = "Graphing",
	storyRoots = { graphing.Components },
	roact = require(parent.React),
	reactRoblox = require(parent.ReactRoblox)
}