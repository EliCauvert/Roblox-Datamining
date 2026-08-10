local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local chipGroupVariantModule = require(foundation.Enums.ChipGroupVariant)
local chipSizeModule = require(foundation.Enums.ChipSize)
local _ = require(foundation.Enums.ChipVariant)
local _ = require(foundation.Components.Chip.Accessory)
local visibilityModule = require(foundation.Enums.Visibility)
local useBackgroundStyle = require(foundation.Providers.Style.BackgroundStyleContext).useBackgroundStyle
local chipModule = require(foundation.Components.Chip)
local scrollViewModule = require(foundation.Components.ScrollView)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useChipGroupVariantsModule = require(foundation.Components.ChipGroup.useChipGroupVariants)
local useClippingRectModule = require(foundation.Components.ChipGroup.useClippingRect)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local numberSequence = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.5, 0),
	NumberSequenceKeypoint.new(1, 1)
})
local numberSequence_1 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.5, 0),
	NumberSequenceKeypoint.new(1, 0)
})
local t = {
	testId = "--foundation-chip-group",
	size = chipSizeModule.Medium,
	variant = chipGroupVariantModule.Row
}

local function Scrim(p0) --[[ line: 81 ]]
	-- upvalues: useBackgroundStyle (ref), reactModule (ref), viewModule (ref)
	return reactModule.createElement(viewModule, {
		LayoutOrder = p0.LayoutOrder,
		Size = UDim2.new(0, p0.width, 1, 0),
		backgroundStyle = useBackgroundStyle(),
		testId = p0.testId
	}, {
		UIGradient = reactModule.createElement("UIGradient", { Transparency = p0.gradient })
	})
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2) --[[ line: 101 | named "ChipGroup" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useChipGroupVariantsModule (ref), reactModule (ref), useClippingRectModule (ref), chipModule (ref), withCommonPropsModule (ref), viewModule (ref), scrollViewModule (ref), visibilityModule (ref), Scrim (ref), numberSequence (ref), numberSequence_1 (ref)
	local var17 = withDefaultsModule(p1, t)
	local var18 = useChipGroupVariantsModule(useTokensModule(), var17.variant, var17.size)
	local var19, var20 = reactModule.useBinding(false)
	local var21, var22 = reactModule.useBinding(false)
	local var23 = reactModule.useRef(nil)
	local var24 = useClippingRectModule(var23)
	local var25 = reactModule.useCallback(function(p3) --[[ line: 111 ]]
		-- upvalues: var18 (ref), var20 (ref), var22 (ref)
		if var18.hasScrim and p3.AbsoluteWindowSize.X ~= 0 then
			var20(p3.CanvasPosition.X ~= 0)
			var22(p3.AbsoluteWindowSize.X + p3.CanvasPosition.X < p3.AbsoluteCanvasSize.X - 1)
			
			return
		end
	end, { var18.hasScrim })
	local var26 = reactModule.useCallback(function() --[[ line: 123 ]]
		-- upvalues: var23 (ref), var25 (ref)
		if var23.current then
			var25(var23.current)
		end
	end, { var17.onAbsoluteSizeChanged, var25 })
	local var27 = reactModule.useCallback(function() --[[ line: 129 ]]
		-- upvalues: var23 (ref), var25 (ref)
		if var23.current then
			var25(var23.current)
		end
	end, { var17.onAbsolutePositionChanged, var25 })
	local size = var17.size
	local scrimWidth = var18.scrimWidth
	local t_1 = {}
	
	for i, v in var17.chips do
		t_1[`Chip{i}`] = reactModule.createElement(chipModule, {
			text = v.text,
			leading = v.leading,
			trailing = v.trailing,
			onActivated = v.onActivated,
			isChecked = v.isChecked,
			variant = v.variant,
			size = size,
			LayoutOrder = i,
			testId = `{var17.testId}--chip-{i}`
		})
	end
	local var29 = withCommonPropsModule(var17, { tag = "size-full-0 auto-y", ref = p2 })
	var29.onAbsoluteSizeChanged = var26
	var29.onAbsolutePositionChanged = var27
	
	return reactModule.createElement(viewModule, var29, {
		ScrollView = reactModule.createElement(scrollViewModule, {
			tag = "size-full-0 auto-y",
			scroll = {
				AutomaticSize = Enum.AutomaticSize.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				CanvasSize = UDim2.fromScale(0, 1),
				ScrollingDirection = Enum.ScrollingDirection.X,
				ScrollingEnabled = not var18.isWrapped,
				scrollBarVisibility = visibilityModule.None
			},
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, var18.gap),
				Wraps = var18.isWrapped
			},
			ClipsDescendants = var18.isWrapped,
			scrollingFrameRef = var23,
			onCanvasPositionChanged = if var18.hasScrim then var25 else nil,
			onAbsoluteCanvasSizeChanged = if var18.hasScrim then var25 else nil,
			onAbsoluteWindowSizeChanged = if var18.hasScrim then var25 else nil
		}, t_1),
		ScrimWrapper = if var18.hasScrim then reactModule.createElement(viewModule, {
			tag = "row flex-between",
			ZIndex = 2,
			Size = var24:map(function(p4) --[[ line: 185 ]]
				-- upvalues: scrimWidth (ref)
				return UDim2.fromOffset(p4.Max.X - p4.Min.X, scrimWidth)
			end),
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0)
		}, {
			ScrimStart = var19 and reactModule.createElement(Scrim, {
				LayoutOrder = 1,
				gradient = numberSequence,
				width = scrimWidth,
				testId = `{var17.testId}--scrim-start`
			}),
			ScrimEnd = var21 and reactModule.createElement(Scrim, {
				LayoutOrder = 2,
				gradient = numberSequence_1,
				width = scrimWidth,
				testId = `{var17.testId}--scrim-end`
			})
		}) else nil
	})
end))