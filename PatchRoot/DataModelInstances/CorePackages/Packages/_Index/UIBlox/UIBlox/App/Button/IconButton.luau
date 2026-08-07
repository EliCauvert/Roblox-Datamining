-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:51 2026 Pacific Standard Time.

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

function iconButton.init(p0) --[[ line: 133 ]]
	-- upvalues: controlStateModule (ref), iconSizeModule (ref)
	p0:setState({ controlState = controlStateModule.Initialize })
	
	function p0.onStateChanged(p1, p2) --[[ line: 138 ]]
		-- upvalues: p0 (ref)
		p0:setState({ controlState = p2 })
		
		if p0.props.onStateChanged then
			p0.props.onStateChanged(p1, p2)
		end
	end
	
	local t = {
		[iconSizeModule.Small] = 1,
		[iconSizeModule.Medium] = 2,
		[iconSizeModule.Large] = 3,
		[iconSizeModule.XLarge] = 4,
		[iconSizeModule.XXLarge] = 5
	}
	
	function p0.getSize(p3) --[[ line: 154 ]]
		-- upvalues: p0 (ref), t (ref)
		if p0.props.size then
			return p0.props.size
		end
		local var22 = p3 + 4 * t[p0.props.iconSize]
		
		return UDim2.fromOffset(var22, var22)
	end
end

function iconButton.render(p4) --[[ line: 165 ]]
	-- upvalues: withStyleModule (ref)
	return withStyleModule(function(p5) --[[ line: 166 ]]
		-- upvalues: p4 (ref)
		return p4:renderWithProviders(p5, nil, nil)
	end)
end

function iconButton.renderWithProviders(p6, p7, _, _) --[[ line: 171 ]]
	-- upvalues: getIconSizeModule (ref), controlStateModule (ref), getContentStyleModule (ref), roactModule (ref), focusable (ref), interactableModule (ref), imageSetComponentModule (ref), hoverButtonBackgroundModule (ref), uDim (ref)
	local var23 = getIconSizeModule(p6.props.iconSize, p7)
	local size = p6.getSize(var23)
	local showBackground = p6.props.showBackground
	local debugControlState = p6.props.debugControlState or p6.state.controlState
	local var26 = getContentStyleModule({
		[controlStateModule.Default] = p6.props.colorStyleDefault,
		[controlStateModule.Hover] = p6.props.colorStyleHover
	}, debugControlState, p7)
	local var27 = if p6.props.backgroundColor == nil then p7.Theme.UIMuted else p6.props.backgroundColor
	
	return roactModule.createElement(if p6.props.isRoactGamepadEnabled then focusable[interactableModule] else interactableModule, {
		AnchorPoint = p6.props.anchorPoint,
		LayoutOrder = p6.props.layoutOrder,
		Position = p6.props.position,
		Size = size,
		isDisabled = p6.props.isDisabled,
		onStateChanged = p6.onStateChanged,
		userInteractionEnabled = p6.props.userInteractionEnabled,
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		[roactModule.Change.AbsoluteSize] = p6.props[roactModule.Change.AbsoluteSize],
		[roactModule.Change.AbsolutePosition] = p6.props.onAbsolutePositionChanged,
		[roactModule.Event.Activated] = p6.props.onActivated,
		[roactModule.Ref] = p6.props.buttonRef,
		NextSelectionLeft = p6.props.NextSelectionLeft,
		NextSelectionRight = p6.props.NextSelectionRight,
		NextSelectionUp = p6.props.NextSelectionUp,
		NextSelectionDown = p6.props.NextSelectionDown,
		inputBindings = if p6.props.isRoactGamepadEnabled then p6.props.inputBindings else nil,
		SelectionImageObject = p6.props.cursor
	}, {
		sizeConstraint = roactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(var23, var23) }),
		imageLabel = roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(var23, var23),
			Image = p6.props.icon,
			ImageColor3 = p6.props.iconColor3 or var26.Color,
			ImageTransparency = p6.props.iconTransparency or var26.Transparency
		}, p6.props[roactModule.Children]),
		hoverBackground = debugControlState == controlStateModule.Hover and roactModule.createElement(hoverButtonBackgroundModule) or nil,
		background = showBackground and (roactModule.createElement("Frame", {
			ZIndex = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = var27.Color,
			BackgroundTransparency = p6.props.backgroundTransparency or var27.Transparency
		}, {
			corner = roactModule.createElement("UICorner", { CornerRadius = uDim })
		}) or nil)
	})
end

local function IconButtonFunctionalWrapper(p8) --[[ line: 239 ]]
	-- upvalues: useCursorModule (ref), uDim (ref), roactModule (ref), iconButton (ref), cryoModule (ref)
	return roactModule.createElement(iconButton, cryoModule.Dictionary.join(p8, { cursor = useCursorModule(uDim) }))
end

local iconButtonOuterWrapper = roactModule.PureComponent:extend("IconButtonOuterWrapper")
iconButtonOuterWrapper.validateProps = iconButton.validateProps

function iconButtonOuterWrapper.render(p9) --[[ line: 253 ]]
	-- upvalues: roactModule (ref), IconButtonFunctionalWrapper (ref)
	return roactModule.createElement(IconButtonFunctionalWrapper, p9.props)
end

return iconButtonOuterWrapper