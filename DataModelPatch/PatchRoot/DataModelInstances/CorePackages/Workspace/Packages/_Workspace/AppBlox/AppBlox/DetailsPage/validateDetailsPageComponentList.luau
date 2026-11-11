local Parent = script:FindFirstAncestor("AppBlox").Parent
local TModule = require(Parent.t)

return TModule.map(TModule.string, TModule.strictInterface({
	portraitLayoutOrder = TModule.integer,
	portraitZIndex = if require(Parent.SharedFlags).FFlagLuaAppFixEdpRecommendedCarouselHoverZIndex then TModule.optional(TModule.integer) else nil,
	landscapeLayoutOrder = TModule.integer,
	landscapePosition = require(script.Parent.ContentPosition).isEnumValue,
	renderComponent = TModule.callback,
	showCornerGradient = TModule.optional(TModule.boolean),
	useSelectionBumper = TModule.optional(TModule.boolean),
	visible = TModule.optional(TModule.boolean)
}))