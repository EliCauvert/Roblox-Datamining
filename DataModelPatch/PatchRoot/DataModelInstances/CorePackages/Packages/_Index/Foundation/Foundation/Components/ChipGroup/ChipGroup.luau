local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Enums.ChipVariant)
local _ = require(Foundation.Components.Chip.Accessory)
local VisibilityModule = require(Foundation.Enums.Visibility)
local UseBackgroundStyleFunction = require(Foundation.Providers.Style.BackgroundStyleContext).useBackgroundStyle
local ChipModule = require(Foundation.Components.Chip)
local ScrollViewModule = require(Foundation.Components.ScrollView)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseChipGroupVariantsModule = require(Foundation.Components.ChipGroup.useChipGroupVariants)
local UseClippingRectModule = require(Foundation.Components.ChipGroup.useClippingRect)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local NumberSequence1 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.5, 0),
	NumberSequenceKeypoint.new(1, 1)
})
local NumberSequence2 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.5, 0),
	NumberSequenceKeypoint.new(1, 0)
})
local config = {
	testId = "--foundation-chip-group",
	size = require(Foundation.Enums.ChipSize).Medium,
	variant = require(Foundation.Enums.ChipGroupVariant).Row
}

local function Scrim(Frame)
	-- upvalues: UseBackgroundStyleFunction (copy), ReactModule (copy), ViewModule (copy)
	return ReactModule.createElement(ViewModule, {
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.new(0, Frame.width, 1, 0),
		backgroundStyle = UseBackgroundStyleFunction(),
		testId = Frame.testId
	}, {
		UIGradient = ReactModule.createElement("UIGradient", { Transparency = Frame.gradient })
	})
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseChipGroupVariantsModule (copy), ReactModule (copy), UseClippingRectModule (copy), ChipModule (copy), WithCommonPropsModule (copy), ViewModule (copy), ScrollViewModule (copy), VisibilityModule (copy), Scrim (copy), NumberSequence1 (copy), NumberSequence2 (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseChipGroupVariantsModuleResult = UseChipGroupVariantsModule(UseTokensModule(), WithDefaultsModuleResult.variant, WithDefaultsModuleResult.size)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseClippingRectModuleResult = UseClippingRectModule(UseRefResult)
	local UseResult = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseChipGroupVariantsModuleResult (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy)
		if UseChipGroupVariantsModuleResult.hasScrim and ScrollFrame.AbsoluteWindowSize.X ~= 0 then
			UseBindingResult2(ScrollFrame.CanvasPosition.X ~= 0)
			UseBindingResult2_1(ScrollFrame.AbsoluteWindowSize.X + ScrollFrame.CanvasPosition.X < ScrollFrame.AbsoluteCanvasSize.X - 1)
			
			return
		end
	end, { UseChipGroupVariantsModuleResult.hasScrim })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseResult (copy)
		if UseRefResult.current then
			UseResult(UseRefResult.current)
		end
	end, {
		WithDefaultsModuleResult.onAbsoluteSizeChanged,
		UseResult
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseResult (copy)
		if UseRefResult.current then
			UseResult(UseRefResult.current)
		end
	end, {
		WithDefaultsModuleResult.onAbsolutePositionChanged,
		UseResult
	})
	local Size = WithDefaultsModuleResult.size
	local ScrimWidth = UseChipGroupVariantsModuleResult.scrimWidth
	local Elements = {}
	
	for LayoutOrder, chip in WithDefaultsModuleResult.chips do
		Elements[`Chip{LayoutOrder}`] = ReactModule.createElement(ChipModule, {
			text = chip.text,
			leading = chip.leading,
			trailing = chip.trailing,
			onActivated = chip.onActivated,
			isChecked = chip.isChecked,
			variant = chip.variant,
			size = Size,
			LayoutOrder = LayoutOrder,
			testId = `{WithDefaultsModuleResult.testId}--chip-{LayoutOrder}`
		})
	end
	local WithCommonPropsModuleResult = WithCommonPropsModule(WithDefaultsModuleResult, { tag = "size-full-0 auto-y", ref = Ref })
	WithCommonPropsModuleResult.onAbsoluteSizeChanged = UseResult1
	WithCommonPropsModuleResult.onAbsolutePositionChanged = UseResult2
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModuleResult, {
		ScrollView = ReactModule.createElement(ScrollViewModule, {
			tag = "size-full-0 auto-y",
			scroll = {
				AutomaticSize = Enum.AutomaticSize.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				CanvasSize = UDim2.fromScale(0, 1),
				ScrollingDirection = Enum.ScrollingDirection.X,
				ScrollingEnabled = not UseChipGroupVariantsModuleResult.isWrapped,
				scrollBarVisibility = VisibilityModule.None
			},
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, UseChipGroupVariantsModuleResult.gap),
				Wraps = UseChipGroupVariantsModuleResult.isWrapped
			},
			ClipsDescendants = UseChipGroupVariantsModuleResult.isWrapped,
			scrollingFrameRef = UseRefResult,
			onCanvasPositionChanged = if UseChipGroupVariantsModuleResult.hasScrim then UseResult else nil,
			onAbsoluteCanvasSizeChanged = if UseChipGroupVariantsModuleResult.hasScrim then UseResult else nil,
			onAbsoluteWindowSizeChanged = if UseChipGroupVariantsModuleResult.hasScrim then UseResult else nil
		}, Elements),
		ScrimWrapper = if UseChipGroupVariantsModuleResult.hasScrim then ReactModule.createElement(ViewModule, {
			tag = "row flex-between",
			ZIndex = 2,
			Size = UseClippingRectModuleResult:map(function(p2): UDim2
				-- upvalues: ScrimWidth (copy)
				return UDim2.fromOffset(p2.Max.X - p2.Min.X, ScrimWidth)
			end),
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0)
		}, {
			ScrimStart = UseBindingResult and ReactModule.createElement(Scrim, {
				LayoutOrder = 1,
				gradient = NumberSequence1,
				width = ScrimWidth,
				testId = `{WithDefaultsModuleResult.testId}--scrim-start`
			}),
			ScrimEnd = UseBindingResult1 and ReactModule.createElement(Scrim, {
				LayoutOrder = 2,
				gradient = NumberSequence2,
				width = ScrimWidth,
				testId = `{WithDefaultsModuleResult.testId}--scrim-end`
			})
		}) else nil
	})
end))