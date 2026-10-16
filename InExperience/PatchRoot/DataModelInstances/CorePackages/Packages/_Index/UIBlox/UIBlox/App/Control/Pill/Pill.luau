local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Core = Parent1.Core
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local FoundationModule = require(Parent2.Foundation)
local IconSizeModule = require(Parent.ImageSet.Enum.IconSize)
local GetIconSizeModule = require(Parent.ImageSet.getIconSize)
local WithStyleModule = require(Core.Style.withStyle)
local ControlStateModule = require(Core.Control.Enum.ControlState)
local InteractableModule = require(Core.Control.Interactable)
local GetContentStyleModule = require(Core.Button.getContentStyle)
local GenericTextLabelModule = require(Core.Text.GenericTextLabel.GenericTextLabel)
local ImageSetComponentModule = require(Parent1.Core.ImageSet.ImageSetComponent)
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local GetTextSizeModule = require(Parent1.Core.Text.GetTextSize)
local GetFontFromFontStyleModule = require(Parent1.Core.Text.GetFontFromFontStyle)
local Pill = RoactModule.PureComponent:extend("Pill")
Pill.validateProps = TModule.strictInterface({
	text = TModule.optional(TModule.string),
	isSelected = TModule.optional(TModule.boolean),
	isDisabled = TModule.optional(TModule.boolean),
	isLoading = TModule.optional(TModule.boolean),
	icon = TModule.union(TModule.string, (require(Core.ImageSet.Validator.validateImageSetData))),
	onActivated = TModule.callback
})
Pill.defaultProps = {
	text = "",
	isSelected = false,
	isDisabled = false,
	isLoading = false
}

function Pill.init(p1) --[[ Line: 57 ]]
	-- upvalues: ControlStateModule (copy)
	p1.state = { controlState = ControlStateModule.Initialize }
end

function Pill.render(p1) --[[ Line: 63 ]]
	-- upvalues: WithStyleModule (copy), ControlStateModule (copy), GetContentStyleModule (copy), GetIconSizeModule (copy), IconSizeModule (copy), GetTextSizeModule (copy), FoundationFontFaceMigration (copy), GetFontFromFontStyleModule (copy), RoactModule (copy), InteractableModule (copy), ImageSetComponentModule (copy), GenericTextLabelModule (copy), Skeleton (copy), Radius (copy)
	return WithStyleModule(function(p2) --[[ Line: 64 ]]
		-- upvalues: p1 (copy), ControlStateModule (upval), GetContentStyleModule (upval), GetIconSizeModule (upval), IconSizeModule (upval), GetTextSizeModule (upval), FoundationFontFaceMigration (upval), GetFontFromFontStyleModule (upval), RoactModule (upval), InteractableModule (upval), ImageSetComponentModule (upval), GenericTextLabelModule (upval), Skeleton (upval), Radius (upval)
		local _Font = p2.Font
		local IsSelected = p1.props.isSelected
		local IsDisabled = p1.props.isDisabled
		local IsLoading = p1.props.isLoading
		local Icon = p1.props.icon
		local Text: string = p1.props.text
		local OnActivated = p1.props.onActivated
		local config = {
			[ControlStateModule.Default] = if IsSelected then "SystemPrimaryContent" else "TextDefault",
			[ControlStateModule.Hover] = if IsSelected then "SystemPrimaryContent" else "TextEmphasis"
		}
		local config1 = {
			[ControlStateModule.Default] = if IsSelected then "SystemPrimaryDefault" else "BackgroundUIDefault",
			[ControlStateModule.Hover] = if IsSelected then "SystemPrimaryOnHover" else "BackgroundUIDefault"
		}
		local ContentStyleModule = GetContentStyleModule({
			[ControlStateModule.Default] = if IsSelected then "SystemPrimaryContent" else "IconDefault",
			[ControlStateModule.Hover] = if IsSelected then "SystemPrimaryContent" else "IconEmphasis"
		}, p1.state.controlState, p2)
		local ContentStyleModule1 = GetContentStyleModule(config, p1.state.controlState, p2)
		local ContentStyleModule2 = GetContentStyleModule(config1, p1.state.controlState, p2)
		local IconSizeModule1: number = GetIconSizeModule(IconSizeModule.Small)
		local ScaledRelativeSize = _Font.CaptionHeader.RelativeSize * _Font.BaseSize
		local X: number = GetTextSizeModule(Text, ScaledRelativeSize, if FoundationFontFaceMigration then GetFontFromFontStyleModule(_Font.CaptionHeader) else _Font.CaptionHeader.Font, Vector2.new(10000, 10000)).X
		local NewX = X + 24
		local XOffset = 240 - (28 + IconSizeModule1)
		
		return if IsLoading then RoactModule.createElement(Skeleton, {
			Size = UDim2.fromOffset(NewX + 4 + IconSizeModule1, 28),
			radius = Radius.Circle
		}) else RoactModule.createElement(InteractableModule, {
			Size = UDim2.new(0, NewX + 4 + IconSizeModule1, 0, 28),
			BackgroundColor3 = ContentStyleModule2.Color,
			BackgroundTransparency = ContentStyleModule2.Transparency,
			AutoButtonColor = false,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			isDisabled = IsDisabled,
			[RoactModule.Event.Activated] = if IsLoading then nil else OnActivated or nil,
			onStateChanged = function(_, ControlState) --[[ Line: 115 ]]
				-- upvalues: p1 (upval)
				p1:setState({ controlState = ControlState })
			end
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, 0),
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			Content = RoactModule.createElement("Frame", {
				ClipsDescendants = true,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, X + 4 + IconSizeModule1, 1, 0)
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 4),
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				Icon = RoactModule.createElement(ImageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.fromOffset(IconSizeModule1, IconSizeModule1),
					Image = Icon,
					ImageColor3 = ContentStyleModule.Color,
					ImageTransparency = ContentStyleModule.Transparency
				}),
				TextArea = string.len(Text) > 0 and RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(X, ScaledRelativeSize)
				}, {
					PillText = RoactModule.createElement(GenericTextLabelModule, {
						Text = Text,
						BackgroundTransparency = 1,
						fontStyle = _Font.CaptionHeader,
						colorStyle = ContentStyleModule1,
						TextTruncate = Enum.TextTruncate.AtEnd,
						Size = UDim2.fromOffset(XOffset, ScaledRelativeSize),
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						[RoactModule.Ref] = p1.PillText
					}),
					RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(XOffset, 28) })
				}),
				UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(216, 28) })
			}),
			UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(240, 28) })
		}) or RoactModule.createElement(Skeleton, {
			Size = UDim2.fromOffset(NewX + 4 + IconSizeModule1, 28),
			radius = Radius.Circle
		})
	end)
end

return Pill