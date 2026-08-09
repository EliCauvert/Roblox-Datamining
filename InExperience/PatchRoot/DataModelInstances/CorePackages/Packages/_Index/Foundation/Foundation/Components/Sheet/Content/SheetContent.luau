local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local constantsModule = require(foundation.Constants)
local flagsModule = require(foundation.Utility.Flags)
local sheet = script:FindFirstAncestor("Sheet")
local sheetContextModule = require(sheet.SheetContext)
local sheetTypeModule = require(sheet.SheetType)
local scrollViewModule = require(foundation.Components.ScrollView)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local isScrollingFrameOverflowingYModule = require(foundation.Utility.isScrollingFrameOverflowingY)
local useComposedRef = reactUtilsModule.useComposedRef

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 28 | named "SheetContent" ]]
	-- upvalues: useTokensModule (ref), reactModule (ref), sheetContextModule (ref), flagsModule (ref), isScrollingFrameOverflowingYModule (ref), sheetTypeModule (ref), useComposedRef (ref), scrollViewModule (ref), viewModule (ref), constantsModule (ref)
	local var12 = useTokensModule()
	local var13 = reactModule.useContext(sheetContextModule)
	local innerScrollingEnabled = var13.innerScrollingEnabled
	local setInnerScrollY = var13.setInnerScrollY
	local innerScrollingRef = var13.innerScrollingRef
	local actionsHeight = var13.actionsHeight
	local sheetContentHeight = var13.sheetContentHeight
	local setHasActionsDivider = var13.setHasActionsDivider
	local bottomPadding = var13.bottomPadding
	local hasHeader = var13.hasHeader
	local var14 = if flagsModule.FoundationSheetFullBleed then var13.hasFullBleed else false
	local var15 = if flagsModule.FoundationSheetFullBleed then var13.fullBleedHeight else nil
	local sheetType = var13.sheetType
	local testId = var13.testId
	assert(innerScrollingEnabled and (setInnerScrollY and (actionsHeight and (setHasActionsDivider and (bottomPadding and (hasHeader and testId))))), "SheetContent must be used within a Sheet")
	local var16, var17 = reactModule.useBinding(false)
	local var18 = reactModule.useCallback(function(p2) --[[ line: 57 ]]
		-- upvalues: setInnerScrollY (ref), isScrollingFrameOverflowingYModule (copy), setHasActionsDivider (ref), var17 (ref)
		setInnerScrollY(p2.CanvasPosition.Y)
		local var25 = isScrollingFrameOverflowingYModule(p2, 1)
		setHasActionsDivider(var25)
		var17(var25)
	end, { setHasActionsDivider, setInnerScrollY })
	local var19, var20 = reactModule.useBinding(0)
	local var21 = reactModule.useCallback(function(p3) --[[ line: 67 ]]
		-- upvalues: var20 (ref)
		var20(p3.AbsoluteSize.Y)
	end, {})
	local var22 = sheetType == sheetTypeModule.Bottom
	local var23 = if flagsModule.FoundationFullBleedSheetContent and p0.isContentFullBleed then nil else UDim.new(0, var12.Padding.Small)
	local var24 = p0.Selectable == nil or p0.Selectable
	
	return reactModule.createElement(scrollViewModule, {
		ZIndex = 1,
		tag = "fill size-full-0 auto-y",
		scrollingFrameRef = if flagsModule.FoundationBottomSheetInnerScrollingSync then if flagsModule.FoundationBottomSheetInnerScrollingSync then useComposedRef(innerScrollingRef, p0.scrollingFrameRef) else nil else p0.scrollingFrameRef,
		selection = {
			Selectable = if var16 then var16:map(function(p4) --[[ line: 79 ]]
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
			CanvasSize = if sheetContentHeight then var19:map(function(p5) --[[ line: 109 ]]
				return UDim2.new(1, 0, 0, p5)
			end) else UDim2.fromScale(1, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y
		},
		Size = if sheetContentHeight then UDim2.fromScale(1, 1) else nil,
		padding = {
			top = hasHeader:map(function(p6) --[[ line: 117 ]]
				-- upvalues: var14 (ref), var22 (ref), var12 (ref)
				return if p6 or var14 then UDim.new(0, 0) else UDim.new(0, if var22 then var12.Padding.Small else var12.Margin.Small)
			end),
			bottom = if var22 then actionsHeight:map(function(p7) --[[ line: 123 ]]
				-- upvalues: bottomPadding (ref), var12 (ref)
				return UDim.new(0, p7 + bottomPadding + var12.Margin.Small)
			end) else UDim.new(0, var12.Padding.Small),
			left = var23,
			right = var23
		},
		ClipsDescendants = if var22 then hasHeader else true,
		onCanvasPositionChanged = function(p8) --[[ line: 131 ]]
			-- upvalues: setInnerScrollY (ref)
			setInnerScrollY(p8.CanvasPosition.Y)
		end,
		onAbsoluteCanvasSizeChanged = var18,
		onAbsoluteWindowSizeChanged = var18,
		testId = `{testId}--content`,
		ref = p1
	}, reactModule.createElement(viewModule, {
		onAbsoluteSizeChanged = var21,
		tag = if flagsModule.FoundationFullBleedSheetContent then {
			["col align-x-center gap-medium size-full-0 auto-y"] = true,
			["padding-x-medium"] = not p0.isContentFullBleed
		} else "col align-x-center gap-medium size-full-0 auto-y padding-x-medium"
	}, if flagsModule.FoundationSheetFullBleed then {
		FullBleedSpacer = if var14 and var15 then reactModule.createElement(viewModule, {
			Size = var15:map(function(p9) --[[ line: 155 ]]
				return UDim2.new(1, 0, 0, math.max(0, p9))
			end),
			LayoutOrder = constantsModule.MIN_LAYOUT_ORDER,
			testId = `{testId}--content--full-bleed-spacer`
		}) else nil,
		Children = reactModule.createElement(reactModule.Fragment, nil, p0.children)
	} else p0.children))
end))