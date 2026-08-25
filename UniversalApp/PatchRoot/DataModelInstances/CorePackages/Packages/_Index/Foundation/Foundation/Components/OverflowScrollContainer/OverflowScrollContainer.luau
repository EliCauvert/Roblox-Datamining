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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), usePreferredInputModule (ref), useClippingRectModule (ref), reactOtterModule (ref), otterModule (ref), controlStateModule (ref), viewModule (ref), withCommonPropsModule (ref), scrollViewModule (ref), stateLayerAffordanceModule (ref), visibilityModule (ref), scrimModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3, var4 = reactModule.useState(false)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9, var10 = reactModule.useState(false)
	local var11, var12 = reactModule.useState(false)
	local forceHovered = var1.forceHovered or (var7 or (var9 or var11))
	local forcePreferredInput = var1.forcePreferredInput or usePreferredInputModule()
	local var13 = reactModule.useRef(nil)
	local var14 = useClippingRectModule(var13)
	local var15, var16 = reactModule.useBinding(0)
	local var17 = reactOtterModule.useMotor(0, function(p1)
		-- upvalues: var13 (ref)
		local current = var13.current
		
		if current then
			current.CanvasPosition = Vector2.new(p1, 0)
			
			return
		end
	end)
	local var18 = reactModule.useCallback(function(p1)
		-- upvalues: var16 (ref), var6 (ref), var4 (ref)
		var16(p1.AbsoluteWindowSize.Y)
		
		if p1.AbsoluteWindowSize.X == 0 then
			return
		end
		var6(p1.CanvasPosition.X > 0)
		var4(p1.AbsoluteWindowSize.X + p1.CanvasPosition.X < p1.AbsoluteCanvasSize.X - 1)
	end, {})
	local var19 = reactModule.useCallback(function(p1)
		-- upvalues: var13 (ref), var17 (ref), otterModule (copy), var2 (ref)
		local current = var13.current
		
		if not current then return end
		local maxValue = math.max(current.AbsoluteCanvasSize.X - current.AbsoluteWindowSize.X, 0)
		local var1 = current.AbsoluteWindowSize.X * 0.2
		local var2 = current.CanvasPosition.X + p1 * (current.AbsoluteWindowSize.X * 0.8)
		
		if p1 > 0 and maxValue - var2 <= var1 then
			var2 = maxValue
		elseif p1 < 0 and var2 <= var1 then
			var2 = 0
		end
		var17(otterModule.ease(math.clamp(var2, 0, maxValue), {
			duration = var2.Time.Time_200,
			easingStyle = Enum.EasingStyle.Quad,
			startingValue = current.CanvasPosition.X
		}))
	end, { var2 })
	local var20 = reactModule.useCallback(function()
		-- upvalues: var19 (ref)
		var19(-1)
	end, { var19 })
	local var21 = reactModule.useCallback(function()
		-- upvalues: var19 (ref)
		var19(1)
	end, { var19 })
	local var22 = reactModule.useCallback(function(p1)
		-- upvalues: var8 (ref), controlStateModule (copy)
		var8(if p1 ~= controlStateModule.Hover then p1 == controlStateModule.Pressed else true)
	end, {})
	local var1 = reactModule.useCallback(function(p1)
		-- upvalues: var10 (ref), controlStateModule (copy)
		var10(if p1 ~= controlStateModule.Hover then p1 == controlStateModule.Pressed else true)
	end, {})
	local var1 = reactModule.useCallback(function(p1)
		-- upvalues: var12 (ref), controlStateModule (copy)
		var12(if p1 ~= controlStateModule.Hover then p1 == controlStateModule.Pressed else true)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var18 (ref)
		if var13.current then
			var18(var13.current)
		end
	end, {})
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, { tag = "size-full-0 auto-y", ref = p2 }), {
		Scroll = reactModule.createElement(scrollViewModule, {
			tag = "size-full-0 auto-y",
			ClipsDescendants = false,
			onStateChanged = var22,
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			onCanvasPositionChanged = var18,
			onAbsoluteCanvasSizeChanged = var18,
			onAbsoluteWindowSizeChanged = var18,
			scrollingFrameRef = var13,
			selection = { Selectable = false },
			layout = { FillDirection = Enum.FillDirection.Horizontal },
			scroll = {
				AutomaticSize = Enum.AutomaticSize.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				CanvasSize = UDim2.fromScale(0, 1),
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = visibilityModule.None
			},
			testId = `{var1.testId}--scroll`
		}, var1.children),
		ScrimLayer = reactModule.createElement(viewModule, {
			tag = "row flex-between",
			ZIndex = 2,
			Position = var14:map(function(p1)
				return UDim2.fromOffset(p1.Min.X, 0)
			end),
			Size = var14:map(function(p1)
				-- upvalues: var1 (ref)
				return UDim2.new(0, p1.Max.X - p1.Min.X, 1, -var1.scrimBottomInset)
			end),
			testId = `{var1.testId}--scrim-layer`
		}, {
			ScrimStart = reactModule.createElement(scrimModule, {
				LayoutOrder = 1,
				size = var1.size,
				rowHeight = var15,
				alignment = Enum.HorizontalAlignment.Left,
				isHovered = forceHovered,
				preferredInput = forcePreferredInput,
				isVisible = var1.forceScrimsVisible or var5,
				onActivated = var20,
				onStateChanged = var1,
				testId = `{var1.testId}--scrim-start`
			}),
			ScrimEnd = reactModule.createElement(scrimModule, {
				LayoutOrder = 2,
				size = var1.size,
				rowHeight = var15,
				alignment = Enum.HorizontalAlignment.Right,
				isHovered = forceHovered,
				preferredInput = forcePreferredInput,
				isVisible = var1.forceScrimsVisible or var3,
				onActivated = var21,
				onStateChanged = var1,
				testId = `{var1.testId}--scrim-end`
			})
		})
	})
end))