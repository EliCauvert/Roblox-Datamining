local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)
local text = foundationModule.Text
local image = foundationModule.Image
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local useScaledValue = foundationModule.Hooks.useScaledValue

return reactModule.memo(function(p1)
	-- upvalues: useScaledValue (ref), useTokens (ref), reactModule (ref), view (ref), foundationModule (ref), image (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "padding-medium gap-large radius-medium row align-y-center stroke-default size-full-0 auto-y",
		onActivated = p1.onActivated,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		LayoutOrder = p1.layoutOrder
	}, {
		SizeConstraint = reactModule.createElement("UISizeConstraint", {
			MaxSize = Vector2.new(useScaledValue(p1.width or 450), 1e999),
			MinSize = Vector2.new(0, useTokens().Size.Size_1700)
		}),
		RatingImage = if p1.image then reactModule.createElement(image, {
			tag = "size-1700-1700",
			LayoutOrder = 1,
			Image = p1.image,
			ScaleType = Enum.ScaleType.Fit
		}) else nil,
		RatingText = reactModule.createElement(text, {
			tag = "fill auto-y text-wrap text-align-x-left",
			LayoutOrder = 2,
			Text = p1.displayText or "",
			fontStyle = p1.fontStyle
		})
	})
end)