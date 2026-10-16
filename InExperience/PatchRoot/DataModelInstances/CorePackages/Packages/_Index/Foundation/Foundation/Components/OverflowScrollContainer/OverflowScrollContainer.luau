local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local OtterModule = require(Parent.Otter)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local ControlStateModule = require(Foundation.Enums.ControlState)
local FlagsModule = require(Foundation.Utility.Flags)
local ScrimModule = require(script.Parent.Scrim)
local ScrollViewModule = require(Foundation.Components.ScrollView)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local VisibilityModule = require(Foundation.Enums.Visibility)
local UseClippingRectModule = require(script.Parent.useClippingRect)
local UsePreferredInputModule = require(Foundation.Utility.usePreferredInput)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	scrimBottomInset = 0,
	testId = "--foundation-overflow-scroll-container",
	size = require(Foundation.Enums.InputSize).Medium
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 48 | Named "OverflowScrollContainer" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), UsePreferredInputModule (copy), UseClippingRectModule (copy), ReactOtterModule (copy), OtterModule (copy), ControlStateModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ScrollViewModule (copy), FlagsModule (copy), StateLayerAffordanceModule (copy), VisibilityModule (copy), ScrimModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	local ForceHovered = WithDefaultsModuleResult.forceHovered or (UseStateResult3 or (UseStateResult4 or UseStateResult5))
	local UsePreferredInputModuleResult = UsePreferredInputModule()
	local ForcePreferredInput = WithDefaultsModuleResult.forcePreferredInput or UsePreferredInputModuleResult
	local UseRefResult = ReactModule.useRef(nil)
	local UseClippingRectModuleResult, UseClippingRectModuleResult2 = UseClippingRectModule(UseRefResult)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseMotorResult = ReactOtterModule.useMotor(0, function(X) --[[ Line: 67 ]]
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current then
			Current.CanvasPosition = Vector2.new(X, 0)
			
			return
		end
	end)
	local UseResult = ReactModule.useCallback(function(ScrollFrame) --[[ Line: 75 ]]
		-- upvalues: UseBindingResult2 (copy), UseStateResult2_1 (copy), UseStateResult2 (copy)
		UseBindingResult2(ScrollFrame.AbsoluteWindowSize.Y)
		
		if ScrollFrame.AbsoluteWindowSize.X ~= 0 then
			UseStateResult2_1(ScrollFrame.CanvasPosition.X > 0)
			UseStateResult2(ScrollFrame.AbsoluteWindowSize.X + ScrollFrame.CanvasPosition.X < ScrollFrame.AbsoluteCanvasSize.X - 1)
			
			return
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p2: number) --[[ Line: 89 ]]
		-- upvalues: UseRefResult (copy), UseMotorResult (copy), OtterModule (upval), UseTokensModuleResult (copy)
		local Current = UseRefResult.current
		
		if not Current then return end
		local Largest = math.max(Current.AbsoluteCanvasSize.X - Current.AbsoluteWindowSize.X, 0)
		local ScaledX = Current.AbsoluteWindowSize.X * 0.19999999999999996
		local NewX = Current.CanvasPosition.X + p2 * (Current.AbsoluteWindowSize.X * 0.8)
		
		if p2 > 0 and Largest - NewX <= ScaledX then
			NewX = Largest
		elseif p2 < 0 and NewX <= ScaledX then
			NewX = 0
		end
		UseMotorResult(OtterModule.ease(math.clamp(NewX, 0, Largest), {
			duration = UseTokensModuleResult.Time.Time_200,
			easingStyle = Enum.EasingStyle.Quad,
			startingValue = Current.CanvasPosition.X
		}))
	end, { UseTokensModuleResult })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 114 ]]
		-- upvalues: UseResult1 (copy)
		UseResult1(-1)
	end, { UseResult1 })
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 118 ]]
		-- upvalues: UseResult1 (copy)
		UseResult1(1)
	end, { UseResult1 })
	local UseResult4 = ReactModule.useCallback(function(Hover) --[[ Line: 122 ]]
		-- upvalues: UseStateResult2_2 (copy), ControlStateModule (upval)
		UseStateResult2_2(Hover == ControlStateModule.Hover or Hover == ControlStateModule.Pressed)
	end, {})
	local UseResult5 = ReactModule.useCallback(function(Hover) --[[ Line: 126 ]]
		-- upvalues: UseStateResult2_3 (copy), ControlStateModule (upval)
		UseStateResult2_3(Hover == ControlStateModule.Hover or Hover == ControlStateModule.Pressed)
	end, {})
	local UseResult6 = ReactModule.useCallback(function(Hover) --[[ Line: 130 ]]
		-- upvalues: UseStateResult2_4 (copy), ControlStateModule (upval)
		UseStateResult2_4(Hover == ControlStateModule.Hover or Hover == ControlStateModule.Pressed)
	end, {})
	ReactModule.useEffect(function() --[[ Line: 134 ]]
		-- upvalues: UseRefResult (copy), UseResult (copy)
		if UseRefResult.current then
			UseResult(UseRefResult.current)
		end
	end, {})
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, { tag = "size-full-0 auto-y", ref = Ref }), {
		Scroll = ReactModule.createElement(ScrollViewModule, {
			tag = "size-full-0 auto-y",
			ClipsDescendants = if FlagsModule.FoundationUnifiedScrimScrolling then not UseClippingRectModuleResult2 else false,
			onStateChanged = UseResult4,
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			onCanvasPositionChanged = UseResult,
			onAbsoluteCanvasSizeChanged = UseResult,
			onAbsoluteWindowSizeChanged = UseResult,
			scrollingFrameRef = UseRefResult,
			selection = { Selectable = false },
			layout = { FillDirection = Enum.FillDirection.Horizontal },
			scroll = {
				AutomaticSize = Enum.AutomaticSize.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				CanvasSize = UDim2.fromScale(0, 1),
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = VisibilityModule.None
			},
			testId = `{WithDefaultsModuleResult.testId}--scroll`
		}, WithDefaultsModuleResult.children),
		ScrimLayer = ReactModule.createElement(ViewModule, {
			tag = "row flex-between",
			ZIndex = 2,
			Position = UseClippingRectModuleResult:map(function(p2): UDim2 --[[ Line: 176 ]]
				return UDim2.fromOffset(p2.Min.X, 0)
			end),
			Size = UseClippingRectModuleResult:map(function(p2): UDim2 --[[ Line: 181 ]]
				-- upvalues: WithDefaultsModuleResult (copy)
				return UDim2.new(0, p2.Max.X - p2.Min.X, 1, -WithDefaultsModuleResult.scrimBottomInset)
			end),
			testId = `{WithDefaultsModuleResult.testId}--scrim-layer`
		}, {
			ScrimStart = ReactModule.createElement(ScrimModule, {
				LayoutOrder = 1,
				size = WithDefaultsModuleResult.size,
				rowHeight = UseBindingResult,
				alignment = Enum.HorizontalAlignment.Left,
				isHovered = ForceHovered,
				preferredInput = ForcePreferredInput,
				isVisible = WithDefaultsModuleResult.forceScrimsVisible or UseStateResult1,
				onActivated = UseResult2,
				onStateChanged = UseResult5,
				testId = `{WithDefaultsModuleResult.testId}--scrim-start`
			}),
			ScrimEnd = ReactModule.createElement(ScrimModule, {
				LayoutOrder = 2,
				size = WithDefaultsModuleResult.size,
				rowHeight = UseBindingResult,
				alignment = Enum.HorizontalAlignment.Right,
				isHovered = ForceHovered,
				preferredInput = ForcePreferredInput,
				isVisible = WithDefaultsModuleResult.forceScrimsVisible or UseStateResult,
				onActivated = UseResult3,
				onStateChanged = UseResult6,
				testId = `{WithDefaultsModuleResult.testId}--scrim-end`
			})
		})
	})
end))