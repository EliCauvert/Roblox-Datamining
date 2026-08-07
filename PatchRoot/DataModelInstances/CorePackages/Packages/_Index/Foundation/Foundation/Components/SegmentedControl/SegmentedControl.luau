-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:07 2026 Pacific Standard Time.

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
local t = {
	testId = "--foundation-segmented-control",
	ZIndex = 1,
	size = inputSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 42 | named "SegmentedControl" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useSegmentedControlVariantsModule (ref), reactModule (ref), useAnimatedHighlightModule (ref), viewModule (ref), withCommonPropsModule (ref), dashModule (ref), segmentModule (ref)
	local var12 = withDefaultsModule(p0, t)
	local var13 = useTokensModule()
	local var14 = useSegmentedControlVariantsModule(var13, var12.size, var12.isCircular)
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
	local var15 = reactModule.useRef(nil)
	local _ = nil
	local var16 = reactModule.useRef({})
	local var17 = reactModule.useMemo(function() --[[ line: 60 ]]
		-- upvalues: var16 (ref), var12 (ref), reactModule (copy)
		local current = var16.current
		
		for i, v in var12.segments do
			if v.ref then
				current[v.id] = v.ref
			elseif not current[v.id] then
				current[v.id] = reactModule.createRef()
			end
		end
		return current
	end, { var12.segments })
	local var18 = useAnimatedHighlightModule(var12.value, p1 or var15, var17)
	local activeItemHeight = var18.activeItemHeight
	local highlightPosition = var18.highlightPosition
	local highlightWidth = var18.highlightWidth
	local var19, var20 = reactModule.useBinding(Vector2.new(0, 0))
	local var21 = var20
	local var22 = reactModule.useCallback(function(p2) --[[ line: 77 ]]
		-- upvalues: var21 (write)
		var21(p2.AbsoluteSize)
	end, { var14.container.tag })
	local var23 = reactModule.useCallback(function(p3) --[[ line: 88 ]]
		-- upvalues: var17 (write), var12 (ref)
		local var24 = 0
		
		if p3.current then
			local current = var17[var12.value].current
			
			if current then
				var24 = current.AbsolutePosition.Y - p3.current.AbsolutePosition.Y
			end
		end
		return var24
	end, { var12.value })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var12, {
		Size = var19:map(function(p4) --[[ line: 104 ]]
			return UDim2.fromOffset(p4.X, p4.Y)
		end)
	}), {
		SegmentsContainer = reactModule.createElement(viewModule, withDefaultsModule({ tag = var14.container.tag, ref = p1 or var15 }, {
			onAbsoluteSizeChanged = reactModule.useCallback(function(p5) --[[ line: 81 ]]
				-- upvalues: var12 (ref), var22 (write)
				if var12.onAbsoluteSizeChanged then
					var12.onAbsoluteSizeChanged(p5)
				end
				var22(p5)
			end, { var12.onAbsoluteSizeChanged, var22 })
		}), dashModule.map(var12.segments, function(p6, p7) --[[ line: 117 ]]
			-- upvalues: reactModule (copy), segmentModule (copy), var12 (ref), var17 (write)
			return reactModule.createElement(reactModule.Fragment, { key = tostring(p6.id) }, {
				Segment = reactModule.createElement(segmentModule, {
					id = p6.id,
					size = var12.size,
					isCircular = var12.isCircular,
					text = p6.text,
					icon = p6.icon,
					isActive = p6.id == var12.value,
					onActivated = var12.onActivated,
					LayoutOrder = (p7 - 1) * 2 + 1,
					testId = `{var12.testId}--segment-{p6.id}`,
					ref = var17[p6.id]
				})
			})
		end)),
		Overlay = reactModule.createElement(viewModule, {
			testId = "--foundation-segmented-control--animated-overlay",
			backgroundStyle = var13.Color.Shift.Shift_400,
			tag = var14.segment.tag,
			Size = reactModule.joinBindings({ highlightWidth, activeItemHeight }):map(function(p8) --[[ line: 140 ]]
				return UDim2.fromOffset(p8[1], p8[2])
			end),
			Position = highlightPosition:map(function(p9) --[[ line: 143 ]]
				-- upvalues: var23 (write), p1 (ref), var15 (write)
				return UDim2.fromOffset(p9, var23(p1 or var15))
			end),
			ZIndex = var12.ZIndex + 1
		})
	})
end))