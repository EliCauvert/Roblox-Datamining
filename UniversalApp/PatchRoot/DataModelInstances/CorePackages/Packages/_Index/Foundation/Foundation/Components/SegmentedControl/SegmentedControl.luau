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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), flagsModule (ref), useTokensModule (ref), useSegmentedControlVariantsModule (ref), fillBehaviorModule (ref), reactModule (ref), useAnimatedHighlightModule (ref), viewModule (ref), withCommonPropsModule (ref), dashModule (ref), segmentModule (ref)
	local var1
	local var2 = withDefaultsModule(p1, t)
	local var3 = if flagsModule.FoundationSegmentedControlBeta then var2.variant else nil
	local var4 = if flagsModule.FoundationSegmentedControlBeta then var2.fillBehavior else nil
	local var5 = useTokensModule()
	local var6 = useSegmentedControlVariantsModule(var5, var2.size, if flagsModule.FoundationSegmentedControlBeta then var3 else nil, if flagsModule.FoundationSegmentedControlBeta then var4 else nil, var2.isCircular)
	
	if flagsModule.FoundationSegmentedControlBeta then
		var1 = var4 == fillBehaviorModule.Fill
		var1 = nil
	else
		var1 = nil
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
	local var7 = reactModule.useRef(nil)
	local _ = nil
	local var8 = reactModule.useRef({})
	local var9 = reactModule.useMemo(function()
		-- upvalues: var8 (ref), var2 (ref), reactModule (copy)
		local current = var8.current
		
		for i, v in var2.segments do
			if v.ref then
				current[v.id] = v.ref
			elseif not current[v.id] then
				current[v.id] = reactModule.createRef()
			end
		end
		return current
	end, { var2.segments })
	local var1 = useAnimatedHighlightModule(var2.value, p2 or var7, var9, if flagsModule.FoundationSegmentedControlBeta then var2.size else nil, if flagsModule.FoundationSegmentedControlBeta then var4 else nil)
	local activeItemHeight = var1.activeItemHeight
	local highlightPosition = var1.highlightPosition
	local highlightWidth = var1.highlightWidth
	local var2, var3 = reactModule.useBinding(Vector2.new(0, 0))
	local var4 = var3
	local var5 = reactModule.useCallback(function(p1)
		-- upvalues: var4 (write)
		var4(p1.AbsoluteSize)
	end, { var6.container.tag })
	local var6 = reactModule.useCallback(function(p1)
		-- upvalues: var9 (write), var2 (ref)
		local var1 = 0
		
		if p1.current then
			local current = var9[var2.value].current
			
			if current then
				var1 = current.AbsolutePosition.Y - p1.current.AbsolutePosition.Y
			end
		end
		return var1
	end, { var2.value })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var2, {
		tag = if flagsModule.FoundationSegmentedControlBeta and var1 then "size-full-0 auto-y" else nil,
		Size = if flagsModule.FoundationSegmentedControlBeta then if not var1 then var2:map(function(p1)
			return UDim2.fromOffset(p1.X, p1.Y)
		end) else nil else var2:map(function(p1)
			return UDim2.fromOffset(p1.X, p1.Y)
		end)
	}), {
		SegmentsContainer = reactModule.createElement(viewModule, withDefaultsModule({
			tag = var6.container.tag,
			stroke = if flagsModule.FoundationSegmentedControlBeta then var6.container.stroke else nil,
			ref = p2 or var7,
			testId = `{var2.testId}--segments-container`
		}, {
			onAbsoluteSizeChanged = reactModule.useCallback(function(p1)
				-- upvalues: var2 (ref), var5 (write)
				if var2.onAbsoluteSizeChanged then
					var2.onAbsoluteSizeChanged(p1)
				end
				var5(p1)
			end, { var2.onAbsoluteSizeChanged, var5 })
		}), dashModule.map(var2.segments, function(p1, p2)
			-- upvalues: reactModule (copy), segmentModule (copy), var2 (ref), flagsModule (copy), var3 (ref), var4 (ref), var9 (write)
			return reactModule.createElement(reactModule.Fragment, { key = tostring(p1.id) }, {
				Segment = reactModule.createElement(segmentModule, {
					id = p1.id,
					size = var2.size,
					variant = if flagsModule.FoundationSegmentedControlBeta then var3 else nil,
					fillBehavior = if flagsModule.FoundationSegmentedControlBeta then var4 else nil,
					isCircular = var2.isCircular,
					text = p1.text,
					icon = p1.icon,
					isActive = p1.id == var2.value,
					onActivated = var2.onActivated,
					LayoutOrder = (p2 - 1) * 2 + 1,
					testId = `{var2.testId}--segment-{p7.id}`,
					ref = var9[p1.id]
				})
			})
		end)),
		Overlay = reactModule.createElement(viewModule, {
			tag = var6.segment.tag,
			backgroundStyle = if flagsModule.FoundationSegmentedControlBeta then var5.Color.Shift.Shift_300 else var5.Color.Shift.Shift_400,
			Size = reactModule.joinBindings({ highlightWidth, activeItemHeight }):map(function(p1)
				return UDim2.fromOffset(p1[1], p1[2])
			end),
			Position = highlightPosition:map(function(p1)
				-- upvalues: var6 (write), p2 (ref), var7 (write)
				return UDim2.fromOffset(p1, var6(p2 or var7))
			end),
			ZIndex = var2.ZIndex + 1,
			testId = `{var2.testId}--animated-overlay`
		})
	})
end))