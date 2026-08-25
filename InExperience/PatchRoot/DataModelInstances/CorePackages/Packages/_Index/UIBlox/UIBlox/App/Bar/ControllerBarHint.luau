local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local genericTextLabelModule = require(parent_1.Core.Text.GenericTextLabel.GenericTextLabel)
local keyLabelModule = require(parent.Menu.KeyLabel.KeyLabel)
local controllerBarHintInternalPadding = require(script.Parent.BarConstants).ControllerBarHintInternalPadding
local controllerBarHint = roactModule.PureComponent:extend("ControllerBarHint")
controllerBarHint.validateProps = tModule.strictInterface({
	layoutOrder = tModule.optional(tModule.integer),
	keyCode = tModule.enum(Enum.KeyCode),
	text = tModule.string,
	maxWidth = tModule.optional(tModule.number),
	hintTextSize = tModule.optional(tModule.number)
})

function controllerBarHint.render(p0)
	-- upvalues: withStyleModule (ref), roactModule (ref), controllerBarHintInternalPadding (ref), keyLabelModule (ref), genericTextLabelModule (ref)
	return withStyleModule(function(p1)
		-- upvalues: roactModule (copy), p0 (ref), controllerBarHintInternalPadding (copy), keyLabelModule (copy), genericTextLabelModule (copy)
		local theme = p1.Theme
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p0.props.layoutOrder,
			AutomaticSize = Enum.AutomaticSize.X
		}, {
			Layout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, controllerBarHintInternalPadding)
			}),
			ControllerBarHintIcon = roactModule.createElement(keyLabelModule, {
				LayoutOrder = 1,
				iconThemeKey = "IconEmphasis",
				keyCode = p0.props.keyCode
			}),
			ControllerBarHintText = roactModule.createElement(genericTextLabelModule, {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				TextSize = p0.props.hintTextSize,
				maxSize = p0.props.maxWidth and Vector2.new(p0.props.maxWidth) or nil,
				fontStyle = p1.Font.Header2,
				colorStyle = theme.TextEmphasis,
				AutomaticSize = if not p0.props.maxWidth then Enum.AutomaticSize.X else nil,
				TextTransparency = theme.TextEmphasis.TextTransparency,
				fluidSizing = if p0.props.maxWidth then true else false,
				Text = p0.props.text,
				TextTruncate = if p0.props.maxWidth then Enum.TextTruncate.AtEnd else nil,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			})
		})
	end)
end

return controllerBarHint