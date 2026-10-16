local TModule = require(script:FindFirstAncestor("AppBlox").Parent.t)

return TModule.map(TModule.string, TModule.strictInterface({
	portraitLayoutOrder = TModule.integer,
	portraitZIndex = TModule.optional(TModule.integer),
	landscapeLayoutOrder = TModule.integer,
	landscapePosition = require(script.Parent.ContentPosition).isEnumValue,
	renderComponent = TModule.callback,
	showCornerGradient = TModule.optional(TModule.boolean),
	useSelectionBumper = TModule.optional(TModule.boolean),
	visible = TModule.optional(TModule.boolean)
}))