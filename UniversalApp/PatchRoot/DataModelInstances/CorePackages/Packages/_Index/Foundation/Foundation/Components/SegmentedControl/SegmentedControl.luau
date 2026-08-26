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
	local var10 = useAnimatedHighlightModule(var2.value, p2 or var7, var9, if flagsModule.FoundationSegmentedControlBeta then var2.size else nil, if flagsModule.FoundationSegmentedControlBeta then var4 else nil)
	local activeItemHeight = var10.activeItemHeight
	local highlightPosition = var10.highlightPosition
	local highlightWidth = var10.highlightWidth
	local var11, var12 = reactModule.useBinding(Vector2.new(0, 0))
	local var13 = var12
	local var14 = reactModule.useCallback(function(p3)
		-- upvalues: var13 (write)
		var13(p3.AbsoluteSize)
	end, { var6.container.tag })
	local var15 = reactModule.useCallback(function(p3)
		-- upvalues: var9 (write), var11 (ref)
		local var16 = 0
		
		if p3.current then
			local current = var9[var11.value].current
			
			if current then
				var16 = current.AbsolutePosition.Y - p3.current.AbsolutePosition.Y
			end
		end
		return var16
	end, { var11.value })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var11, {
		tag = if flagsModule.FoundationSegmentedControlBeta and var10 then "size-full-0 auto-y" else nil,
		Size = if flagsModule.FoundationSegmentedControlBeta then if not var10 then var11:map(function(p3)
			return UDim2.fromOffset(p3.X, p3.Y)
		end) else nil else var11:map(function(p3)
			return UDim2.fromOffset(p3.X, p3.Y)
		end)
	}), {
		SegmentsContainer = reactModule.createElement(viewModule, withDefaultsModule({
			tag = var15.container.tag,
			stroke = if flagsModule.FoundationSegmentedControlBeta then var15.container.stroke else nil,
			ref = p2 or var7,
			testId = `{var11.testId}--segments-container`
		}, {
			onAbsoluteSizeChanged = reactModule.useCallback(function(p3)
				-- upvalues: var11 (ref), var14 (write)
				if var11.onAbsoluteSizeChanged then
					var11.onAbsoluteSizeChanged(p3)
				end
				var14(p3)
			end, { var11.onAbsoluteSizeChanged, var14 })
		}), dashModule.map(var11.segments, function(p3, p4)
			-- upvalues: reactModule (copy), segmentModule (copy), var11 (ref), flagsModule (copy), var12 (ref), var13 (ref), var9 (write)
			return reactModule.createElement(reactModule.Fragment, { key = tostring(p3.id) }, {
				Segment = reactModule.createElement(segmentModule, {
					id = p3.id,
					size = var11.size,
					variant = if flagsModule.FoundationSegmentedControlBeta then var12 else nil,
					fillBehavior = if flagsModule.FoundationSegmentedControlBeta then var13 else nil,
					isCircular = var11.isCircular,
					text = p3.text,
					icon = p3.icon,
					isActive = p3.id == var11.value,
					onActivated = var11.onActivated,
					LayoutOrder = (p4 - 1) * 2 + 1,
					testId = `{var11.testId}--segment-{p7.id}`,
					ref = var9[p3.id]
				})
			})
		end)),
		Overlay = reactModule.createElement(viewModule, {
			tag = var15.segment.tag,
			backgroundStyle = if flagsModule.FoundationSegmentedControlBeta then var14.Color.Shift.Shift_300 else var14.Color.Shift.Shift_400,
			Size = reactModule.joinBindings({ highlightWidth, activeItemHeight }):map(function(p3)
				return UDim2.fromOffset(p3[1], p3[2])
			end),
			Position = highlightPosition:map(function(p3)
				-- upvalues: var15 (write), p2 (ref), var7 (write)
				return UDim2.fromOffset(p3, var15(p2 or var7))
			end),
			ZIndex = var11.ZIndex + 1,
			testId = `{var11.testId}--animated-overlay`
		})
	})
end))