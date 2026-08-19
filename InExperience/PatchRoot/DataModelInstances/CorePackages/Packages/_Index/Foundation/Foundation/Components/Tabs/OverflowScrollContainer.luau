local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local otterModule = require(parent.Otter)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local iconButtonModule = require(foundation.Components.IconButton)
local inputSizeModule = require(foundation.Enums.InputSize)
local scrollViewModule = require(foundation.Components.ScrollView)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local visibilityModule = require(foundation.Enums.Visibility)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local numberSequence = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.8, 0),
	NumberSequenceKeypoint.new(1, 1)
})
local numberSequence_1 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.2, 0),
	NumberSequenceKeypoint.new(1, 0)
})

local function OverflowButton(p0) --[[ line: 33 ]]
	-- upvalues: reactModule (ref), viewModule (ref), withCommonPropsModule (ref), iconButtonModule (ref), inputSizeModule (ref)
	return reactModule.createElement(viewModule, withCommonPropsModule(p0, {
		tag = `col align-y-center size-0-full auto-x bg-surface-0 {p0.tag}`
	}), {
		UIGradient = reactModule.createElement("UIGradient", { Transparency = p0.gradient }),
		Button = reactModule.createElement(iconButtonModule, {
			onActivated = p0.onActivated,
			size = if p0.size == inputSizeModule.Large or p0.size == inputSizeModule.Medium then inputSizeModule.Small else inputSizeModule.XSmall,
			icon = { name = p0.icon }
		})
	})
end

return function(p1) --[[ line: 70 | named "OverflowScrollContainer" ]]
	-- upvalues: reactModule (ref), reactOtterModule (ref), dashModule (ref), otterModule (ref), viewModule (ref), withCommonPropsModule (ref), scrollViewModule (ref), visibilityModule (ref), OverflowButton (ref), numberSequence (ref), numberSequence_1 (ref)
	local var14, var15 = reactModule.useBinding(false)
	local var16, var17 = reactModule.useBinding(false)
	local var18 = reactModule.useRef(nil)
	local var19 = reactOtterModule.useMotor(0, function(p2) --[[ line: 74 ]]
		-- upvalues: var18 (ref)
		local current = var18.current
		
		if current then
			current.CanvasPosition = Vector2.new(p2, 0)
			
			return
		end
	end)
	local var20 = reactModule.useCallback(dashModule.throttle(function(p3) --[[ line: 83 ]]
		-- upvalues: var15 (ref), var17 (ref)
		if p3.AbsoluteWindowSize.X == 0 then
			return
		end
		var15(p3.AbsoluteWindowSize.X + p3.CanvasPosition.X < p3.AbsoluteCanvasSize.X - 1)
		var17(p3.CanvasPosition.X ~= 0)
	end, 0.2), {})
	local var21 = reactModule.useCallback(function(p4) --[[ line: 96 ]]
		-- upvalues: var18 (ref), var19 (ref), otterModule (copy)
		local current = var18.current
		
		if current then
			var19(otterModule.ease(current.CanvasPosition.X + p4, { duration = 0.2, easingStyle = Enum.EasingStyle.Quad }))
			
			return
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 110 ]]
		-- upvalues: var18 (ref), var20 (ref)
		if var18.current then
			var20(var18.current)
		end
	end, {})
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p1, { tag = "auto-y", Size = UDim2.fromScale(1, 0) }), {
		Scroll = reactModule.createElement(scrollViewModule, {
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 1),
			onCanvasPositionChanged = var20,
			onAbsoluteWindowSizeChanged = var20,
			scrollingFrameRef = var18,
			selection = { Selectable = false },
			scroll = {
				AutomaticSize = Enum.AutomaticSize.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = visibilityModule.None
			}
		}, p1.children),
		OverflowStart = reactModule.createElement(OverflowButton, {
			LayoutOrder = 3,
			isStart = true,
			ZIndex = 2,
			tag = "padding-right-small",
			icon = "chevron-large-left",
			Position = UDim2.fromScale(0, 0),
			size = p1.size,
			Visible = var16,
			onActivated = reactModule.useCallback(function() --[[ line: 116 ]]
				-- upvalues: var21 (ref)
				var21(-90)
			end, { var21 }),
			gradient = numberSequence,
			testId = `{p1.testId}--overflow-start`
		}),
		OverflowEnd = reactModule.createElement(OverflowButton, {
			LayoutOrder = 4,
			ZIndex = 2,
			tag = "anchor-top-right padding-left-small",
			icon = "chevron-large-right",
			Position = UDim2.fromScale(1, 0),
			size = p1.size,
			Visible = var14,
			onActivated = reactModule.useCallback(function() --[[ line: 120 ]]
				-- upvalues: var21 (ref)
				var21(90)
			end, { var21 }),
			gradient = numberSequence_1,
			testId = `{p1.testId}--overflow-end`
		})
	})
end