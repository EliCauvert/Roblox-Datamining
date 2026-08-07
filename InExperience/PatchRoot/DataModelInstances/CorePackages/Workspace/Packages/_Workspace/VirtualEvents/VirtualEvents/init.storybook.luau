local virtualEvents = script:FindFirstAncestor("VirtualEvents")

return {
	name = virtualEvents.Name,
	roact = require(virtualEvents.Parent.RoactCompat),
	storyRoots = { virtualEvents }
}