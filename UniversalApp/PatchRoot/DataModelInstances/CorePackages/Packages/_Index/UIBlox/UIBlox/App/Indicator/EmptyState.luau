local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local cryoModule = require(parent_2.Cryo)
local tModule = require(parent_2.t)
local roactGamepadModule = require(parent_2.RoactGamepad)
local genericTextLabelModule = require(parent_1.Core.Text.GenericTextLabel.GenericTextLabel)
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local validateImageModule = require(parent_1.Core.ImageSet.Validator.validateImage)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local getPageMarginModule = require(parent.Container.getPageMargin)
local iconSizeModule = require(parent.ImageSet.Enum.IconSize)
local getIconSizeModule = require(parent.ImageSet.getIconSize)
local imagesModule = require(parent.ImageSet.Images)
local buttonModule = require(parent.Button.Button)
local buttonTypeModule = require(parent.Button.Enum.ButtonType)
local emptyState = roactModule.PureComponent:extend("EmptyState")
emptyState.validateProps = tModule.strictInterface({
	text = tModule.string,
	icon = tModule.optional(validateImageModule),
	size = tModule.optional(tModule.UDim2),
	position = tModule.optional(tModule.UDim2),
	anchorPoint = tModule.optional(tModule.Vector2),
	buttonIcon = tModule.optional(validateImageModule),
	buttonText = tModule.optional(tModule.string),
	buttonType = tModule.optional(buttonTypeModule.isEnumValue),
	onActivated = tModule.optional(tModule.callback),
	frameRef = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	maxSizeTextLabel = tModule.optional(tModule.Vector2),
	iconColor = tModule.optional(tModule.Color3),
	iconSize = tModule.optional(tModule.UDim2),
	titleProps = tModule.optional(tModule.strictInterface({ titleText = tModule.optional(tModule.string) }))
})
emptyState.defaultProps = {
	icon = imagesModule["icons/status/oof_xlarge"],
	size = UDim2.fromScale(1, 1),
	position = UDim2.fromScale(0.5, 0.5),
	anchorPoint = Vector2.new(0.5, 0.5),
	buttonIcon = imagesModule["icons/common/refresh"],
	buttonType = buttonTypeModule.Secondary,
	iconSize = UDim2.fromOffset(getIconSizeModule(iconSizeModule.XLarge), getIconSizeModule(iconSizeModule.XLarge))
}

local function _(p1)
	return if p1 == "" then nil else p1
end

function emptyState.init(p1)
	-- upvalues: roactModule (ref)
	p1:setState({ absoluteSize = Vector2.new(0, 0) })
	
	function p1.onAbsoluteSizeChange(p2)
		-- upvalues: p1 (ref)
		p1:setState({ absoluteSize = p2.AbsoluteSize })
	end
	
	p1.buttonRef = roactModule.createRef()
end

function emptyState.render(p1)
	-- upvalues: withStyleModule (ref), roactModule (ref), roactGamepadModule (ref), imageSetComponentModule (ref), genericTextLabelModule (ref), getPageMarginModule (ref), buttonModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: roactModule (copy), roactGamepadModule (copy), p1 (ref), imageSetComponentModule (copy), genericTextLabelModule (copy), getPageMarginModule (copy), buttonModule (copy)
		local createElement = roactModule.createElement
		local frame = roactGamepadModule.Focusable.Frame
		local t = {
			[roactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChange,
			Size = p1.props.size,
			Position = p1.props.position,
			AnchorPoint = p1.props.anchorPoint,
			BackgroundTransparency = 1,
			[roactModule.Ref] = p1.props.frameRef,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			NextSelectionULeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			defaultChild = p1.buttonRef
		}
		local t_1 = {}
		local createElement_1 = roactModule.createElement
		local var1 = "Frame"
		local t_2 = {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 187),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}
		local t_3 = {
			UIListLayout = roactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Icon = roactModule.createElement(imageSetComponentModule.Label, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0),
				Size = p1.props.iconSize,
				Image = p1.props.icon,
				ImageColor3 = p1.props.iconColor or p2.Theme.IconEmphasis.Color,
				ImageTransparency = p2.Theme.IconEmphasis.Transparency
			}),
			iconTextPadding = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.fromOffset(0, 12)
			}),
			TitleFrame = if p1.props.titleProps and p1.props.titleProps.titleText then roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 3,
				Size = UDim2.fromScale(1, 0),
				Position = UDim2.fromScale(0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				TitlePadding = roactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 14),
					PaddingBottom = UDim.new(0, 14)
				}),
				TitleText = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = true,
					LayoutOrder = 1,
					Text = p1.props.titleProps.titleText,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					Font = p2.Font.Title.Font,
					TextSize = p2.Font.Header1.RelativeSize * p2.Font.BaseSize,
					TextColor3 = p2.Theme.TextEmphasis.Color,
					TextTransparency = p2.Theme.TextEmphasis.Transparency,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.fromScale(1, 0)
				})
			}) else nil,
			Text = roactModule.createElement(genericTextLabelModule, {
				LayoutOrder = 4,
				Text = p1.props.text,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				fontStyle = p2.Font.Body,
				colorStyle = p2.Theme.TextDefault,
				maxSize = p1.props.maxSizeTextLabel
			}),
			textButtonPadding = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 5,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.fromOffset(0, 24)
			})
		}
		local onActivated = p1.props.onActivated
		
		if onActivated then
			onActivated = roactModule.createElement
			local var2 = "Frame"
			local t_4 = {
				BackgroundTransparency = 1,
				LayoutOrder = 6,
				Size = UDim2.new(1, 0, 0, 48),
				AnchorPoint = Vector2.new(0.5, 0)
			}
			local t_5 = {
				UIPadding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, getPageMarginModule(p1.state.absoluteSize.X)),
					PaddingRight = UDim.new(0, getPageMarginModule(p1.state.absoluteSize.X))
				}),
				UISizeConstraint = roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(640, 48) })
			}
			local createElement_2 = roactModule.createElement
			local var3 = buttonModule
			local t_6 = {
				buttonType = p1.props.buttonType,
				size = UDim2.fromScale(1, 1),
				position = UDim2.fromScale(0.5, 0.5),
				anchorPoint = Vector2.new(0.5, 0.5),
				onActivated = p1.props.onActivated
			}
			local buttonIcon = p1.props.buttonIcon
			t_6.icon = if buttonIcon == "" then nil else buttonIcon
			t_6.text = p1.props.buttonText
			t_6[roactModule.Ref] = p1.buttonRef
			t_5.Button = createElement_2(var3, t_6)
			onActivated = onActivated(var2, t_4, t_5)
		end
		t_3.buttonFrame = onActivated
		t_1.Content = createElement_1(var1, t_2, t_3)
		
		return createElement(frame, t, t_1)
	end)
end

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: roactModule (ref), emptyState (ref), cryoModule (ref)
	return roactModule.createElement(emptyState, cryoModule.Dictionary.join(p1, { frameRef = p2 }))
end)