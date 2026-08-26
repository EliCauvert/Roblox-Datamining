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

local function Scrim(p1)
	-- upvalues: useBackgroundStyle (ref), reactModule (ref), viewModule (ref)
	return reactModule.createElement(viewModule, {
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.new(0, p1.width, 1, 0),
		backgroundStyle = useBackgroundStyle(),
		testId = p1.testId
	}, {
		UIGradient = reactModule.createElement("UIGradient", { Transparency = p1.gradient })
	})
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useChipGroupVariantsModule (ref), flagsModule (ref), reactModule (ref), chipModule (ref), viewModule (ref), withCommonPropsModule (ref), overflowScrollContainerModule (ref), useClippingRectModule (ref), scrollViewModule (ref), visibilityModule (ref), Scrim (ref), numberSequence (ref), numberSequence_1 (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useChipGroupVariantsModule(useTokensModule(), var1.variant, var1.size)
	
	if flagsModule.FoundationUnifiedScrimScrolling then
		local size = var1.size
		local t_1 = {}
		
		for i, v in var1.chips do
			t_1[`Chip{i}`] = reactModule.createElement(chipModule, {
				text = v.text,
				leading = v.leading,
				trailing = v.trailing,
				onActivated = v.onActivated,
				isChecked = v.isChecked,
				variant = v.variant,
				size = size,
				LayoutOrder = i,
				testId = `{var1.testId}--chip-{i}`
			})
		end
		local var3 = reactModule.createElement(viewModule, {
			tag = "auto-xy",
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, var2.gap),
				Wraps = var2.isWrapped
			}
		}, t_1)
		
		return if var2.isWrapped then reactModule.createElement(viewModule, withCommonPropsModule(var1, { tag = "size-full-0 auto-y", ref = p2 }), { ChipContainer = var3 }) else reactModule.createElement(overflowScrollContainerModule, withCommonPropsModule(var1, { size = var1.size, ref = p2 }), { ChipContainer = var3 })
	else
		local var4, var5 = reactModule.useBinding(false)
		local var6, var7 = reactModule.useBinding(false)
		local var8 = reactModule.useRef(nil)
		local var9 = useClippingRectModule(var8)
		local var10 = reactModule.useCallback(function(p3)
			-- upvalues: var2 (ref), var5 (ref), var7 (ref)
			if var2.hasScrim and p3.AbsoluteWindowSize.X ~= 0 then
				var5(p3.CanvasPosition.X ~= 0)
				var7(p3.AbsoluteWindowSize.X + p3.CanvasPosition.X < p3.AbsoluteCanvasSize.X - 1)
				
				return
			end
		end, { var2.hasScrim })
		local var11 = reactModule.useCallback(function()
			-- upvalues: var8 (ref), var10 (ref)
			if var8.current then
				var10(var8.current)
			end
		end, { var1.onAbsoluteSizeChanged, var10 })
		local var12 = reactModule.useCallback(function()
			-- upvalues: var8 (ref), var10 (ref)
			if var8.current then
				var10(var8.current)
			end
		end, { var1.onAbsolutePositionChanged, var10 })
		local size = var1.size
		local scrimWidth = var2.scrimWidth
		local t_1 = {}
		
		for i, v in var1.chips do
			t_1[`Chip{i}`] = reactModule.createElement(chipModule, {
				text = v.text,
				leading = v.leading,
				trailing = v.trailing,
				onActivated = v.onActivated,
				isChecked = v.isChecked,
				variant = v.variant,
				size = size,
				LayoutOrder = i,
				testId = `{var1.testId}--chip-{i}`
			})
		end
		local var13 = withCommonPropsModule(var1, { tag = "size-full-0 auto-y", ref = p2 })
		var13.onAbsoluteSizeChanged = var11
		var13.onAbsolutePositionChanged = var12
		
		return reactModule.createElement(viewModule, var13, {
			ScrollView = reactModule.createElement(scrollViewModule, {
				tag = "size-full-0 auto-y",
				scroll = {
					AutomaticSize = Enum.AutomaticSize.Y,
					AutomaticCanvasSize = Enum.AutomaticSize.X,
					CanvasSize = UDim2.fromScale(0, 1),
					ScrollingDirection = Enum.ScrollingDirection.X,
					ScrollingEnabled = not var2.isWrapped,
					scrollBarVisibility = visibilityModule.None
				},
				layout = {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, var2.gap),
					Wraps = var2.isWrapped
				},
				ClipsDescendants = var2.isWrapped,
				scrollingFrameRef = var8,
				onCanvasPositionChanged = if var2.hasScrim then var10 else nil,
				onAbsoluteCanvasSizeChanged = if var2.hasScrim then var10 else nil,
				onAbsoluteWindowSizeChanged = if var2.hasScrim then var10 else nil
			}, t_1),
			ScrimWrapper = if var2.hasScrim then reactModule.createElement(viewModule, {
				tag = "row flex-between",
				ZIndex = 2,
				Size = var9:map(function(p3)
					-- upvalues: scrimWidth (ref)
					return UDim2.fromOffset(p3.Max.X - p3.Min.X, scrimWidth)
				end),
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.fromScale(0.5, 0)
			}, {
				ScrimStart = var4 and reactModule.createElement(Scrim, {
					LayoutOrder = 1,
					gradient = numberSequence,
					width = scrimWidth,
					testId = `{var1.testId}--scrim-start`
				}),
				ScrimEnd = var6 and reactModule.createElement(Scrim, {
					LayoutOrder = 2,
					gradient = numberSequence_1,
					width = scrimWidth,
					testId = `{var1.testId}--scrim-end`
				})
			}) else nil
		})
	end
end))