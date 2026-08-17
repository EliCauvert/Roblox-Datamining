local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local chipGroupVariantModule = require(foundation.Enums.ChipGroupVariant)
local flagsModule = require(foundation.Utility.Flags)
local chipSizeModule = require(foundation.Enums.ChipSize)
local _ = require(foundation.Enums.ChipVariant)
local _ = require(foundation.Components.Chip.Accessory)
local visibilityModule = require(foundation.Enums.Visibility)
local useBackgroundStyle = require(foundation.Providers.Style.BackgroundStyleContext).useBackgroundStyle
local chipModule = require(foundation.Components.Chip)
local overflowScrollContainerModule = require(foundation.Components.OverflowScrollContainer)
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

local function Scrim(p0) --[[ line: 84 ]]
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

return reactModule.memo(reactModule.forwardRef(function(p1, p2) --[[ line: 104 | named "ChipGroup" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useChipGroupVariantsModule (ref), flagsModule (ref), reactModule (ref), chipModule (ref), viewModule (ref), withCommonPropsModule (ref), overflowScrollContainerModule (ref), useClippingRectModule (ref), scrollViewModule (ref), visibilityModule (ref), Scrim (ref), numberSequence (ref), numberSequence_1 (ref)
	local var19 = withDefaultsModule(p1, t)
	local var20 = useChipGroupVariantsModule(useTokensModule(), var19.variant, var19.size)
	
	if flagsModule.FoundationUnifiedScrimScrolling then
		local size = var19.size
		local t_1 = {}
		
		for i, v in var19.chips do
			t_1[`Chip{i}`] = reactModule.createElement(chipModule, {
				text = v.text,
				leading = v.leading,
				trailing = v.trailing,
				onActivated = v.onActivated,
				isChecked = v.isChecked,
				variant = v.variant,
				size = size,
				LayoutOrder = i,
				testId = `{var19.testId}--chip-{i}`
			})
		end
		local var22 = reactModule.createElement(viewModule, {
			tag = "auto-xy",
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, var20.gap),
				Wraps = var20.isWrapped
			}
		}, t_1)
		
		return if var20.isWrapped then reactModule.createElement(viewModule, withCommonPropsModule(var19, { tag = "size-full-0 auto-y", ref = p2 }), { ChipContainer = var22 }) else reactModule.createElement(overflowScrollContainerModule, withCommonPropsModule(var19, { size = var19.size, ref = p2 }), { ChipContainer = var22 })
	else
		local var23, var24 = reactModule.useBinding(false)
		local var25, var26 = reactModule.useBinding(false)
		local var27 = reactModule.useRef(nil)
		local var28 = useClippingRectModule(var27)
		local var29 = reactModule.useCallback(function(p3) --[[ line: 161 ]]
			-- upvalues: var20 (ref), var24 (ref), var26 (ref)
			if var20.hasScrim and p3.AbsoluteWindowSize.X ~= 0 then
				var24(p3.CanvasPosition.X ~= 0)
				var26(p3.AbsoluteWindowSize.X + p3.CanvasPosition.X < p3.AbsoluteCanvasSize.X - 1)
				
				return
			end
		end, { var20.hasScrim })
		local var30 = reactModule.useCallback(function() --[[ line: 173 ]]
			-- upvalues: var27 (ref), var29 (ref)
			if var27.current then
				var29(var27.current)
			end
		end, { var19.onAbsoluteSizeChanged, var29 })
		local var31 = reactModule.useCallback(function() --[[ line: 179 ]]
			-- upvalues: var27 (ref), var29 (ref)
			if var27.current then
				var29(var27.current)
			end
		end, { var19.onAbsolutePositionChanged, var29 })
		local size = var19.size
		local scrimWidth = var20.scrimWidth
		local t_1 = {}
		
		for i, v in var19.chips do
			t_1[`Chip{i}`] = reactModule.createElement(chipModule, {
				text = v.text,
				leading = v.leading,
				trailing = v.trailing,
				onActivated = v.onActivated,
				isChecked = v.isChecked,
				variant = v.variant,
				size = size,
				LayoutOrder = i,
				testId = `{var19.testId}--chip-{i}`
			})
		end
		local var33 = withCommonPropsModule(var19, { tag = "size-full-0 auto-y", ref = p2 })
		var33.onAbsoluteSizeChanged = var30
		var33.onAbsolutePositionChanged = var31
		
		return reactModule.createElement(viewModule, var33, {
			ScrollView = reactModule.createElement(scrollViewModule, {
				tag = "size-full-0 auto-y",
				scroll = {
					AutomaticSize = Enum.AutomaticSize.Y,
					AutomaticCanvasSize = Enum.AutomaticSize.X,
					CanvasSize = UDim2.fromScale(0, 1),
					ScrollingDirection = Enum.ScrollingDirection.X,
					ScrollingEnabled = not var20.isWrapped,
					scrollBarVisibility = visibilityModule.None
				},
				layout = {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, var20.gap),
					Wraps = var20.isWrapped
				},
				ClipsDescendants = var20.isWrapped,
				scrollingFrameRef = var27,
				onCanvasPositionChanged = if var20.hasScrim then var29 else nil,
				onAbsoluteCanvasSizeChanged = if var20.hasScrim then var29 else nil,
				onAbsoluteWindowSizeChanged = if var20.hasScrim then var29 else nil
			}, t_1),
			ScrimWrapper = if var20.hasScrim then reactModule.createElement(viewModule, {
				tag = "row flex-between",
				ZIndex = 2,
				Size = var28:map(function(p4) --[[ line: 235 ]]
					-- upvalues: scrimWidth (ref)
					return UDim2.fromOffset(p4.Max.X - p4.Min.X, scrimWidth)
				end),
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.fromScale(0.5, 0)
			}, {
				ScrimStart = var23 and reactModule.createElement(Scrim, {
					LayoutOrder = 1,
					gradient = numberSequence,
					width = scrimWidth,
					testId = `{var19.testId}--scrim-start`
				}),
				ScrimEnd = var25 and reactModule.createElement(Scrim, {
					LayoutOrder = 2,
					gradient = numberSequence_1,
					width = scrimWidth,
					testId = `{var19.testId}--scrim-end`
				})
			}) else nil
		})
	end
end))