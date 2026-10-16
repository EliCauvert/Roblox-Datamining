local Parent = script.Parent.Parent

return {
	[require(Parent.Enums.Overlay).AttributionTraversal] = require(Parent.Components.AttributionTraversal)
}