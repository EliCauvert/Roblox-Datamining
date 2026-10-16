local Parent = script.Parent
local Parent1 = Parent.Parent.Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local TooltipContainerModule = require(Parent.TooltipContainer)
local TooltipOrientationModule = require(Parent.Enum.TooltipOrientation)
local Tooltip = RoactModule.PureComponent:extend("Tooltip")
Tooltip.validateProps = TModule.strictInterface({
	triggerPosition = TModule.Vector2,
	triggerSize = TModule.Vector2,
	bodyText = TModule.string,
	headerText = TModule.optional(TModule.string),
	backgroundColor = TModule.optional(TModule.Color3),
	backgroundTransparency = TModule.optional(TModule.number),
	onDismiss = TModule.optional(TModule.callback),
	onClose = TModule.optional(TModule.callback),
	screenSize = TModule.optional(TModule.Vector2),
	position = TModule.optional(TModule.UDim2),
	orientation = TModule.optional(TooltipOrientationModule.isEnumValue),
	triggerOnHover = TModule.optional(TModule.boolean),
	forceClickTriggerPoint = TModule.optional(TModule.boolean),
	isDirectChild = TModule.optional(TModule.boolean),
	minContentWidth = TModule.optional(TModule.number)
})
Tooltip.defaultProps = {
	triggerOnHover = false,
	forceClickTriggerPoint = false,
	isDirectChild = false,
	screenSize = Vector2.new(10000, 10000),
	orientation = TooltipOrientationModule.Bottom
}

function Tooltip.init(p1) --[[ Line: 67 ]]
	function p1.onDismissDefault() --[[ Line: 68 ]]
		-- upvalues: p1 (copy)
		if p1.props.forceClickTriggerPoint or p1.props.triggerOnHover then return end
		if p1.props.onDismiss then
			p1.props.onDismiss()
		end
	end
end

function Tooltip.render(p1) --[[ Line: 78 ]]
	-- upvalues: WithStyleModule (copy), RoactModule (copy), TooltipContainerModule (copy)
	local ForceClickTriggerPoint = p1.props.forceClickTriggerPoint or p1.props.triggerOnHover
	local IsDirectChild = p1.props.isDirectChild
	
	return WithStyleModule(function(p2) --[[ Line: 81 ]]
		-- upvalues: p1 (copy), RoactModule (upval), IsDirectChild (copy), ForceClickTriggerPoint (copy), TooltipContainerModule (upval)
		local Theme = p2.Theme
		local config = {
			Background = not p1.props.forceClickTriggerPoint and RoactModule.createElement("TextButton", {
				ZIndex = 0,
				AutoButtonColor = false,
				BackgroundColor3 = Theme.Overlay.Color,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = IsDirectChild and UDim2.fromOffset(-p1.props.triggerPosition.X, -p1.props.triggerPosition.Y) or UDim2.fromOffset(0, 0),
				Size = UDim2.fromOffset(p1.props.screenSize.X, p1.props.screenSize.Y),
				Text = "",
				[RoactModule.Event.Activated] = p1.onDismissDefault,
				[RoactModule.Event.TouchSwipe] = p1.onDismissDefault,
				[RoactModule.Event.MouseWheelForward] = p1.onDismissDefault,
				[RoactModule.Event.MouseWheelBackward] = p1.onDismissDefault
			}),
			TriggerPointMask = ForceClickTriggerPoint and RoactModule.createElement("TextButton", {
				Text = "",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Selectable = false,
				Size = UDim2.fromOffset(p1.props.triggerSize.X, p1.props.triggerSize.Y),
				Position = IsDirectChild and UDim2.fromOffset(0, 0) or UDim2.fromOffset(p1.props.triggerPosition.X, p1.props.triggerPosition.Y),
				[RoactModule.Event.Activated] = p1.props.onDismiss
			}),
			TooltipContainer = RoactModule.createElement(TooltipContainerModule, {
				triggerPosition = p1.props.triggerPosition,
				triggerSize = p1.props.triggerSize,
				bodyText = p1.props.bodyText,
				headerText = p1.props.headerText,
				screenSize = p1.props.screenSize,
				position = p1.props.position,
				orientation = p1.props.orientation,
				isDirectChild = IsDirectChild
			})
		}
		
		return IsDirectChild and RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1)
		}, config) or RoactModule.createFragment(config)
	end)
end

return Tooltip