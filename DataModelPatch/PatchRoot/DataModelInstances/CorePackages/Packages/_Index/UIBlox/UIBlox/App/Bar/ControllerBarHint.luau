local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local GenericTextLabelModule = require(Parent1.Core.Text.GenericTextLabel.GenericTextLabel)
local KeyLabelModule = require(Parent.Menu.KeyLabel.KeyLabel)
local ControllerBarHintInternalPadding = require(script.Parent.BarConstants).ControllerBarHintInternalPadding
local ControllerBarHint = RoactModule.PureComponent:extend("ControllerBarHint")
ControllerBarHint.validateProps = TModule.strictInterface({
	layoutOrder = TModule.optional(TModule.integer),
	keyCode = TModule.enum(Enum.KeyCode),
	text = TModule.string,
	maxWidth = TModule.optional(TModule.number),
	hintTextSize = TModule.optional(TModule.number)
})

function ControllerBarHint.render(p1)
	-- upvalues: WithStyleModule (copy), RoactModule (copy), ControllerBarHintInternalPadding (copy), KeyLabelModule (copy), GenericTextLabelModule (copy)
	return WithStyleModule(function(p2)
		-- upvalues: RoactModule (upval), p1 (copy), ControllerBarHintInternalPadding (upval), KeyLabelModule (upval), GenericTextLabelModule (upval)
		local Theme = p2.Theme
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p1.props.layoutOrder,
			AutomaticSize = Enum.AutomaticSize.X
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, ControllerBarHintInternalPadding)
			}),
			ControllerBarHintIcon = RoactModule.createElement(KeyLabelModule, {
				LayoutOrder = 1,
				iconThemeKey = "IconEmphasis",
				keyCode = p1.props.keyCode
			}),
			ControllerBarHintText = RoactModule.createElement(GenericTextLabelModule, {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				TextSize = p1.props.hintTextSize,
				maxSize = p1.props.maxWidth and Vector2.new(p1.props.maxWidth) or nil,
				fontStyle = p2.Font.Header2,
				colorStyle = Theme.TextEmphasis,
				AutomaticSize = if p1.props.maxWidth then nil else Enum.AutomaticSize.X or nil,
				TextTransparency = Theme.TextEmphasis.TextTransparency,
				fluidSizing = if p1.props.maxWidth then true else false,
				Text = p1.props.text,
				TextTruncate = p1.props.maxWidth and Enum.TextTruncate.AtEnd or nil,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			})
		})
	end)
end

return ControllerBarHint