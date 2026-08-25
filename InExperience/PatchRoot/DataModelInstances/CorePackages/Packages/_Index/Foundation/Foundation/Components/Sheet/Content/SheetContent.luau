local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local constantsModule = require(foundation.Constants)
local flagsModule = require(foundation.Utility.Flags)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local sheet = script:FindFirstAncestor("Sheet")
local sheetContextModule = require(sheet.SheetContext)
local sheetTypeModule = require(sheet.SheetType)
local scrollViewModule = require(foundation.Components.ScrollView)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local isScrollingFrameOverflowingYModule = require(foundation.Utility.isScrollingFrameOverflowingY)
local useComposedRef = reactUtilsModule.useComposedRef

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: useTokensModule (ref), reactModule (ref), sheetContextModule (ref), isScrollingFrameOverflowingYModule (ref), sheetTypeModule (ref), flagsModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), dashModule (ref), useComposedRef (ref), scrollViewModule (ref), constantsModule (ref)
	local var14 = useTokensModule()
	local var15 = reactModule.useContext(sheetContextModule)
	local innerScrollingEnabled = var15.innerScrollingEnabled
	local setInnerScrollY = var15.setInnerScrollY
	local innerScrollingRef = var15.innerScrollingRef
	local actionsHeight = var15.actionsHeight
	local sheetContentHeight = var15.sheetContentHeight
	local setHasActionsDivider = var15.setHasActionsDivider
	local bottomPadding = var15.bottomPadding
	local hasHeader = var15.hasHeader
	local hasFullBleed = var15.hasFullBleed
	local fullBleedHeight = var15.fullBleedHeight
	local sheetType = var15.sheetType
	local testId = var15.testId
	assert(innerScrollingEnabled and (setInnerScrollY and (actionsHeight and (setHasActionsDivider and (bottomPadding and (hasHeader and testId))))), "SheetContent must be used within a Sheet")
	local var16, var17 = reactModule.useBinding(false)
	local var18 = reactModule.useCallback(function(p2)
		-- upvalues: setInnerScrollY (ref), isScrollingFrameOverflowingYModule (copy), setHasActionsDivider (ref), var17 (ref)
		setInnerScrollY(p2.CanvasPosition.Y)
		local var25 = isScrollingFrameOverflowingYModule(p2, 1)
		setHasActionsDivider(var25)
		var17(var25)
	end, { setHasActionsDivider, setInnerScrollY })
	local var19, var20 = reactModule.useBinding(0)
	local var21 = reactModule.useCallback(function(p3)
		-- upvalues: var20 (ref)
		var20(p3.AbsoluteSize.Y)
	end, {})
	local var22 = sheetType == sheetTypeModule.Bottom
	local var23 = if p0.isContentFullBleed then nil else UDim.new(0, var14.Padding.Small)
	local var24 = p0.Selectable == nil or p0.Selectable
	
	return reactModule.createElement(scrollViewModule, {
		ZIndex = 1,
		tag = "fill size-full-0 auto-y",
		scrollingFrameRef = useComposedRef(innerScrollingRef, p0.scrollingFrameRef),
		selection = {
			Selectable = if var16 then var16:map(function(p4)
				-- upvalues: var24 (ref)
				return var24 and p4
			end) else nil,
			NextSelectionUp = p0.NextSelectionUp,
			NextSelectionDown = p0.NextSelectionDown,
			NextSelectionLeft = p0.NextSelectionLeft,
			NextSelectionRight = p0.NextSelectionRight
		},
		scroll = {
			ScrollingEnabled = innerScrollingEnabled,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = if sheetContentHeight then var19:map(function(p5)
				return UDim2.new(1, 0, 0, p5)
			end) else UDim2.fromScale(1, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y
		},
		Size = if sheetContentHeight then UDim2.fromScale(1, 1) else nil,
		padding = {
			top = hasHeader:map(function(p6)
				-- upvalues: hasFullBleed (ref), var22 (ref), var14 (ref)
				return if p6 or hasFullBleed then UDim.new(0, 0) else UDim.new(0, if var22 then var14.Padding.Small else var14.Margin.Small)
			end),
			bottom = if var22 then actionsHeight:map(function(p7)
				-- upvalues: bottomPadding (ref), var14 (ref)
				return UDim.new(0, p7 + bottomPadding + var14.Margin.Small)
			end) else UDim.new(0, var14.Padding.Small),
			left = var23,
			right = var23
		},
		ClipsDescendants = if var22 then hasHeader else true,
		onCanvasPositionChanged = function(p8)
			-- upvalues: setInnerScrollY (ref)
			setInnerScrollY(p8.CanvasPosition.Y)
		end,
		onAbsoluteCanvasSizeChanged = var18,
		onAbsoluteWindowSizeChanged = var18,
		testId = `{testId}--content`,
		ref = p1
	}, reactModule.createElement(viewModule, {
		onAbsoluteSizeChanged = var21,
		tag = {
			["col align-x-center gap-medium size-full-0 auto-y"] = true,
			["padding-x-medium"] = not p0.isContentFullBleed
		}
	}, {
		FullBleedSpacer = if hasFullBleed and fullBleedHeight then reactModule.createElement(viewModule, {
			Size = fullBleedHeight:map(function(p9)
				return UDim2.new(1, 0, 0, math.max(0, p9))
			end),
			LayoutOrder = constantsModule.MIN_LAYOUT_ORDER,
			testId = `{testId}--content--full-bleed-spacer`
		}) else nil,
		Children = reactModule.createElement(reactModule.Fragment, nil, p0.children),
		ContentInteractionSinkContainer = if flagsModule.FoundationBottomSheetGestureInteractionSink then if flagsModule.FoundationBottomSheetGestureInteractionSink then reactModule.createElement("Folder", nil, {
			ContentInteractionSink = if if flagsModule.FoundationBottomSheetGestureInteractionSink then var15.isVerticalSheetGesture else nil then reactModule.createElement(viewModule, {
				Selectable = false,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				testId = `{testId}--content--interaction-sink`,
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				onActivated = dashModule.noop
			}) else nil
		}) else nil else nil
	}))
end))