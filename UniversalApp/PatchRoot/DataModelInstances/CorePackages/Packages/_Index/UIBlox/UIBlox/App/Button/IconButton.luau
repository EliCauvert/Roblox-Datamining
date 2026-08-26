local app = script:FindFirstAncestor("App")
local parent = app.Parent
local core = parent.Core
local parent_1 = parent.Parent
local tModule = require(parent_1.t)
local roactModule = require(parent_1.Roact)
local cryoModule = require(parent_1.Cryo)
local interactableModule = require(core.Control.Interactable)
local controlStateModule = require(core.Control.Enum.ControlState)
local getContentStyleModule = require(core.Button.getContentStyle)
local getIconSizeModule = require(app.ImageSet.getIconSize)
local bindingValidatorModule = require(core.Utility.bindingValidator)
local validateImageModule = require(core.ImageSet.Validator.validateImage)
local validateColorInfoModule = require(core.Style.Validator.validateColorInfo)
local withStyleModule = require(core.Style.withStyle)
local hoverButtonBackgroundModule = require(core.Button.HoverButtonBackground)
local imageSetComponentModule = require(core.ImageSet.ImageSetComponent)
local iconSizeModule = require(app.ImageSet.Enum.IconSize)
local focusable = require(parent_1.RoactGamepad).Focusable
local isCallableModule = require(parent.Utility.isCallable)
local useCursorModule = require(parent.App.SelectionCursor.useCursor)
local uDim = UDim.new(0, 8)
local iconButton = roactModule.PureComponent:extend("IconButton")
iconButton.validateProps = tModule.strictInterface({
	onStateChanged = tModule.optional(isCallableModule),
	isDisabled = tModule.optional(tModule.boolean),
	colorStyleDefault = tModule.optional(tModule.string),
	colorStyleHover = tModule.optional(tModule.string),
	colorDefault = tModule.optional(validateColorInfoModule),
	colorHover = tModule.optional(validateColorInfoModule),
	userInteractionEnabled = tModule.optional(tModule.boolean),
	onActivated = tModule.optional(isCallableModule),
	onAbsolutePositionChanged = tModule.optional(isCallableModule),
	anchorPoint = tModule.optional(tModule.Vector2),
	layoutOrder = tModule.optional(tModule.number),
	position = tModule.optional(tModule.union(tModule.UDim2, tModule.table)),
	size = tModule.optional(tModule.union(tModule.UDim2, tModule.table)),
	icon = tModule.optional(validateImageModule),
	iconSize = tModule.optional(iconSizeModule.isEnumValue),
	iconColor3 = tModule.optional(tModule.Color3),
	iconTransparency = tModule.optional(tModule.union(tModule.number, bindingValidatorModule(tModule.number))),
	showBackground = tModule.optional(tModule.boolean),
	backgroundColor = tModule.optional(validateColorInfoModule),
	backgroundTransparency = tModule.optional(tModule.union(tModule.number, bindingValidatorModule(tModule.number))),
	cursor = tModule.optional(tModule.table),
	[roactModule.Children] = tModule.optional(tModule.table),
	debugControlState = tModule.optional(controlStateModule.isEnumValue),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	inputBindings = tModule.optional(tModule.table),
	buttonRef = tModule.optional(tModule.union(tModule.callback, tModule.table)),
	[roactModule.Change.AbsoluteSize] = tModule.optional(tModule.callback),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean)
})
iconButton.defaultProps = {
	layoutOrder = 0,
	size = nil,
	icon = "",
	colorStyleDefault = "IconEmphasis",
	colorStyleHover = "IconEmphasis",
	iconColor3 = nil,
	iconTransparency = nil,
	showBackground = false,
	backgroundColor = nil,
	backgroundTransparency = nil,
	isDisabled = false,
	userInteractionEnabled = true,
	debugControlState = nil,
	isRoactGamepadEnabled = true,
	anchorPoint = Vector2.new(0, 0),
	position = UDim2.new(0, 0, 0, 0),
	iconSize = iconSizeModule.Medium
}

function iconButton.init(p1)
	-- upvalues: controlStateModule (ref), iconSizeModule (ref)
	p1:setState({ controlState = controlStateModule.Initialize })
	
	function p0.onStateChanged(p2, p3)
		-- upvalues: p1 (ref)
		p1:setState({ controlState = p3 })
		
		if p1.props.onStateChanged then
			p1.props.onStateChanged(p2, p3)
		end
	end
	
	local t = {
		[iconSizeModule.Small] = 1,
		[iconSizeModule.Medium] = 2,
		[iconSizeModule.Large] = 3,
		[iconSizeModule.XLarge] = 4,
		[iconSizeModule.XXLarge] = 5
	}
	
	function p0.getSize(p2)
		-- upvalues: p1 (ref), t (ref)
		if p1.props.size then
			return p1.props.size
		end
		local var1 = p2 + 4 * t[p1.props.iconSize]
		
		return UDim2.fromOffset(var1, var1)
	end
end

function iconButton.render(p1)
	-- upvalues: withStyleModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithProviders(p2, nil, nil)
	end)
end

function iconButton.renderWithProviders(p1, p2, _, _)
	-- upvalues: getIconSizeModule (ref), controlStateModule (ref), getContentStyleModule (ref), roactModule (ref), focusable (ref), interactableModule (ref), imageSetComponentModule (ref), hoverButtonBackgroundModule (ref), uDim (ref)
	local var1 = getIconSizeModule(p1.props.iconSize, p2)
	local size = p1.getSize(var1)
	local showBackground = p1.props.showBackground
	local debugControlState = p1.props.debugControlState or p1.state.controlState
	local var2 = getContentStyleModule({
		[controlStateModule.Default] = p1.props.colorStyleDefault,
		[controlStateModule.Hover] = p1.props.colorStyleHover
	}, debugControlState, p2)
	local var3 = if p1.props.backgroundColor == nil then p2.Theme.UIMuted else p1.props.backgroundColor
	
	return roactModule.createElement(if p1.props.isRoactGamepadEnabled then focusable[interactableModule] else interactableModule, {
		AnchorPoint = p1.props.anchorPoint,
		LayoutOrder = p1.props.layoutOrder,
		Position = p1.props.position,
		Size = size,
		isDisabled = p1.props.isDisabled,
		onStateChanged = p1.onStateChanged,
		userInteractionEnabled = p1.props.userInteractionEnabled,
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		[roactModule.Change.AbsoluteSize] = p1.props[roactModule.Change.AbsoluteSize],
		[roactModule.Change.AbsolutePosition] = p1.props.onAbsolutePositionChanged,
		[roactModule.Event.Activated] = p1.props.onActivated,
		[roactModule.Ref] = p1.props.buttonRef,
		NextSelectionLeft = p1.props.NextSelectionLeft,
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionDown = p1.props.NextSelectionDown,
		inputBindings = if p1.props.isRoactGamepadEnabled then p1.props.inputBindings else nil,
		SelectionImageObject = p1.props.cursor
	}, {
		sizeConstraint = roactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(var1, var1) }),
		imageLabel = roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(var1, var1),
			Image = p1.props.icon,
			ImageColor3 = p1.props.iconColor3 or var2.Color,
			ImageTransparency = p1.props.iconTransparency or var2.Transparency
		}, p1.props[roactModule.Children]),
		hoverBackground = debugControlState == controlStateModule.Hover and roactModule.createElement(hoverButtonBackgroundModule) or nil,
		background = showBackground and (roactModule.createElement("Frame", {
			ZIndex = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = var3.Color,
			BackgroundTransparency = p1.props.backgroundTransparency or var3.Transparency
		}, {
			corner = roactModule.createElement("UICorner", { CornerRadius = uDim })
		}) or nil)
	})
end

local function IconButtonFunctionalWrapper(p1)
	-- upvalues: useCursorModule (ref), uDim (ref), roactModule (ref), iconButton (ref), cryoModule (ref)
	return roactModule.createElement(iconButton, cryoModule.Dictionary.join(p1, { cursor = useCursorModule(uDim) }))
end

local iconButtonOuterWrapper = roactModule.PureComponent:extend("IconButtonOuterWrapper")
iconButtonOuterWrapper.validateProps = iconButton.validateProps

function iconButtonOuterWrapper.render(p1)
	-- upvalues: roactModule (ref), IconButtonFunctionalWrapper (ref)
	return roactModule.createElement(IconButtonFunctionalWrapper, p1.props)
end

return iconButtonOuterWrapper