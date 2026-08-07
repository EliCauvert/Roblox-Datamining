local parent = script.Parent.Parent

return {
	[require(parent.Enums.Overlay).AttributionTraversal] = require(parent.Components.AttributionTraversal)
}