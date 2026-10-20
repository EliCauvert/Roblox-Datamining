local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local _ = require(Foundation.Enums.ControlState)
local FillBehaviorModule = require(Foundation.Enums.FillBehavior)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local UseAnimatedHighlightModule = require(Foundation.Utility.useAnimatedHighlight)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local SegmentModule = require(script.Parent.Segment)
local UseSegmentedControlVariantsModule = require(script.Parent.useSegmentedControlVariants)
local FlagsModule = require(Foundation.Utility.Flags)
local config = {
	testId = "--foundation-segmented-control",
	ZIndex = 1,
	size = require(Foundation.Enums.InputSize).Medium,
	variant = require(Foundation.Enums.SegmentedControlVariant).Filled,
	fillBehavior = FillBehaviorModule.Fit
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), FlagsModule (copy), UseTokensModule (copy), UseSegmentedControlVariantsModule (copy), FillBehaviorModule (copy), ReactModule (copy), UseAnimatedHighlightModule (copy), ViewModule (copy), WithCommonPropsModule (copy), DashModule (copy), SegmentModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local Variant = if FlagsModule.FoundationSegmentedControlBeta then WithDefaultsModuleResult.variant else nil
	local FillBehavior = if FlagsModule.FoundationSegmentedControlBeta then WithDefaultsModuleResult.fillBehavior else nil
	local UseTokensModuleResult = UseTokensModule()
	local UseSegmentedControlVariantsModuleResult = UseSegmentedControlVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, if FlagsModule.FoundationSegmentedControlBeta then Variant else nil, if FlagsModule.FoundationSegmentedControlBeta then FillBehavior else nil, WithDefaultsModuleResult.isCircular)
	local IsFillBehaviorMatch = if FlagsModule.FoundationSegmentedControlBeta then FillBehavior == FillBehaviorModule.Fill else nil
	local UseRefResult = nil
	local UseBindingResult2 = nil
	local UseResult = nil
	local UseResult1 = nil
	UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = nil
	local UseRefResult1 = ReactModule.useRef({})
	UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseRefResult1 (copy), WithDefaultsModuleResult (copy), ReactModule (upval)
		local Current = UseRefResult1.current
		
		for _, segment in WithDefaultsModuleResult.segments do
			if segment.ref then
				Current[segment.id] = segment.ref
			elseif not Current[segment.id] then
				Current[segment.id] = ReactModule.createRef()
			end
		end
		return Current
	end, { WithDefaultsModuleResult.segments })
	local UseAnimatedHighlightModuleResult = UseAnimatedHighlightModule(WithDefaultsModuleResult.value, p2 or UseRefResult, UseMemoResult, if FlagsModule.FoundationSegmentedControlBeta then WithDefaultsModuleResult.size else nil, if FlagsModule.FoundationSegmentedControlBeta then FillBehavior else nil)
	local ActiveItemHeight = UseAnimatedHighlightModuleResult.activeItemHeight
	local HighlightPosition = UseAnimatedHighlightModuleResult.highlightPosition
	local HighlightWidth = UseAnimatedHighlightModuleResult.highlightWidth
	local UseBindingResult
	UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new(0, 0))
	UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (ref)
		UseBindingResult2(Frame.AbsoluteSize)
	end, { UseSegmentedControlVariantsModuleResult.container.tag })
	UseResult1 = ReactModule.useCallback(function(p3): number
		-- upvalues: UseMemoResult (ref), WithDefaultsModuleResult (copy)
		local YDelta = 0
		
		if p3.current then
			local Current = UseMemoResult[WithDefaultsModuleResult.value].current
			
			if Current then
				YDelta = Current.AbsolutePosition.Y - p3.current.AbsolutePosition.Y
			end
		end
		return YDelta
	end, { WithDefaultsModuleResult.value })
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = if FlagsModule.FoundationSegmentedControlBeta and IsFillBehaviorMatch then "size-full-0 auto-y" else nil,
		Size = if FlagsModule.FoundationSegmentedControlBeta then if IsFillBehaviorMatch then nil else UseBindingResult:map(function(Vector): UDim2
			return UDim2.fromOffset(Vector.X, Vector.Y)
		end) else UseBindingResult:map(function(Vector): UDim2
			return UDim2.fromOffset(Vector.X, Vector.Y)
		end)
	}), {
		SegmentsContainer = ReactModule.createElement(ViewModule, WithDefaultsModule({
			tag = UseSegmentedControlVariantsModuleResult.container.tag,
			stroke = if FlagsModule.FoundationSegmentedControlBeta then UseSegmentedControlVariantsModuleResult.container.stroke else nil,
			ref = p2 or UseRefResult,
			testId = `{WithDefaultsModuleResult.testId}--segments-container`
		}, {
			onAbsoluteSizeChanged = ReactModule.useCallback(function(p3)
				-- upvalues: WithDefaultsModuleResult (copy), UseResult (ref)
				if WithDefaultsModuleResult.onAbsoluteSizeChanged then
					WithDefaultsModuleResult.onAbsoluteSizeChanged(p3)
				end
				UseResult(p3)
			end, {
				WithDefaultsModuleResult.onAbsoluteSizeChanged,
				UseResult
			})
		}), DashModule.map(WithDefaultsModuleResult.segments, function(p3, p4: number)
			-- upvalues: ReactModule (upval), SegmentModule (upval), WithDefaultsModuleResult (copy), FlagsModule (upval), Variant (copy), FillBehavior (copy), UseMemoResult (ref)
			return ReactModule.createElement(ReactModule.Fragment, { key = tostring(p3.id) }, {
				Segment = ReactModule.createElement(SegmentModule, {
					id = p3.id,
					size = WithDefaultsModuleResult.size,
					variant = if FlagsModule.FoundationSegmentedControlBeta then Variant else nil,
					fillBehavior = if FlagsModule.FoundationSegmentedControlBeta then FillBehavior else nil,
					isCircular = WithDefaultsModuleResult.isCircular,
					text = p3.text,
					icon = p3.icon,
					isActive = p3.id == WithDefaultsModuleResult.value,
					onActivated = WithDefaultsModuleResult.onActivated,
					LayoutOrder = (p4 - 1) * 2 + 1,
					testId = `{WithDefaultsModuleResult.testId}--segment-{p7.id}`,
					ref = UseMemoResult[p3.id]
				})
			})
		end)),
		Overlay = ReactModule.createElement(ViewModule, {
			tag = UseSegmentedControlVariantsModuleResult.segment.tag,
			backgroundStyle = if FlagsModule.FoundationSegmentedControlBeta then UseTokensModuleResult.Color.Shift.Shift_300 else UseTokensModuleResult.Color.Shift.Shift_400,
			Size = ReactModule.joinBindings({ HighlightWidth, ActiveItemHeight }):map(function(Entry): UDim2
				return UDim2.fromOffset(Entry[1], Entry[2])
			end),
			Position = HighlightPosition:map(function(XOffset): UDim2
				-- upvalues: UseResult1 (ref), p2 (copy), UseRefResult (ref)
				return UDim2.fromOffset(XOffset, (UseResult1(p2 or UseRefResult)))
			end),
			ZIndex = WithDefaultsModuleResult.ZIndex + 1,
			testId = `{WithDefaultsModuleResult.testId}--animated-overlay`
		})
	})
end))