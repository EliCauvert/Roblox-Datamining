local parent = script:FindFirstAncestor("AppBlox").Parent
local tModule = require(parent.t)

return tModule.map(tModule.string, tModule.strictInterface({
	portraitLayoutOrder = tModule.integer,
	portraitZIndex = if require(parent.SharedFlags).FFlagLuaAppFixEdpRecommendedCarouselHoverZIndex then tModule.optional(tModule.integer) else nil,
	landscapeLayoutOrder = tModule.integer,
	landscapePosition = require(script.Parent.ContentPosition).isEnumValue,
	renderComponent = tModule.callback,
	showCornerGradient = tModule.optional(tModule.boolean),
	useSelectionBumper = tModule.optional(tModule.boolean),
	visible = tModule.optional(tModule.boolean)
}))