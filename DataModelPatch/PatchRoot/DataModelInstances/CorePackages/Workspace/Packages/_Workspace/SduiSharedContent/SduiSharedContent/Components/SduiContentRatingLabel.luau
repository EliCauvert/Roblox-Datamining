local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.SduiCompat)
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue

return ReactModule.memo(function(p1)
	-- upvalues: UseScaledValueFunction (copy), UseTokensFunction (copy), ReactModule (copy), View (copy), FoundationModule (copy), Image (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "padding-medium gap-large radius-medium row align-y-center stroke-default size-full-0 auto-y",
		onActivated = p1.onActivated,
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		},
		LayoutOrder = p1.layoutOrder
	}, {
		SizeConstraint = ReactModule.createElement("UISizeConstraint", {
			MaxSize = Vector2.new(UseScaledValueFunction(p1.width or 450), 1e999),
			MinSize = Vector2.new(0, UseTokensFunction().Size.Size_1700)
		}),
		RatingImage = if p1.image then ReactModule.createElement(Image, {
			tag = "size-1700-1700",
			LayoutOrder = 1,
			Image = p1.image,
			ScaleType = Enum.ScaleType.Fit
		}) else nil,
		RatingText = ReactModule.createElement(Text, {
			tag = "fill auto-y text-wrap text-align-x-left",
			LayoutOrder = 2,
			Text = p1.displayText or "",
			fontStyle = p1.fontStyle
		})
	})
end)