local Parent = script.Parent.Parent.Parent
local Core = Parent.Core
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local CryoModule = require(Parent1.Cryo)
local InteractableModule = require(Core.Control.Interactable)
local ControlStateModule = require(Core.Control.Enum.ControlState)
local GetContentStyleModule = require(Core.Button.getContentStyle)
local WithStyleModule = require(Parent.Core.Style.withStyle)
local ImageSetComponentModule = require(Core.ImageSet.ImageSetComponent)
local Skeleton = require(Parent1.Foundation).Skeleton
local IconSizeModule = require(Parent.App.ImageSet.Enum.IconSize)
local GetIconSizeModule = require(Parent.App.ImageSet.getIconSize)
local GenericTextLabelModule = require(Core.Text.GenericTextLabel.GenericTextLabel)
local ValidateFontInfoModule = require(Parent.Core.Style.Validator.validateFontInfo)
local ValidateImageModule = require(Core.ImageSet.Validator.validateImage)
local SegmentedControlTabName = RoactModule.PureComponent:extend("SegmentedControlTabName")

function SegmentedControlTabName.init(p1) --[[ Line: 32 ]]
	-- upvalues: ControlStateModule (copy)
	p1.state = { controlState = ControlStateModule.Initialize }
	
	function p1.onStateChanged(p2, ControlState) --[[ Line: 37 ]]
		-- upvalues: p1 (copy)
		p1:setState({ controlState = ControlState })
		
		if p1.props.onStateChanged then
			p1.props.onStateChanged(p2, ControlState)
		end
	end
end

local InterfaceResult = TModule.interface({ [ControlStateModule.Default] = TModule.string })
SegmentedControlTabName.validateProps = TModule.interface({
	icon = TModule.optional(ValidateImageModule),
	text = TModule.optional(TModule.string),
	fontStyle = TModule.optional(ValidateFontInfoModule),
	textStateColorMap = TModule.optional(InterfaceResult),
	iconStateColorMap = TModule.optional(InterfaceResult),
	isDisabled = TModule.optional(TModule.boolean),
	isLoading = TModule.optional(TModule.boolean),
	onActivated = TModule.callback,
	onStateChanged = TModule.optional(TModule.callback),
	userInteractionEnabled = TModule.optional(TModule.boolean),
	isSelectedStyle = TModule.optional(TModule.boolean)
})
SegmentedControlTabName.defaultProps = {
	isDisabled = false,
	isLoading = false,
	isSelectedStyle = false,
	SliceCenter = Rect.new(8, 8, 9, 9),
	textStateColorMap = {
		[ControlStateModule.Default] = "TextDefault",
		[ControlStateModule.Hover] = "TextEmphasis"
	},
	buttonStateColorMap = { [ControlStateModule.Default] = "SecondaryContent" }
}

function SegmentedControlTabName.render(p1) --[[ Line: 101 ]]
	-- upvalues: WithStyleModule (copy), ControlStateModule (copy), GetContentStyleModule (copy), RoactModule (copy), Skeleton (copy), ImageSetComponentModule (copy), GetIconSizeModule (copy), IconSizeModule (copy), GenericTextLabelModule (copy), InteractableModule (copy), CryoModule (copy)
	return WithStyleModule(function(p2) --[[ Line: 102 ]]
		-- upvalues: p1 (copy), ControlStateModule (upval), GetContentStyleModule (upval), RoactModule (upval), Skeleton (upval), ImageSetComponentModule (upval), GetIconSizeModule (upval), IconSizeModule (upval), GenericTextLabelModule (upval), InteractableModule (upval), CryoModule (upval)
		local ControlState = p1.state.controlState
		local Text = p1.props.text
		local Icon = p1.props.icon
		local IsLoading = p1.props.isLoading
		local IsDisabled = p1.props.isDisabled
		local ButtonStateColorMap = p1.props.buttonStateColorMap
		local ContentStateColorMap = p1.props.contentStateColorMap
		local TextStateColorMap = p1.props.textStateColorMap or ContentStateColorMap
		local IconStateColorMap = p1.props.iconStateColorMap or ContentStateColorMap
		
		if IsLoading then
			IsDisabled = true
		end
		local Disabled = if p1.props.isDisabled then ControlStateModule.Disabled elseif p1.props.isSelectedStyle then ControlStateModule.Hover else ControlState
		local ContentStyleModule = GetContentStyleModule(ButtonStateColorMap, ControlState, p2)
		local ContentStyleModule1 = Text and GetContentStyleModule(TextStateColorMap, Disabled, p2)
		local ContentStyleModule2 = Icon and GetContentStyleModule(IconStateColorMap, ControlState, p2)
		local FontStyle = p1.props.fontStyle or p2.Font.Header2
		
		return RoactModule.createElement(InteractableModule, CryoModule.Dictionary.join(p1.props, {
			icon = CryoModule.None,
			text = CryoModule.None,
			buttonStateColorMap = CryoModule.None,
			contentStateColorMap = CryoModule.None,
			textStateColorMap = CryoModule.None,
			iconStateColorMap = CryoModule.None,
			onActivated = CryoModule.None,
			isLoading = CryoModule.None,
			isSelectedStyle = CryoModule.None,
			[RoactModule.Children] = CryoModule.None,
			isDisabled = IsDisabled,
			onStateChanged = p1.onStateChanged,
			userInteractionEnabled = p1.props.userInteractionEnabled,
			Image = CryoModule.None,
			ScaleType = Enum.ScaleType.Slice,
			ImageColor3 = ContentStyleModule.Color,
			ImageTransparency = ContentStyleModule.Transparency,
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			[RoactModule.Event.Activated] = p1.props.onActivated
		}), {
			ButtonContent = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, if IsLoading then {
				isLoadingShimmer = RoactModule.createElement(Skeleton, { Size = UDim2.fromScale(1, 1) })
			} else p1.props[RoactModule.Children] or {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 5)
				}),
				Icon = Icon and RoactModule.createElement(ImageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(0, GetIconSizeModule(IconSizeModule.Medium), 0, GetIconSizeModule(IconSizeModule.Medium)),
					Image = Icon,
					ImageColor3 = ContentStyleModule2.Color,
					ImageTransparency = ContentStyleModule2.Transparency
				}) or nil,
				Text = Text and RoactModule.createElement(GenericTextLabelModule, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.X,
					TextTruncate = Enum.TextTruncate.AtEnd,
					Text = Text,
					fontStyle = FontStyle,
					colorStyle = ContentStyleModule1
				}) or nil
			})
		})
	end)
end

return SegmentedControlTabName