local App = script:FindFirstAncestor("App")
local Parent = App.Parent
local Core = Parent.Core
local Parent1 = Parent.Parent
local TModule = require(Parent1.t)
local RoactModule = require(Parent1.Roact)
local CryoModule = require(Parent1.Cryo)
local InteractableModule = require(Core.Control.Interactable)
local ControlStateModule = require(Core.Control.Enum.ControlState)
local GetContentStyleModule = require(Core.Button.getContentStyle)
local GetIconSizeModule = require(App.ImageSet.getIconSize)
local BindingValidatorModule = require(Core.Utility.bindingValidator)
local ValidateColorInfoModule = require(Core.Style.Validator.validateColorInfo)
local WithStyleModule = require(Core.Style.withStyle)
local HoverButtonBackgroundModule = require(Core.Button.HoverButtonBackground)
local ImageSetComponentModule = require(Core.ImageSet.ImageSetComponent)
local IconSizeModule = require(App.ImageSet.Enum.IconSize)
local Focusable = require(Parent1.RoactGamepad).Focusable
local IsCallableModule = require(Parent.Utility.isCallable)
local UseCursorModule = require(Parent.App.SelectionCursor.useCursor)
local _UDim = UDim.new(0, 8)
local IconButton = RoactModule.PureComponent:extend("IconButton")
IconButton.validateProps = TModule.strictInterface({
	onStateChanged = TModule.optional(IsCallableModule),
	isDisabled = TModule.optional(TModule.boolean),
	colorStyleDefault = TModule.optional(TModule.string),
	colorStyleHover = TModule.optional(TModule.string),
	colorDefault = TModule.optional(ValidateColorInfoModule),
	colorHover = TModule.optional(ValidateColorInfoModule),
	userInteractionEnabled = TModule.optional(TModule.boolean),
	onActivated = TModule.optional(IsCallableModule),
	onAbsolutePositionChanged = TModule.optional(IsCallableModule),
	anchorPoint = TModule.optional(TModule.Vector2),
	layoutOrder = TModule.optional(TModule.number),
	position = TModule.optional(TModule.union(TModule.UDim2, TModule.table)),
	size = TModule.optional(TModule.union(TModule.UDim2, TModule.table)),
	icon = TModule.optional((require(Core.ImageSet.Validator.validateImage))),
	iconSize = TModule.optional(IconSizeModule.isEnumValue),
	iconColor3 = TModule.optional(TModule.Color3),
	iconTransparency = TModule.optional(TModule.union(TModule.number, BindingValidatorModule(TModule.number))),
	showBackground = TModule.optional(TModule.boolean),
	backgroundColor = TModule.optional(ValidateColorInfoModule),
	backgroundTransparency = TModule.optional(TModule.union(TModule.number, BindingValidatorModule(TModule.number))),
	cursor = TModule.optional(TModule.table),
	[RoactModule.Children] = TModule.optional(TModule.table),
	debugControlState = TModule.optional(ControlStateModule.isEnumValue),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	inputBindings = TModule.optional(TModule.table),
	buttonRef = TModule.optional(TModule.union(TModule.callback, TModule.table)),
	[RoactModule.Change.AbsoluteSize] = TModule.optional(TModule.callback),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean)
})
IconButton.defaultProps = {
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
	iconSize = IconSizeModule.Medium
}

function IconButton.init(p1) --[[ Line: 133 ]]
	-- upvalues: ControlStateModule (copy), IconSizeModule (copy)
	p1:setState({ controlState = ControlStateModule.Initialize })
	
	function p1.onStateChanged(p2, ControlState) --[[ Line: 138 ]]
		-- upvalues: p1 (copy)
		p1:setState({ controlState = ControlState })
		
		if p1.props.onStateChanged then
			p1.props.onStateChanged(p2, ControlState)
		end
	end
	
	local config = {
		[IconSizeModule.Small] = 1,
		[IconSizeModule.Medium] = 2,
		[IconSizeModule.Large] = 3,
		[IconSizeModule.XLarge] = 4,
		[IconSizeModule.XXLarge] = 5
	}
	
	function p1.getSize(X) --[[ Line: 154 ]]
		-- upvalues: p1 (copy), config (copy)
		if p1.props.size then
			return p1.props.size
		else
			local NewX = X + 4 * config[p1.props.iconSize]
			
			return UDim2.fromOffset(NewX, NewX)
		end
	end
end

function IconButton.render(p1) --[[ Line: 165 ]]
	-- upvalues: WithStyleModule (copy)
	return WithStyleModule(function(p2) --[[ Line: 166 ]]
		-- upvalues: p1 (copy)
		return p1:renderWithProviders(p2, nil, nil)
	end)
end

function IconButton.renderWithProviders(p1, p2, _, _) --[[ Line: 171 ]]
	-- upvalues: GetIconSizeModule (copy), ControlStateModule (copy), GetContentStyleModule (copy), RoactModule (copy), Focusable (copy), InteractableModule (copy), ImageSetComponentModule (copy), HoverButtonBackgroundModule (copy), _UDim (copy)
	local IconSizeModule = GetIconSizeModule(p1.props.iconSize, p2)
	local Size = p1.getSize(IconSizeModule)
	local ShowBackground = p1.props.showBackground
	local DebugControlState = p1.props.debugControlState or p1.state.controlState
	local ContentStyleModule = GetContentStyleModule({
		[ControlStateModule.Default] = p1.props.colorStyleDefault,
		[ControlStateModule.Hover] = p1.props.colorStyleHover
	}, DebugControlState, p2)
	local UIMuted = if p1.props.backgroundColor == nil then p2.Theme.UIMuted else p1.props.backgroundColor
	
	return RoactModule.createElement(if p1.props.isRoactGamepadEnabled then Focusable[InteractableModule] else InteractableModule, {
		AnchorPoint = p1.props.anchorPoint,
		LayoutOrder = p1.props.layoutOrder,
		Position = p1.props.position,
		Size = Size,
		isDisabled = p1.props.isDisabled,
		onStateChanged = p1.onStateChanged,
		userInteractionEnabled = p1.props.userInteractionEnabled,
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		[RoactModule.Change.AbsoluteSize] = p1.props[RoactModule.Change.AbsoluteSize],
		[RoactModule.Change.AbsolutePosition] = p1.props.onAbsolutePositionChanged,
		[RoactModule.Event.Activated] = p1.props.onActivated,
		[RoactModule.Ref] = p1.props.buttonRef,
		NextSelectionLeft = p1.props.NextSelectionLeft,
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionDown = p1.props.NextSelectionDown,
		inputBindings = if p1.props.isRoactGamepadEnabled then p1.props.inputBindings else nil,
		SelectionImageObject = p1.props.cursor
	}, {
		sizeConstraint = RoactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(IconSizeModule, IconSizeModule) }),
		imageLabel = RoactModule.createElement(ImageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(IconSizeModule, IconSizeModule),
			Image = p1.props.icon,
			ImageColor3 = p1.props.iconColor3 or ContentStyleModule.Color,
			ImageTransparency = p1.props.iconTransparency or ContentStyleModule.Transparency
		}, p1.props[RoactModule.Children]),
		hoverBackground = DebugControlState == ControlStateModule.Hover and RoactModule.createElement(HoverButtonBackgroundModule) or nil,
		background = ShowBackground and RoactModule.createElement("Frame", {
			ZIndex = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = UIMuted.Color,
			BackgroundTransparency = p1.props.backgroundTransparency or UIMuted.Transparency
		}, {
			corner = RoactModule.createElement("UICorner", { CornerRadius = _UDim })
		}) or nil
	})
end

local function IconButtonFunctionalWrapper(p1) --[[ Line: 239 ]]
	-- upvalues: UseCursorModule (copy), _UDim (copy), RoactModule (copy), IconButton (copy), CryoModule (copy)
	return RoactModule.createElement(IconButton, CryoModule.Dictionary.join(p1, { cursor = UseCursorModule(_UDim) }))
end

local IconButtonOuterWrapper = RoactModule.PureComponent:extend("IconButtonOuterWrapper")
IconButtonOuterWrapper.validateProps = IconButton.validateProps

function IconButtonOuterWrapper.render(p1) --[[ Line: 253 ]]
	-- upvalues: RoactModule (copy), IconButtonFunctionalWrapper (copy)
	return RoactModule.createElement(IconButtonFunctionalWrapper, p1.props)
end

return IconButtonOuterWrapper