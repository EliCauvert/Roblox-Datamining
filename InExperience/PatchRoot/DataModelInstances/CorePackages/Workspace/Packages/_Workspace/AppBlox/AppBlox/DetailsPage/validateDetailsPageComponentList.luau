local tModule = require(script:FindFirstAncestor("AppBlox").Parent.t)

return tModule.map(tModule.string, tModule.strictInterface({
	portraitLayoutOrder = tModule.integer,
	portraitZIndex = tModule.optional(tModule.integer),
	landscapeLayoutOrder = tModule.integer,
	landscapePosition = require(script.Parent.ContentPosition).isEnumValue,
	renderComponent = tModule.callback,
	showCornerGradient = tModule.optional(tModule.boolean),
	useSelectionBumper = tModule.optional(tModule.boolean),
	visible = tModule.optional(tModule.boolean)
}))