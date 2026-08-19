local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local otterModule = require(parent.Otter)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local controlStateModule = require(foundation.Enums.ControlState)
local inputSizeModule = require(foundation.Enums.InputSize)
local scrimModule = require(script.Parent.Scrim)
local scrollViewModule = require(foundation.Components.ScrollView)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local visibilityModule = require(foundation.Enums.Visibility)
local useClippingRectModule = require(script.Parent.useClippingRect)
local usePreferredInputModule = require(foundation.Utility.usePreferredInput)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	scrimBottomInset = 0,
	testId = "--foundation-overflow-scroll-container",
	size = inputSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 47 | named "OverflowScrollContainer" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), usePreferredInputModule (ref), useClippingRectModule (ref), reactOtterModule (ref), otterModule (ref), controlStateModule (ref), viewModule (ref), withCommonPropsModule (ref), scrollViewModule (ref), stateLayerAffordanceModule (ref), visibilityModule (ref), scrimModule (ref)
	local var17 = withDefaultsModule(p0, t)
	local var18 = useTokensModule()
	local var19, var20 = reactModule.useState(false)
	local var21, var22 = reactModule.useState(false)
	local var23, var24 = reactModule.useState(false)
	local var25, var26 = reactModule.useState(false)
	local var27, var28 = reactModule.useState(false)
	local forceHovered = var17.forceHovered or (var23 or (var25 or var27))
	local forcePreferredInput = var17.forcePreferredInput or usePreferredInputModule()
	local var31 = reactModule.useRef(nil)
	local var32 = useClippingRectModule(var31)
	local var33, var34 = reactModule.useBinding(0)
	local var35 = reactOtterModule.useMotor(0, function(p2) --[[ line: 66 ]]
		-- upvalues: var31 (ref)
		local current = var31.current
		
		if current then
			current.CanvasPosition = Vector2.new(p2, 0)
			
			return
		end
	end)
	local var36 = reactModule.useCallback(function(p3) --[[ line: 74 ]]
		-- upvalues: var34 (ref), var22 (ref), var20 (ref)
		var34(p3.AbsoluteWindowSize.Y)
		
		if p3.AbsoluteWindowSize.X == 0 then
			return
		end
		var22(p3.CanvasPosition.X > 0)
		var20(p3.AbsoluteWindowSize.X + p3.CanvasPosition.X < p3.AbsoluteCanvasSize.X - 1)
	end, {})
	local var37 = reactModule.useCallback(function(p4) --[[ line: 88 ]]
		-- upvalues: var31 (ref), var35 (ref), otterModule (copy), var18 (ref)
		local current = var31.current
		
		if not current then return end
		local maxValue = math.max(current.AbsoluteCanvasSize.X - current.AbsoluteWindowSize.X, 0)
		local var44 = current.AbsoluteWindowSize.X * 0.2
		local var45 = current.CanvasPosition.X + p4 * (current.AbsoluteWindowSize.X * 0.8)
		
		if p4 > 0 and maxValue - var45 <= var44 then
			var45 = maxValue
		elseif p4 < 0 and var45 <= var44 then
			var45 = 0
		end
		var35(otterModule.ease(math.clamp(var45, 0, maxValue), {
			duration = var18.Time.Time_200,
			easingStyle = Enum.EasingStyle.Quad,
			startingValue = current.CanvasPosition.X
		}))
	end, { var18 })
	local var38 = reactModule.useCallback(function() --[[ line: 113 ]]
		-- upvalues: var37 (ref)
		var37(-1)
	end, { var37 })
	local var39 = reactModule.useCallback(function() --[[ line: 117 ]]
		-- upvalues: var37 (ref)
		var37(1)
	end, { var37 })
	local var40 = reactModule.useCallback(function(p5) --[[ line: 121 ]]
		-- upvalues: var24 (ref), controlStateModule (copy)
		var24(if p5 ~= controlStateModule.Hover then p5 == controlStateModule.Pressed else true)
	end, {})
	local var41 = reactModule.useCallback(function(p6) --[[ line: 125 ]]
		-- upvalues: var26 (ref), controlStateModule (copy)
		var26(if p6 ~= controlStateModule.Hover then p6 == controlStateModule.Pressed else true)
	end, {})
	local var42 = reactModule.useCallback(function(p7) --[[ line: 129 ]]
		-- upvalues: var28 (ref), controlStateModule (copy)
		var28(if p7 ~= controlStateModule.Hover then p7 == controlStateModule.Pressed else true)
	end, {})
	reactModule.useEffect(function() --[[ line: 133 ]]
		-- upvalues: var31 (ref), var36 (ref)
		if var31.current then
			var36(var31.current)
		end
	end, {})
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var17, { tag = "size-full-0 auto-y", ref = p1 }), {
		Scroll = reactModule.createElement(scrollViewModule, {
			tag = "size-full-0 auto-y",
			ClipsDescendants = false,
			onStateChanged = var40,
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			onCanvasPositionChanged = var36,
			onAbsoluteCanvasSizeChanged = var36,
			onAbsoluteWindowSizeChanged = var36,
			scrollingFrameRef = var31,
			selection = { Selectable = false },
			layout = { FillDirection = Enum.FillDirection.Horizontal },
			scroll = {
				AutomaticSize = Enum.AutomaticSize.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				CanvasSize = UDim2.fromScale(0, 1),
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = visibilityModule.None
			},
			testId = `{var17.testId}--scroll`
		}, var17.children),
		ScrimLayer = reactModule.createElement(viewModule, {
			tag = "row flex-between",
			ZIndex = 2,
			Position = var32:map(function(p8) --[[ line: 175 ]]
				return UDim2.fromOffset(p8.Min.X, 0)
			end),
			Size = var32:map(function(p9) --[[ line: 180 ]]
				-- upvalues: var17 (ref)
				return UDim2.new(0, p9.Max.X - p9.Min.X, 1, -var17.scrimBottomInset)
			end),
			testId = `{var17.testId}--scrim-layer`
		}, {
			ScrimStart = reactModule.createElement(scrimModule, {
				LayoutOrder = 1,
				size = var17.size,
				rowHeight = var33,
				alignment = Enum.HorizontalAlignment.Left,
				isHovered = forceHovered,
				preferredInput = forcePreferredInput,
				isVisible = var17.forceScrimsVisible or var21,
				onActivated = var38,
				onStateChanged = var41,
				testId = `{var17.testId}--scrim-start`
			}),
			ScrimEnd = reactModule.createElement(scrimModule, {
				LayoutOrder = 2,
				size = var17.size,
				rowHeight = var33,
				alignment = Enum.HorizontalAlignment.Right,
				isHovered = forceHovered,
				preferredInput = forcePreferredInput,
				isVisible = var17.forceScrimsVisible or var19,
				onActivated = var39,
				onStateChanged = var42,
				testId = `{var17.testId}--scrim-end`
			})
		})
	})
end))