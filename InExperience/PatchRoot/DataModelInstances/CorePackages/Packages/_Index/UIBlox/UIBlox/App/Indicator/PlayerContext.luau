local app = script:FindFirstAncestor("App")
local parent = app.Parent
local core = parent.Core
local parent_1 = parent.Parent
local tModule = require(parent_1.t)
local roactModule = require(parent_1.Roact)
local controlStateModule = require(core.Control.Enum.ControlState)
local genericTextLabelModule = require(core.Text.GenericTextLabel.GenericTextLabel)
local withStyleModule = require(core.Style.withStyle)
local getContentStyleModule = require(core.Button.getContentStyle)
local getIconSizeModule = require(app.ImageSet.getIconSize)
local imageSetComponentModule = require(parent.Core.ImageSet.ImageSetComponent)
local iconSizeModule = require(app.ImageSet.Enum.IconSize)
local validateFontInfoModule = require(parent.Core.Style.Validator.validateFontInfo)
local validateTypographyInfoModule = require(parent.Core.Style.Validator.validateTypographyInfo)
local validateColorInfoModule = require(parent.Core.Style.Validator.validateColorInfo)
local playerContext = roactModule.PureComponent:extend("PlayerContext")
local t = { [controlStateModule.Default] = "TextDefault" }
local t_1 = {
	[controlStateModule.Default] = "IconOnHover",
	[controlStateModule.Hover] = "IconDefault"
}
playerContext.validateProps = tModule.strictInterface({
	text = tModule.optional(tModule.string),
	icon = tModule.optional(tModule.union(tModule.string, tModule.table)),
	iconSize = tModule.optional(tModule.intersection(tModule.UDim2, function(p0)
		if p0.X.Scale == 0 and p0.Y.Scale == 0 then
			return true
		end
		return false, "Only Offset values are allowed"
	end)),
	iconColor = tModule.optional(tModule.Color3),
	iconTransparency = tModule.optional(tModule.number),
	onActivated = tModule.optional(tModule.callback),
	Selectable = tModule.optional(tModule.boolean),
	fontStyle = tModule.optional(tModule.union(validateFontInfoModule, validateTypographyInfoModule)),
	textHeight = tModule.optional(tModule.number),
	textColorStyle = tModule.optional(validateColorInfoModule),
	iconPadding = tModule.optional(tModule.number),
	iconTextSpacing = tModule.optional(tModule.number),
	layoutOrder = tModule.optional(tModule.number),
	horizontalAlignment = tModule.optional(tModule.EnumItem),
	textXAlignment = tModule.optional(tModule.EnumItem)
})
playerContext.defaultProps = {
	text = "",
	icon = nil,
	Selectable = true,
	textHeight = 28,
	iconPadding = 4,
	iconTextSpacing = 4,
	layoutOrder = 1,
	iconSize = UDim2.fromOffset(getIconSizeModule(iconSizeModule.Small), getIconSizeModule(iconSizeModule.Small)),
	horizontalAlignment = Enum.HorizontalAlignment.Left,
	textXAlignment = Enum.TextXAlignment.Left
}

function playerContext.init(p1)
	p1.state = {}
end

function playerContext.render(p2)
	-- upvalues: withStyleModule (ref), getContentStyleModule (ref), t_1 (ref), t (ref), roactModule (ref), imageSetComponentModule (ref), genericTextLabelModule (ref)
	local controlState = p2.state.controlState
	local text = p2.props.text
	local icon = p2.props.icon
	local iconSize = p2.props.iconSize
	local horizontalAlignment = p2.props.horizontalAlignment
	local onActivated = p2.props.onActivated
	
	return withStyleModule(function(p3)
		-- upvalues: getContentStyleModule (copy), t_1 (copy), controlState (ref), t (copy), onActivated (ref), p2 (ref), iconSize (ref), roactModule (copy), horizontalAlignment (ref), icon (ref), imageSetComponentModule (copy), text (ref), genericTextLabelModule (copy)
		local var16 = getContentStyleModule(t_1, controlState, p3)
		local var17 = getContentStyleModule(t, controlState, p3)
		local var18 = if onActivated then var16 else var17
		local var19 = if not p2.props.iconTransparency then if p2.props.iconColor then 0 else var18.Transparency else p2.props.iconTransparency
		local var20 = if not p2.props.iconColor then var18.Color else p2.props.iconColor
		local textHeight = p2.props.textHeight
		local textColorStyle = p2.props.textColorStyle or (if onActivated then var16 else var17)
		local iconPadding = p2.props.iconPadding
		local iconTextSpacing = p2.props.iconTextSpacing
		local var22 = iconSize.X.Offset + iconPadding * 2
		
		return roactModule.createElement("ImageButton", {
			Size = UDim2.new(1, 0, 0, textHeight),
			BackgroundTransparency = 1,
			Selectable = p2.props.Selectable,
			Active = if onActivated then true else false,
			LayoutOrder = p2.props.layoutOrder,
			[roactModule.Event.Activated] = onActivated
		}, {
			UIListLayout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = horizontalAlignment,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, iconTextSpacing)
			}),
			IconFrame = icon and roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(var22, iconSize.Y.Offset + iconPadding * 2)
			}, {
				layout = roactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				icon = roactModule.createElement(imageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = iconSize,
					Image = icon,
					ImageColor3 = var20,
					ImageTransparency = var19
				})
			}),
			Text = text and roactModule.createElement(genericTextLabelModule, {
				TextWrapped = true,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, if icon then -(var22 + iconTextSpacing) else 0, 0, 0),
				Text = text,
				TextXAlignment = p2.props.textXAlignment,
				fontStyle = p2.props.fontStyle or p3.Font.CaptionHeader,
				colorStyle = textColorStyle,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
		})
	end)
end

return playerContext