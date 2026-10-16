local Graphing = script:FindFirstAncestor("Graphing")
local Parent = Graphing.Parent

return {
	name = "Graphing",
	storyRoots = { Graphing.Components },
	roact = require(Parent.React),
	reactRoblox = require(Parent.ReactRoblox)
}