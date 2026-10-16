local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local CryoModule = require(Parent2.Cryo)
local TModule = require(Parent2.t)
local GenericTextLabelModule = require(Parent.Text.GenericTextLabel.GenericTextLabel)
local InteractableModule = require(Parent.Control.Interactable)
local ValidateColorInfoModule = require(Parent1.Core.Style.Validator.validateColorInfo)
local ValidateFontInfoModule = require(Parent1.Core.Style.Validator.validateFontInfo)
local GenericCell = RoactModule.PureComponent:extend("GenericCell")
GenericCell.validateProps = TModule.strictInterface({
	onActivated = TModule.optional(TModule.callback),
	isSelected = TModule.optional(TModule.boolean),
	isDisabled = TModule.optional(TModule.boolean),
	onStateChanged = TModule.callback,
	titleText = TModule.optional(TModule.string),
	subtitleText = TModule.optional(TModule.string),
	renderRightContent = TModule.optional(TModule.callback),
	rightContentWidth = TModule.optional(TModule.number),
	renderLeftContent = TModule.optional(TModule.callback),
	leftContentWidth = TModule.optional(TModule.number),
	colorStyle = ValidateColorInfoModule,
	textStyle = TModule.optional(ValidateColorInfoModule),
	fontStyle = TModule.optional(ValidateFontInfoModule),
	subtitleTextStyle = TModule.optional(ValidateColorInfoModule),
	subtitleFontStyle = TModule.optional(ValidateFontInfoModule),
	dividerStyle = TModule.table,
	controlRef = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	SelectionImageObject = TModule.optional(TModule.table)
})
GenericCell.defaultProps = {
	rightContentWidth = 0,
	leftContentWidth = 0,
	isDisabled = false
}

function GenericCell.render(p1) --[[ Line: 84 ]]
	-- upvalues: RoactModule (copy), InteractableModule (copy), GenericTextLabelModule (copy)
	assert(p1.validateProps(p1.props))
	
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		Interactable = RoactModule.createElement(InteractableModule, {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = p1.props.colorStyle.Color,
			BackgroundTransparency = p1.props.colorStyle.Transparency,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			[RoactModule.Event.Activated] = not p1.props.isDisabled and p1.props.onActivated,
			[RoactModule.Ref] = p1.props.controlRef,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			SelectionImageObject = p1.props.SelectionImageObject,
			isDisabled = p1.props.isDisabled,
			onStateChanged = p1.props.onStateChanged
		}, {
			Contents = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				UIPadding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24),
					PaddingTop = UDim.new(0, 12),
					PaddingBottom = UDim.new(0, 12)
				}),
				UIListLayout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				Frame = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, -p1.props.rightContentWidth - p1.props.leftContentWidth, 1, 0)
				}, {
					UIListLayout = RoactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					TitleText = p1.props.titleText and RoactModule.createElement(GenericTextLabelModule, {
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 1, 0),
						colorStyle = p1.props.textStyle,
						fontStyle = p1.props.fontStyle,
						Text = p1.props.titleText,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					SubTitleText = p1.props.subtitleText and RoactModule.createElement(GenericTextLabelModule, {
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 1, 0),
						colorStyle = p1.props.subtitleTextStyle,
						fontStyle = p1.props.subtitleFontStyle,
						Text = p1.props.subtitleText,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				}),
				RightContent = p1.props.renderRightContent and p1.props.renderRightContent(),
				LeftContent = p1.props.renderLeftContent and p1.props.renderLeftContent()
			}),
			Divider = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, -24, 0, 1),
				Position = UDim2.new(0, 24, 1, -1),
				BackgroundColor3 = p1.props.dividerStyle.Color,
				BackgroundTransparency = p1.props.dividerStyle.Transparency
			})
		})
	})
end

return RoactModule.forwardRef(function(p1, ControlRef) --[[ Line: 165 ]]
	-- upvalues: RoactModule (copy), GenericCell (copy), CryoModule (copy)
	return RoactModule.createElement(GenericCell, CryoModule.Dictionary.join(p1, { controlRef = ControlRef }))
end)