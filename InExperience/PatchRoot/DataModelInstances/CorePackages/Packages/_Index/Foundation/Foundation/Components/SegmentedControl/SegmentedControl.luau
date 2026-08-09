local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local _ = require(foundation.Enums.ControlState)
local inputSizeModule = require(foundation.Enums.InputSize)
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
	size = inputSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 44 | named "SegmentedControl" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useSegmentedControlVariantsModule (ref), flagsModule (ref), reactModule (ref), useAnimatedHighlightModule (ref), viewModule (ref), withCommonPropsModule (ref), dashModule (ref), segmentModule (ref)
	local var17
	local var13 = withDefaultsModule(p0, t)
	local var14 = useTokensModule()
	local var15 = useSegmentedControlVariantsModule(var14, var13.size, if flagsModule.FoundationSegmentedControlCircular then var13.isCircular else nil)
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
	local var16 = reactModule.useRef(nil)
	local _ = nil
	
	if flagsModule.FoundationFixStaleAnimatedHighlightRefs then
		local var18 = reactModule.useRef({})
		var17 = reactModule.useMemo(function() --[[ line: 67 ]]
			-- upvalues: var18 (ref), var13 (ref), reactModule (copy)
			local current = var18.current
			
			for i, v in var13.segments do
				if v.ref then
					current[v.id] = v.ref
				elseif not current[v.id] then
					current[v.id] = reactModule.createRef()
				end
			end
			return current
		end, { var13.segments })
	else
		var17 = reactModule.useMemo(function() --[[ line: 79 ]]
			-- upvalues: var13 (ref), reactModule (copy)
			local t = {}
			
			for i, v in var13.segments do
				t[v.id] = v.ref or reactModule.createRef()
			end
			return t
		end, { var13.segments })
	end
	local var19 = useAnimatedHighlightModule(var13.value, p1 or var16, var17)
	local activeItemHeight = var19.activeItemHeight
	local highlightPosition = var19.highlightPosition
	local highlightWidth = var19.highlightWidth
	local var20, var21 = reactModule.useBinding(Vector2.new(0, 0))
	local var22 = var21
	local var23 = reactModule.useCallback(function(p2) --[[ line: 93 ]]
		-- upvalues: var22 (write)
		var22(p2.AbsoluteSize)
	end, { var15.container.tag })
	local var24 = reactModule.useCallback(function(p3) --[[ line: 104 ]]
		-- upvalues: var17 (write), var13 (ref)
		local var26 = 0
		
		if p3.current then
			local current = var17[var13.value].current
			
			if current then
				var26 = current.AbsolutePosition.Y - p3.current.AbsolutePosition.Y
			end
		end
		return var26
	end, { var13.value })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var13, {
		Size = var20:map(function(p4) --[[ line: 120 ]]
			return UDim2.fromOffset(p4.X, p4.Y)
		end)
	}), {
		SegmentsContainer = reactModule.createElement(viewModule, withDefaultsModule({ tag = var15.container.tag, ref = p1 or var16 }, {
			onAbsoluteSizeChanged = reactModule.useCallback(function(p5) --[[ line: 97 ]]
				-- upvalues: var13 (ref), var23 (write)
				if var13.onAbsoluteSizeChanged then
					var13.onAbsoluteSizeChanged(p5)
				end
				var23(p5)
			end, { var13.onAbsoluteSizeChanged, var23 })
		}), dashModule.map(var13.segments, function(p6, p7) --[[ line: 133 ]]
			-- upvalues: reactModule (copy), segmentModule (copy), var13 (ref), flagsModule (copy), var17 (write)
			return reactModule.createElement(reactModule.Fragment, { key = tostring(p6.id) }, {
				Segment = reactModule.createElement(segmentModule, {
					id = p6.id,
					size = var13.size,
					isCircular = if flagsModule.FoundationSegmentedControlCircular then var13.isCircular else nil,
					text = p6.text,
					icon = p6.icon,
					isActive = p6.id == var13.value,
					onActivated = var13.onActivated,
					LayoutOrder = (p7 - 1) * 2 + 1,
					testId = `{var13.testId}--segment-{p6.id}`,
					ref = var17[p6.id]
				})
			})
		end)),
		Overlay = reactModule.createElement(viewModule, {
			testId = "--foundation-segmented-control--animated-overlay",
			backgroundStyle = var14.Color.Shift.Shift_400,
			tag = var15.segment.tag,
			Size = reactModule.joinBindings({ highlightWidth, activeItemHeight }):map(function(p8) --[[ line: 156 ]]
				return UDim2.fromOffset(p8[1], p8[2])
			end),
			Position = highlightPosition:map(function(p9) --[[ line: 159 ]]
				-- upvalues: var24 (write), p1 (ref), var16 (write)
				return UDim2.fromOffset(p9, var24(p1 or var16))
			end),
			ZIndex = var13.ZIndex + 1
		})
	})
end))