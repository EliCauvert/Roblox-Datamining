local App = script:FindFirstAncestor("App")
local Parent = App.Parent
local Core = Parent.Core
local Parent1 = Parent.Parent
local TModule = require(Parent1.t)
local RoactModule = require(Parent1.Roact)
local ControlStateModule = require(Core.Control.Enum.ControlState)
local GenericTextLabelModule = require(Core.Text.GenericTextLabel.GenericTextLabel)
local WithStyleModule = require(Core.Style.withStyle)
local GetContentStyleModule = require(Core.Button.getContentStyle)
local GetIconSizeModule = require(App.ImageSet.getIconSize)
local ImageSetComponentModule = require(Parent.Core.ImageSet.ImageSetComponent)
local IconSizeModule = require(App.ImageSet.Enum.IconSize)
local PlayerContext = RoactModule.PureComponent:extend("PlayerContext")
local config = { [ControlStateModule.Default] = "TextDefault" }
local config1 = {
	[ControlStateModule.Default] = "IconOnHover",
	[ControlStateModule.Hover] = "IconDefault"
}
PlayerContext.validateProps = TModule.strictInterface({
	text = TModule.optional(TModule.string),
	icon = TModule.optional(TModule.union(TModule.string, TModule.table)),
	iconSize = TModule.optional(TModule.intersection(TModule.UDim2, function(Vector)
		if Vector.X.Scale == 0 and Vector.Y.Scale == 0 then
			return true
		else
			return false, "Only Offset values are allowed"
		end
	end)),
	iconColor = TModule.optional(TModule.Color3),
	iconTransparency = TModule.optional(TModule.number),
	onActivated = TModule.optional(TModule.callback),
	Selectable = TModule.optional(TModule.boolean),
	fontStyle = TModule.optional(TModule.union(require(Parent.Core.Style.Validator.validateFontInfo), (require(Parent.Core.Style.Validator.validateTypographyInfo)))),
	textHeight = TModule.optional(TModule.number),
	textColorStyle = TModule.optional((require(Parent.Core.Style.Validator.validateColorInfo))),
	iconPadding = TModule.optional(TModule.number),
	iconTextSpacing = TModule.optional(TModule.number),
	layoutOrder = TModule.optional(TModule.number),
	horizontalAlignment = TModule.optional(TModule.EnumItem),
	textXAlignment = TModule.optional(TModule.EnumItem)
})
PlayerContext.defaultProps = {
	text = "",
	icon = nil,
	Selectable = true,
	textHeight = 28,
	iconPadding = 4,
	iconTextSpacing = 4,
	layoutOrder = 1,
	iconSize = UDim2.fromOffset(GetIconSizeModule(IconSizeModule.Small), GetIconSizeModule(IconSizeModule.Small)),
	horizontalAlignment = Enum.HorizontalAlignment.Left,
	textXAlignment = Enum.TextXAlignment.Left
}

function PlayerContext.init(p1)
	p1.state = {}
end

function PlayerContext.render(p1)
	-- upvalues: WithStyleModule (copy), GetContentStyleModule (copy), config1 (copy), config (copy), RoactModule (copy), ImageSetComponentModule (copy), GenericTextLabelModule (copy)
	local ControlState = p1.state.controlState
	local Text = p1.props.text
	local Icon = p1.props.icon
	local IconSize = p1.props.iconSize
	local HorizontalAlignment = p1.props.horizontalAlignment
	local OnActivated = p1.props.onActivated
	
	return WithStyleModule(function(p2)
		-- upvalues: GetContentStyleModule (upval), config1 (upval), ControlState (copy), config (upval), OnActivated (copy), p1 (copy), IconSize (copy), RoactModule (upval), HorizontalAlignment (copy), Icon (copy), ImageSetComponentModule (upval), Text (copy), GenericTextLabelModule (upval)
		local ContentStyleModule = GetContentStyleModule(config1, ControlState, p2)
		local ContentStyleModule1 = GetContentStyleModule(config, ControlState, p2)
		local ContentStyleModule2 = OnActivated and ContentStyleModule or ContentStyleModule1
		local IconTransparency = if p1.props.iconTransparency then p1.props.iconTransparency elseif p1.props.iconColor then 0 else ContentStyleModule2.Transparency
		local IconColor = if p1.props.iconColor then p1.props.iconColor else ContentStyleModule2.Color
		local TextColorStyle = p1.props.textColorStyle or (if OnActivated then ContentStyleModule else ContentStyleModule1)
		local IconPadding: number = p1.props.iconPadding
		local IconTextSpacing = p1.props.iconTextSpacing
		local NewOffset = IconSize.X.Offset + IconPadding * 2
		local NewOffset1 = IconSize.Y.Offset + IconPadding * 2
		local FontStyle = p1.props.fontStyle or p2.Font.CaptionHeader
		
		return RoactModule.createElement("ImageButton", {
			Size = UDim2.new(1, 0, 0, p1.props.textHeight),
			BackgroundTransparency = 1,
			Selectable = p1.props.Selectable,
			Active = if OnActivated then true else false,
			LayoutOrder = p1.props.layoutOrder,
			[RoactModule.Event.Activated] = OnActivated
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = HorizontalAlignment,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, IconTextSpacing)
			}),
			IconFrame = Icon and RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(NewOffset, NewOffset1)
			}, {
				layout = RoactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				icon = RoactModule.createElement(ImageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = IconSize,
					Image = Icon,
					ImageColor3 = IconColor,
					ImageTransparency = IconTransparency
				})
			}),
			Text = Text and RoactModule.createElement(GenericTextLabelModule, {
				TextWrapped = true,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, if Icon then -(NewOffset + IconTextSpacing) else 0, 0, 0),
				Text = Text,
				TextXAlignment = p1.props.textXAlignment,
				fontStyle = FontStyle,
				colorStyle = TextColorStyle,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
		})
	end)
end

return PlayerContext