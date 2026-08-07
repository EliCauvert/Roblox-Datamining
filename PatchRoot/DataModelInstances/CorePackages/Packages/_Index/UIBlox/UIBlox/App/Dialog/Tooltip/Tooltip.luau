-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:54 2026 Pacific Standard Time.

local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local tooltipContainerModule = require(parent.TooltipContainer)
local tooltipOrientationModule = require(parent.Enum.TooltipOrientation)
local tooltip = roactModule.PureComponent:extend("Tooltip")
tooltip.validateProps = tModule.strictInterface({
	triggerPosition = tModule.Vector2,
	triggerSize = tModule.Vector2,
	bodyText = tModule.string,
	headerText = tModule.optional(tModule.string),
	backgroundColor = tModule.optional(tModule.Color3),
	backgroundTransparency = tModule.optional(tModule.number),
	onDismiss = tModule.optional(tModule.callback),
	onClose = tModule.optional(tModule.callback),
	screenSize = tModule.optional(tModule.Vector2),
	position = tModule.optional(tModule.UDim2),
	orientation = tModule.optional(tooltipOrientationModule.isEnumValue),
	triggerOnHover = tModule.optional(tModule.boolean),
	forceClickTriggerPoint = tModule.optional(tModule.boolean),
	isDirectChild = tModule.optional(tModule.boolean),
	minContentWidth = tModule.optional(tModule.number)
})
tooltip.defaultProps = {
	triggerOnHover = false,
	forceClickTriggerPoint = false,
	isDirectChild = false,
	screenSize = Vector2.new(10000, 10000),
	orientation = tooltipOrientationModule.Bottom
}

function tooltip.init(p0) --[[ line: 67 ]]
	function p0.onDismissDefault() --[[ line: 68 ]]
		-- upvalues: p0 (ref)
		if p0.props.forceClickTriggerPoint or p0.props.triggerOnHover then return end
		if p0.props.onDismiss then
			p0.props.onDismiss()
		end
	end
end

function tooltip.render(p1) --[[ line: 78 ]]
	-- upvalues: withStyleModule (ref), roactModule (ref), tooltipContainerModule (ref)
	local forceClickTriggerPoint = p1.props.forceClickTriggerPoint or p1.props.triggerOnHover
	local isDirectChild = p1.props.isDirectChild
	
	return withStyleModule(function(p2) --[[ line: 81 ]]
		-- upvalues: p1 (ref), roactModule (copy), isDirectChild (ref), forceClickTriggerPoint (ref), tooltipContainerModule (copy)
		local t = {
			Background = not p1.props.forceClickTriggerPoint and roactModule.createElement("TextButton", {
				ZIndex = 0,
				AutoButtonColor = false,
				BackgroundColor3 = p2.Theme.Overlay.Color,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = isDirectChild and UDim2.fromOffset(-p1.props.triggerPosition.X, -p1.props.triggerPosition.Y) or UDim2.fromOffset(0, 0),
				Size = UDim2.fromOffset(p1.props.screenSize.X, p1.props.screenSize.Y),
				Text = "",
				[roactModule.Event.Activated] = p1.onDismissDefault,
				[roactModule.Event.TouchSwipe] = p1.onDismissDefault,
				[roactModule.Event.MouseWheelForward] = p1.onDismissDefault,
				[roactModule.Event.MouseWheelBackward] = p1.onDismissDefault
			}),
			TriggerPointMask = forceClickTriggerPoint and roactModule.createElement("TextButton", {
				Text = "",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Selectable = false,
				Size = UDim2.fromOffset(p1.props.triggerSize.X, p1.props.triggerSize.Y),
				Position = isDirectChild and UDim2.fromOffset(0, 0) or UDim2.fromOffset(p1.props.triggerPosition.X, p1.props.triggerPosition.Y),
				[roactModule.Event.Activated] = p1.props.onDismiss
			}),
			TooltipContainer = roactModule.createElement(tooltipContainerModule, {
				triggerPosition = p1.props.triggerPosition,
				triggerSize = p1.props.triggerSize,
				bodyText = p1.props.bodyText,
				headerText = p1.props.headerText,
				screenSize = p1.props.screenSize,
				position = p1.props.position,
				orientation = p1.props.orientation,
				isDirectChild = isDirectChild
			})
		}
		
		return isDirectChild and roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1)
		}, t) or roactModule.createFragment(t)
	end)
end

return tooltip