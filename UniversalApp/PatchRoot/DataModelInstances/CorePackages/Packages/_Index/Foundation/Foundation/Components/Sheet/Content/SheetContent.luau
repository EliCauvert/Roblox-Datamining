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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokensModule (ref), reactModule (ref), sheetContextModule (ref), isScrollingFrameOverflowingYModule (ref), sheetTypeModule (ref), flagsModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), dashModule (ref), useComposedRef (ref), scrollViewModule (ref), constantsModule (ref)
	local var1 = useTokensModule()
	local var2 = reactModule.useContext(sheetContextModule)
	local innerScrollingEnabled = var2.innerScrollingEnabled
	local setInnerScrollY = var2.setInnerScrollY
	local innerScrollingRef = var2.innerScrollingRef
	local actionsHeight = var2.actionsHeight
	local sheetContentHeight = var2.sheetContentHeight
	local setHasActionsDivider = var2.setHasActionsDivider
	local bottomPadding = var2.bottomPadding
	local hasHeader = var2.hasHeader
	local hasFullBleed = var2.hasFullBleed
	local fullBleedHeight = var2.fullBleedHeight
	local sheetType = var2.sheetType
	local testId = var2.testId
	assert(innerScrollingEnabled and (setInnerScrollY and (actionsHeight and (setHasActionsDivider and (bottomPadding and (hasHeader and testId))))), "SheetContent must be used within a Sheet")
	local var3, var4 = reactModule.useBinding(false)
	local var5 = reactModule.useCallback(function(p1)
		-- upvalues: setInnerScrollY (ref), isScrollingFrameOverflowingYModule (copy), setHasActionsDivider (ref), var4 (ref)
		setInnerScrollY(p1.CanvasPosition.Y)
		local var1 = isScrollingFrameOverflowingYModule(p1, 1)
		setHasActionsDivider(var1)
		var4(var1)
	end, { setHasActionsDivider, setInnerScrollY })
	local var6, var7 = reactModule.useBinding(0)
	local var8 = reactModule.useCallback(function(p1)
		-- upvalues: var7 (ref)
		var7(p1.AbsoluteSize.Y)
	end, {})
	local var9 = sheetType == sheetTypeModule.Bottom
	local var10 = if p1.isContentFullBleed then nil else UDim.new(0, var1.Padding.Small)
	local var11 = p1.Selectable == nil or p1.Selectable
	
	return reactModule.createElement(scrollViewModule, {
		ZIndex = 1,
		tag = "fill size-full-0 auto-y",
		scrollingFrameRef = useComposedRef(innerScrollingRef, p1.scrollingFrameRef),
		selection = {
			Selectable = if var3 then var3:map(function(p1)
				-- upvalues: var11 (ref)
				return var11 and p1
			end) else nil,
			NextSelectionUp = p1.NextSelectionUp,
			NextSelectionDown = p1.NextSelectionDown,
			NextSelectionLeft = p1.NextSelectionLeft,
			NextSelectionRight = p1.NextSelectionRight
		},
		scroll = {
			ScrollingEnabled = innerScrollingEnabled,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = if sheetContentHeight then var6:map(function(p1)
				return UDim2.new(1, 0, 0, p1)
			end) else UDim2.fromScale(1, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y
		},
		Size = if sheetContentHeight then UDim2.fromScale(1, 1) else nil,
		padding = {
			top = hasHeader:map(function(p1)
				-- upvalues: hasFullBleed (ref), var9 (ref), var1 (ref)
				return if p1 or hasFullBleed then UDim.new(0, 0) else UDim.new(0, if var9 then var1.Padding.Small else var1.Margin.Small)
			end),
			bottom = if var9 then actionsHeight:map(function(p1)
				-- upvalues: bottomPadding (ref), var1 (ref)
				return UDim.new(0, p1 + bottomPadding + var1.Margin.Small)
			end) else UDim.new(0, var1.Padding.Small),
			left = var10,
			right = var10
		},
		ClipsDescendants = if var9 then hasHeader else true,
		onCanvasPositionChanged = function(p1)
			-- upvalues: setInnerScrollY (ref)
			setInnerScrollY(p1.CanvasPosition.Y)
		end,
		onAbsoluteCanvasSizeChanged = var5,
		onAbsoluteWindowSizeChanged = var5,
		testId = `{testId}--content`,
		ref = p2
	}, reactModule.createElement(viewModule, {
		onAbsoluteSizeChanged = var8,
		tag = {
			["col align-x-center gap-medium size-full-0 auto-y"] = true,
			["padding-x-medium"] = not p1.isContentFullBleed
		}
	}, {
		FullBleedSpacer = if hasFullBleed and fullBleedHeight then reactModule.createElement(viewModule, {
			Size = fullBleedHeight:map(function(p1)
				return UDim2.new(1, 0, 0, math.max(0, p1))
			end),
			LayoutOrder = constantsModule.MIN_LAYOUT_ORDER,
			testId = `{testId}--content--full-bleed-spacer`
		}) else nil,
		Children = reactModule.createElement(reactModule.Fragment, nil, p1.children),
		ContentInteractionSinkContainer = if flagsModule.FoundationBottomSheetGestureInteractionSink then if flagsModule.FoundationBottomSheetGestureInteractionSink then reactModule.createElement("Folder", nil, {
			ContentInteractionSink = if if flagsModule.FoundationBottomSheetGestureInteractionSink then var2.isVerticalSheetGesture else nil then reactModule.createElement(viewModule, {
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