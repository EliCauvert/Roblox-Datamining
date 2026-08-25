local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local _ = require(foundation.Enums.ControlState)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local inputSizeModule = require(foundation.Enums.InputSize)
local segmentedControlVariantModule = require(foundation.Enums.SegmentedControlVariant)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local useAnimatedHighlightModule = require(foundation.Utility.useAnimatedHighlight)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local segmentModule = require(script.Parent.Segment)
local useSegmentedControlVariantsModule = require(script.Parent.useSegmentedControlVariants)
local flagsModule = require(foundation.Utility.Flags)
local t = {
	testId = "--foundation-segmented-control",
	ZIndex = 1,
	size = inputSizeModule.Medium,
	variant = segmentedControlVariantModule.Filled,
	fillBehavior = fillBehaviorModule.Fit
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), flagsModule (ref), useTokensModule (ref), useSegmentedControlVariantsModule (ref), fillBehaviorModule (ref), reactModule (ref), useAnimatedHighlightModule (ref), viewModule (ref), withCommonPropsModule (ref), dashModule (ref), segmentModule (ref)
	local var20
	local var15 = withDefaultsModule(p0, t)
	local var16 = if flagsModule.FoundationSegmentedControlBeta then var15.variant else nil
	local var17 = if flagsModule.FoundationSegmentedControlBeta then var15.fillBehavior else nil
	local var18 = useTokensModule()
	local var19 = useSegmentedControlVariantsModule(var18, var15.size, if flagsModule.FoundationSegmentedControlBeta then var16 else nil, if flagsModule.FoundationSegmentedControlBeta then var17 else nil, var15.isCircular)
	
	if flagsModule.FoundationSegmentedControlBeta then
		var20 = var17 == fillBehaviorModule.Fill
		var20 = nil
	else
		var20 = nil
	end
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var21 = reactModule.useRef(nil)
	local _ = nil
	local var22 = reactModule.useRef({})
	local var23 = reactModule.useMemo(function()
		-- upvalues: var22 (ref), var15 (ref), reactModule (copy)
		local current = var22.current
		
		for i, v in var15.segments do
			if v.ref then
				current[v.id] = v.ref
			elseif not current[v.id] then
				current[v.id] = reactModule.createRef()
			end
		end
		return current
	end, { var15.segments })
	local var24 = useAnimatedHighlightModule(var15.value, p1 or var21, var23, if flagsModule.FoundationSegmentedControlBeta then var15.size else nil, if flagsModule.FoundationSegmentedControlBeta then var17 else nil)
	local activeItemHeight = var24.activeItemHeight
	local highlightPosition = var24.highlightPosition
	local highlightWidth = var24.highlightWidth
	local var25, var26 = reactModule.useBinding(Vector2.new(0, 0))
	local var27 = var26
	local var28 = reactModule.useCallback(function(p2)
		-- upvalues: var27 (write)
		var27(p2.AbsoluteSize)
	end, { var19.container.tag })
	local var29 = reactModule.useCallback(function(p3)
		-- upvalues: var23 (write), var15 (ref)
		local var30 = 0
		
		if p3.current then
			local current = var23[var15.value].current
			
			if current then
				var30 = current.AbsolutePosition.Y - p3.current.AbsolutePosition.Y
			end
		end
		return var30
	end, { var15.value })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var15, {
		tag = if flagsModule.FoundationSegmentedControlBeta and var20 then "size-full-0 auto-y" else nil,
		Size = if flagsModule.FoundationSegmentedControlBeta then if not var20 then var25:map(function(p5)
			return UDim2.fromOffset(p5.X, p5.Y)
		end) else nil else var25:map(function(p4)
			return UDim2.fromOffset(p4.X, p4.Y)
		end)
	}), {
		SegmentsContainer = reactModule.createElement(viewModule, withDefaultsModule({
			tag = var19.container.tag,
			stroke = if flagsModule.FoundationSegmentedControlBeta then var19.container.stroke else nil,
			ref = p1 or var21,
			testId = `{var15.testId}--segments-container`
		}, {
			onAbsoluteSizeChanged = reactModule.useCallback(function(p6)
				-- upvalues: var15 (ref), var28 (write)
				if var15.onAbsoluteSizeChanged then
					var15.onAbsoluteSizeChanged(p6)
				end
				var28(p6)
			end, { var15.onAbsoluteSizeChanged, var28 })
		}), dashModule.map(var15.segments, function(p7, p8)
			-- upvalues: reactModule (copy), segmentModule (copy), var15 (ref), flagsModule (copy), var16 (ref), var17 (ref), var23 (write)
			return reactModule.createElement(reactModule.Fragment, { key = tostring(p7.id) }, {
				Segment = reactModule.createElement(segmentModule, {
					id = p7.id,
					size = var15.size,
					variant = if flagsModule.FoundationSegmentedControlBeta then var16 else nil,
					fillBehavior = if flagsModule.FoundationSegmentedControlBeta then var17 else nil,
					isCircular = var15.isCircular,
					text = p7.text,
					icon = p7.icon,
					isActive = p7.id == var15.value,
					onActivated = var15.onActivated,
					LayoutOrder = (p8 - 1) * 2 + 1,
					testId = `{var15.testId}--segment-{p7.id}`,
					ref = var23[p7.id]
				})
			})
		end)),
		Overlay = reactModule.createElement(viewModule, {
			tag = var19.segment.tag,
			backgroundStyle = if flagsModule.FoundationSegmentedControlBeta then var18.Color.Shift.Shift_300 else var18.Color.Shift.Shift_400,
			Size = reactModule.joinBindings({ highlightWidth, activeItemHeight }):map(function(p9)
				return UDim2.fromOffset(p9[1], p9[2])
			end),
			Position = highlightPosition:map(function(p10)
				-- upvalues: var29 (write), p1 (ref), var21 (write)
				return UDim2.fromOffset(p10, var29(p1 or var21))
			end),
			ZIndex = var15.ZIndex + 1,
			testId = `{var15.testId}--animated-overlay`
		})
	})
end))