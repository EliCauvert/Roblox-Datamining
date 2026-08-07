-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:08 2026 Pacific Standard Time.

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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 30 | named "SheetContent" ]]
	-- upvalues: useTokensModule (ref), reactModule (ref), sheetContextModule (ref), flagsModule (ref), isScrollingFrameOverflowingYModule (ref), sheetTypeModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), dashModule (ref), useComposedRef (ref), scrollViewModule (ref), constantsModule (ref)
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
	local var16 = if flagsModule.FoundationSheetFullBleed then var15.hasFullBleed else false
	local var17 = if flagsModule.FoundationSheetFullBleed then var15.fullBleedHeight else nil
	local sheetType = var15.sheetType
	local testId = var15.testId
	assert(innerScrollingEnabled and (setInnerScrollY and (actionsHeight and (setHasActionsDivider and (bottomPadding and (hasHeader and testId))))), "SheetContent must be used within a Sheet")
	local var18, var19 = reactModule.useBinding(false)
	local var20 = reactModule.useCallback(function(p2) --[[ line: 59 ]]
		-- upvalues: setInnerScrollY (ref), isScrollingFrameOverflowingYModule (copy), setHasActionsDivider (ref), var19 (ref)
		setInnerScrollY(p2.CanvasPosition.Y)
		local var28 = isScrollingFrameOverflowingYModule(p2, 1)
		setHasActionsDivider(var28)
		var19(var28)
	end, { setHasActionsDivider, setInnerScrollY })
	local var21, var22 = reactModule.useBinding(0)
	local var23 = reactModule.useCallback(function(p3) --[[ line: 69 ]]
		-- upvalues: var22 (ref)
		var22(p3.AbsoluteSize.Y)
	end, {})
	local var24 = sheetType == sheetTypeModule.Bottom
	local var25 = if flagsModule.FoundationFullBleedSheetContent and p0.isContentFullBleed then nil else UDim.new(0, var14.Padding.Small)
	local var26 = p0.Selectable == nil or p0.Selectable
	local var27 = if flagsModule.FoundationBottomSheetGestureInteractionSink then reactModule.createElement("Folder", nil, {
		ContentInteractionSink = if if flagsModule.FoundationBottomSheetGestureInteractionSink then var15.isVerticalSheetGesture else nil then reactModule.createElement(viewModule, {
			Selectable = false,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			testId = `{testId}--content--interaction-sink`,
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			onActivated = dashModule.noop
		}) else nil
	}) else nil
	
	return reactModule.createElement(scrollViewModule, {
		ZIndex = 1,
		tag = "fill size-full-0 auto-y",
		scrollingFrameRef = if flagsModule.FoundationBottomSheetInnerScrollingSync then if flagsModule.FoundationBottomSheetInnerScrollingSync then useComposedRef(innerScrollingRef, p0.scrollingFrameRef) else nil else p0.scrollingFrameRef,
		selection = {
			Selectable = if var18 then var18:map(function(p4) --[[ line: 81 ]]
				-- upvalues: var26 (ref)
				return var26 and p4
			end) else nil,
			NextSelectionUp = p0.NextSelectionUp,
			NextSelectionDown = p0.NextSelectionDown,
			NextSelectionLeft = p0.NextSelectionLeft,
			NextSelectionRight = p0.NextSelectionRight
		},
		scroll = {
			ScrollingEnabled = innerScrollingEnabled,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = if sheetContentHeight then var21:map(function(p5) --[[ line: 134 ]]
				return UDim2.new(1, 0, 0, p5)
			end) else UDim2.fromScale(1, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y
		},
		Size = if sheetContentHeight then UDim2.fromScale(1, 1) else nil,
		padding = {
			top = hasHeader:map(function(p6) --[[ line: 142 ]]
				-- upvalues: var16 (ref), var24 (ref), var14 (ref)
				return if p6 or var16 then UDim.new(0, 0) else UDim.new(0, if var24 then var14.Padding.Small else var14.Margin.Small)
			end),
			bottom = if var24 then actionsHeight:map(function(p7) --[[ line: 148 ]]
				-- upvalues: bottomPadding (ref), var14 (ref)
				return UDim.new(0, p7 + bottomPadding + var14.Margin.Small)
			end) else UDim.new(0, var14.Padding.Small),
			left = var25,
			right = var25
		},
		ClipsDescendants = if var24 then hasHeader else true,
		onCanvasPositionChanged = function(p8) --[[ line: 156 ]]
			-- upvalues: setInnerScrollY (ref)
			setInnerScrollY(p8.CanvasPosition.Y)
		end,
		onAbsoluteCanvasSizeChanged = var20,
		onAbsoluteWindowSizeChanged = var20,
		testId = `{testId}--content`,
		ref = p1
	}, reactModule.createElement(viewModule, {
		onAbsoluteSizeChanged = var23,
		tag = if flagsModule.FoundationFullBleedSheetContent then {
			["col align-x-center gap-medium size-full-0 auto-y"] = true,
			["padding-x-medium"] = not p0.isContentFullBleed
		} else "col align-x-center gap-medium size-full-0 auto-y padding-x-medium"
	}, if flagsModule.FoundationSheetFullBleed then {
		FullBleedSpacer = if var16 and var17 then reactModule.createElement(viewModule, {
			Size = var17:map(function(p9) --[[ line: 180 ]]
				return UDim2.new(1, 0, 0, math.max(0, p9))
			end),
			LayoutOrder = constantsModule.MIN_LAYOUT_ORDER,
			testId = `{testId}--content--full-bleed-spacer`
		}) else nil,
		Children = reactModule.createElement(reactModule.Fragment, nil, p0.children),
		ContentInteractionSinkContainer = if flagsModule.FoundationBottomSheetGestureInteractionSink then var27 else nil
	} elseif flagsModule.FoundationBottomSheetGestureInteractionSink then {
		Children = reactModule.createElement(reactModule.Fragment, nil, p0.children),
		ContentInteractionSinkContainer = var27
	} else p0.children))
end))