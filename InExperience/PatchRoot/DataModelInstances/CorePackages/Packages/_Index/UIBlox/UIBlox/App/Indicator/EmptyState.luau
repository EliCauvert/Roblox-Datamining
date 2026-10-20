local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local FoundationModule = require(Parent2.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local RoactModule = require(Parent2.Roact)
local CryoModule = require(Parent2.Cryo)
local TModule = require(Parent2.t)
local RoactGamepadModule = require(Parent2.RoactGamepad)
local GenericTextLabelModule = require(Parent1.Core.Text.GenericTextLabel.GenericTextLabel)
local GetFontFromFontStyleModule = require(Parent1.Core.Text.GetFontFromFontStyle)
local ImageSetComponentModule = require(Parent1.Core.ImageSet.ImageSetComponent)
local ValidateImageModule = require(Parent1.Core.ImageSet.Validator.validateImage)
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local GetPageMarginModule = require(Parent.Container.getPageMargin)
local IconSizeModule = require(Parent.ImageSet.Enum.IconSize)
local GetIconSizeModule = require(Parent.ImageSet.getIconSize)
local ImagesModule = require(Parent.ImageSet.Images)
local ButtonModule = require(Parent.Button.Button)
local ButtonTypeModule = require(Parent.Button.Enum.ButtonType)
local EmptyState = RoactModule.PureComponent:extend("EmptyState")
EmptyState.validateProps = TModule.strictInterface({
	text = TModule.string,
	icon = TModule.optional(ValidateImageModule),
	size = TModule.optional(TModule.UDim2),
	position = TModule.optional(TModule.UDim2),
	anchorPoint = TModule.optional(TModule.Vector2),
	buttonIcon = TModule.optional(ValidateImageModule),
	buttonText = TModule.optional(TModule.string),
	buttonType = TModule.optional(ButtonTypeModule.isEnumValue),
	onActivated = TModule.optional(TModule.callback),
	frameRef = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	maxSizeTextLabel = TModule.optional(TModule.Vector2),
	iconColor = TModule.optional(TModule.Color3),
	iconSize = TModule.optional(TModule.UDim2),
	titleProps = TModule.optional(TModule.strictInterface({ titleText = TModule.optional(TModule.string) }))
})
EmptyState.defaultProps = {
	icon = ImagesModule["icons/status/oof_xlarge"],
	size = UDim2.fromScale(1, 1),
	position = UDim2.fromScale(0.5, 0.5),
	anchorPoint = Vector2.new(0.5, 0.5),
	buttonIcon = ImagesModule["icons/common/refresh"],
	buttonType = ButtonTypeModule.Secondary,
	iconSize = UDim2.fromOffset(GetIconSizeModule(IconSizeModule.XLarge), GetIconSizeModule(IconSizeModule.XLarge))
}

local function _(p1)
	return if p1 == "" then nil else p1
end

function EmptyState.init(p1)
	-- upvalues: RoactModule (copy)
	p1:setState({ absoluteSize = Vector2.new(0, 0) })
	
	function p1.onAbsoluteSizeChange(Frame)
		-- upvalues: p1 (copy)
		p1:setState({ absoluteSize = Frame.AbsoluteSize })
	end
	
	p1.buttonRef = RoactModule.createRef()
end

function EmptyState.render(p1)
	-- upvalues: WithStyleModule (copy), RoactModule (copy), RoactGamepadModule (copy), ImageSetComponentModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), GetFontFromFontStyleModule (copy), GenericTextLabelModule (copy), GetPageMarginModule (copy), ButtonModule (copy)
	return WithStyleModule(function(p2)
		-- upvalues: RoactModule (upval), RoactGamepadModule (upval), p1 (copy), ImageSetComponentModule (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), GetFontFromFontStyleModule (upval), GenericTextLabelModule (upval), GetPageMarginModule (upval), ButtonModule (upval)
		local CreateElementFunction1 = RoactModule.createElement
		local Frame = RoactGamepadModule.Focusable.Frame
		local config = {
			[RoactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChange,
			Size = p1.props.size,
			Position = p1.props.position,
			AnchorPoint = p1.props.anchorPoint,
			BackgroundTransparency = 1,
			[RoactModule.Ref] = p1.props.frameRef,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			NextSelectionULeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			defaultChild = p1.buttonRef
		}
		local t = {}
		local CreateElementFunction = RoactModule.createElement
		local v1 = "Frame"
		local config1 = {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 187),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}
		local config2 = {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Icon = RoactModule.createElement(ImageSetComponentModule.Label, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0),
				Size = p1.props.iconSize,
				Image = p1.props.icon,
				ImageColor3 = p1.props.iconColor or p2.Theme.IconEmphasis.Color,
				ImageTransparency = p2.Theme.IconEmphasis.Transparency
			}),
			iconTextPadding = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.fromOffset(0, 12)
			}),
			TitleFrame = if p1.props.titleProps and p1.props.titleProps.titleText then RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 3,
				Size = UDim2.fromScale(1, 0),
				Position = UDim2.fromScale(0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				TitlePadding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 14),
					PaddingBottom = UDim.new(0, 14)
				}),
				TitleText = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = true,
					LayoutOrder = 1,
					Text = p1.props.titleProps.titleText,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					Font = if FoundationFontFaceMigration then nil else p2.Font.Title.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(GetFontFromFontStyleModule(p2.Font.Title)) else nil,
					TextSize = p2.Font.Header1.RelativeSize * p2.Font.BaseSize,
					TextColor3 = p2.Theme.TextEmphasis.Color,
					TextTransparency = p2.Theme.TextEmphasis.Transparency,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.fromScale(1, 0)
				})
			}) else nil,
			Text = RoactModule.createElement(GenericTextLabelModule, {
				LayoutOrder = 4,
				Text = p1.props.text,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				fontStyle = p2.Font.Body,
				colorStyle = p2.Theme.TextDefault,
				maxSize = p1.props.maxSizeTextLabel
			}),
			textButtonPadding = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 5,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.fromOffset(0, 24)
			})
		}
		local OnActivated = p1.props.onActivated
		
		if OnActivated then
			local ButtonIcon = p1.props.buttonIcon
			OnActivated = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 6,
				Size = UDim2.new(1, 0, 0, 48),
				AnchorPoint = Vector2.new(0.5, 0)
			}, {
				UIPadding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, GetPageMarginModule(p1.state.absoluteSize.X)),
					PaddingRight = UDim.new(0, GetPageMarginModule(p1.state.absoluteSize.X))
				}),
				UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(640, 48) }),
				Button = RoactModule.createElement(ButtonModule, {
					buttonType = p1.props.buttonType,
					size = UDim2.fromScale(1, 1),
					position = UDim2.fromScale(0.5, 0.5),
					anchorPoint = Vector2.new(0.5, 0.5),
					onActivated = p1.props.onActivated,
					icon = if ButtonIcon == "" then nil else ButtonIcon,
					text = p1.props.buttonText,
					[RoactModule.Ref] = p1.buttonRef
				})
			})
		end
		config2.buttonFrame = OnActivated
		t.Content = CreateElementFunction(v1, config1, config2)
		
		return CreateElementFunction1(Frame, config, t)
	end)
end

return RoactModule.forwardRef(function(p1, FrameRef)
	-- upvalues: RoactModule (copy), EmptyState (copy), CryoModule (copy)
	return RoactModule.createElement(EmptyState, CryoModule.Dictionary.join(p1, { frameRef = FrameRef }))
end)