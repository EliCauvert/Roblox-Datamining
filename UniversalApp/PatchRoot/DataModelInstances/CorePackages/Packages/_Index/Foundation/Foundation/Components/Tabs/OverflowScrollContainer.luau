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

local function OverflowButton(p1)
	-- upvalues: reactModule (ref), viewModule (ref), withCommonPropsModule (ref), iconButtonModule (ref), inputSizeModule (ref)
	return reactModule.createElement(viewModule, withCommonPropsModule(p1, {
		tag = `col align-y-center size-0-full auto-x bg-surface-0 {p1.tag}`
	}), {
		UIGradient = reactModule.createElement("UIGradient", { Transparency = p1.gradient }),
		Button = reactModule.createElement(iconButtonModule, {
			onActivated = p1.onActivated,
			size = if p1.size == inputSizeModule.Large or p1.size == inputSizeModule.Medium then inputSizeModule.Small else inputSizeModule.XSmall,
			icon = { name = p1.icon }
		})
	})
end

return function(p1)
	-- upvalues: reactModule (ref), reactOtterModule (ref), dashModule (ref), otterModule (ref), viewModule (ref), withCommonPropsModule (ref), scrollViewModule (ref), visibilityModule (ref), OverflowButton (ref), numberSequence (ref), numberSequence_1 (ref)
	local var1, var2 = reactModule.useBinding(false)
	local var3, var4 = reactModule.useBinding(false)
	local var5 = reactModule.useRef(nil)
	local var6 = reactOtterModule.useMotor(0, function(p1)
		-- upvalues: var5 (ref)
		local current = var5.current
		
		if current then
			current.CanvasPosition = Vector2.new(p1, 0)
			
			return
		end
	end)
	local var7 = reactModule.useCallback(dashModule.throttle(function(p1)
		-- upvalues: var2 (ref), var4 (ref)
		if p1.AbsoluteWindowSize.X == 0 then
			return
		end
		var2(p1.AbsoluteWindowSize.X + p1.CanvasPosition.X < p1.AbsoluteCanvasSize.X - 1)
		var4(p1.CanvasPosition.X ~= 0)
	end, 0.2), {})
	local var8 = reactModule.useCallback(function(p1)
		-- upvalues: var5 (ref), var6 (ref), otterModule (copy)
		local current = var5.current
		
		if current then
			var6(otterModule.ease(current.CanvasPosition.X + p1, { duration = 0.2, easingStyle = Enum.EasingStyle.Quad }))
			
			return
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var7 (ref)
		if var5.current then
			var7(var5.current)
		end
	end, {})
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p1, { tag = "auto-y", Size = UDim2.fromScale(1, 0) }), {
		Scroll = reactModule.createElement(scrollViewModule, {
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 1),
			onCanvasPositionChanged = var7,
			onAbsoluteWindowSizeChanged = var7,
			scrollingFrameRef = var5,
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
			Visible = var3,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var8 (ref)
				var8(-90)
			end, { var8 }),
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
			Visible = var1,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var8 (ref)
				var8(90)
			end, { var8 }),
			gradient = numberSequence_1,
			testId = `{p1.testId}--overflow-end`
		})
	})
end