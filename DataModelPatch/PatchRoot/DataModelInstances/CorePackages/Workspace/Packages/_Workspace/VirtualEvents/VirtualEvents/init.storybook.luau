local VirtualEvents = script:FindFirstAncestor("VirtualEvents")

return {
	name = VirtualEvents.Name,
	roact = require(VirtualEvents.Parent.RoactCompat),
	storyRoots = { VirtualEvents }
}