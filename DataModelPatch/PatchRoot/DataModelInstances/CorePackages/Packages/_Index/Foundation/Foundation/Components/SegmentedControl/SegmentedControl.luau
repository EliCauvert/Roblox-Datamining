local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local _ = require(Foundation.Enums.ControlState)
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
	size = require(Foundation.Enums.InputSize).Medium
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseSegmentedControlVariantsModule (copy), FlagsModule (copy), ReactModule (copy), UseAnimatedHighlightModule (copy), ViewModule (copy), WithCommonPropsModule (copy), DashModule (copy), SegmentModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseSegmentedControlVariantsModuleResult = UseSegmentedControlVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, if FlagsModule.FoundationSegmentedControlCircular then WithDefaultsModuleResult.isCircular else nil)
	local UseRefResult = nil
	local UseBindingResult2 = nil
	local UseResult = nil
	local UseResult1 = nil
	UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = nil
	
	if FlagsModule.FoundationFixStaleAnimatedHighlightRefs then
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
	else
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: WithDefaultsModuleResult (copy), ReactModule (upval)
			local Refs = {}
			
			for _, segment in WithDefaultsModuleResult.segments do
				Refs[segment.id] = segment.ref or ReactModule.createRef()
			end
			return Refs
		end, { WithDefaultsModuleResult.segments })
	end
	local UseAnimatedHighlightModuleResult = UseAnimatedHighlightModule(WithDefaultsModuleResult.value, p2 or UseRefResult, UseMemoResult)
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
		Size = UseBindingResult:map(function(Vector): UDim2
			return UDim2.fromOffset(Vector.X, Vector.Y)
		end)
	}), {
		SegmentsContainer = ReactModule.createElement(ViewModule, WithDefaultsModule({
			tag = UseSegmentedControlVariantsModuleResult.container.tag,
			ref = p2 or UseRefResult
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
			-- upvalues: ReactModule (upval), SegmentModule (upval), WithDefaultsModuleResult (copy), FlagsModule (upval), UseMemoResult (ref)
			return ReactModule.createElement(ReactModule.Fragment, { key = tostring(p3.id) }, {
				Segment = ReactModule.createElement(SegmentModule, {
					id = p3.id,
					size = WithDefaultsModuleResult.size,
					isCircular = if FlagsModule.FoundationSegmentedControlCircular then WithDefaultsModuleResult.isCircular else nil,
					text = p3.text,
					icon = p3.icon,
					isActive = p3.id == WithDefaultsModuleResult.value,
					onActivated = WithDefaultsModuleResult.onActivated,
					LayoutOrder = (p4 - 1) * 2 + 1,
					testId = `{WithDefaultsModuleResult.testId}--segment-{p6.id}`,
					ref = UseMemoResult[p3.id]
				})
			})
		end)),
		Overlay = ReactModule.createElement(ViewModule, {
			testId = "--foundation-segmented-control--animated-overlay",
			backgroundStyle = UseTokensModuleResult.Color.Shift.Shift_400,
			tag = UseSegmentedControlVariantsModuleResult.segment.tag,
			Size = ReactModule.joinBindings({ HighlightWidth, ActiveItemHeight }):map(function(Entry): UDim2
				return UDim2.fromOffset(Entry[1], Entry[2])
			end),
			Position = HighlightPosition:map(function(XOffset): UDim2
				-- upvalues: UseResult1 (ref), p2 (copy), UseRefResult (ref)
				return UDim2.fromOffset(XOffset, (UseResult1(p2 or UseRefResult)))
			end),
			ZIndex = WithDefaultsModuleResult.ZIndex + 1
		})
	})
end))