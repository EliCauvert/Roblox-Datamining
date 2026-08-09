local foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local reactModule = require(foundation.Parent.React)
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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 23 | named "SheetContent" ]]
	-- upvalues: useTokensModule (ref), reactModule (ref), sheetContextModule (ref), flagsModule (ref), isScrollingFrameOverflowingYModule (ref), sheetTypeModule (ref), scrollViewModule (ref), viewModule (ref), constantsModule (ref)
	local var10 = useTokensModule()
	local var11 = reactModule.useContext(sheetContextModule)
	local innerScrollingEnabled = var11.innerScrollingEnabled
	local setInnerScrollY = var11.setInnerScrollY
	local actionsHeight = var11.actionsHeight
	local sheetContentHeight = var11.sheetContentHeight
	local setHasActionsDivider = var11.setHasActionsDivider
	local bottomPadding = var11.bottomPadding
	local hasHeader = var11.hasHeader
	local var12 = if flagsModule.FoundationSheetFullBleed then var11.hasFullBleed else false
	local var13 = if flagsModule.FoundationSheetFullBleed then var11.fullBleedHeight else nil
	local sheetType = var11.sheetType
	local testId = var11.testId
	assert(innerScrollingEnabled and (setInnerScrollY and (actionsHeight and (setHasActionsDivider and (bottomPadding and (hasHeader and testId))))), "SheetContent must be used within a Sheet")
	local var14, var15 = reactModule.useBinding(false)
	local var16 = reactModule.useCallback(function(p2) --[[ line: 51 ]]
		-- upvalues: setInnerScrollY (ref), isScrollingFrameOverflowingYModule (copy), setHasActionsDivider (ref), var15 (ref)
		setInnerScrollY(p2.CanvasPosition.Y)
		local var22 = isScrollingFrameOverflowingYModule(p2, 1)
		setHasActionsDivider(var22)
		var15(var22)
	end, { setHasActionsDivider, setInnerScrollY })
	local var17, var18 = reactModule.useBinding(0)
	local var19 = reactModule.useCallback(function(p3) --[[ line: 61 ]]
		-- upvalues: var18 (ref)
		var18(p3.AbsoluteSize.Y)
	end, {})
	local var20 = sheetType == sheetTypeModule.Bottom
	local var21 = p0.Selectable == nil or p0.Selectable
	
	return reactModule.createElement(scrollViewModule, {
		ZIndex = 1,
		tag = "fill size-full-0 auto-y",
		scrollingFrameRef = p0.scrollingFrameRef,
		selection = {
			Selectable = if var14 then var14:map(function(p4) --[[ line: 69 ]]
				-- upvalues: var21 (ref)
				return var21 and p4
			end) else nil,
			NextSelectionUp = p0.NextSelectionUp,
			NextSelectionDown = p0.NextSelectionDown,
			NextSelectionLeft = p0.NextSelectionLeft,
			NextSelectionRight = p0.NextSelectionRight
		},
		scroll = {
			ScrollingEnabled = innerScrollingEnabled,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = if sheetContentHeight then var17:map(function(p5) --[[ line: 90 ]]
				return UDim2.new(1, 0, 0, p5)
			end) else UDim2.fromScale(1, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y
		},
		Size = if sheetContentHeight then UDim2.fromScale(1, 1) else nil,
		padding = {
			top = hasHeader:map(function(p6) --[[ line: 98 ]]
				-- upvalues: var12 (ref), var20 (ref), var10 (ref)
				return if p6 or var12 then UDim.new(0, 0) else UDim.new(0, if var20 then var10.Padding.Small else var10.Margin.Small)
			end),
			bottom = if var20 then actionsHeight:map(function(p7) --[[ line: 104 ]]
				-- upvalues: bottomPadding (ref), var10 (ref)
				return UDim.new(0, p7 + bottomPadding + var10.Margin.Small)
			end) else UDim.new(0, var10.Padding.Small),
			left = UDim.new(0, var10.Padding.Small),
			right = UDim.new(0, var10.Padding.Small)
		},
		ClipsDescendants = if var20 then hasHeader else true,
		onCanvasPositionChanged = function(p8) --[[ line: 112 ]]
			-- upvalues: setInnerScrollY (ref)
			setInnerScrollY(p8.CanvasPosition.Y)
		end,
		onAbsoluteCanvasSizeChanged = var16,
		onAbsoluteWindowSizeChanged = var16,
		testId = `{testId}--content`,
		ref = p1
	}, reactModule.createElement(viewModule, {
		tag = "col align-x-center gap-medium size-full-0 auto-y padding-x-medium",
		onAbsoluteSizeChanged = var19
	}, if flagsModule.FoundationSheetFullBleed then {
		FullBleedSpacer = if var12 and var13 then reactModule.createElement(viewModule, {
			Size = var13:map(function(p9) --[[ line: 131 ]]
				return UDim2.new(1, 0, 0, math.max(0, p9))
			end),
			LayoutOrder = constantsModule.MIN_LAYOUT_ORDER,
			testId = `{testId}--content--full-bleed-spacer`
		}) else nil,
		Children = reactModule.createElement(reactModule.Fragment, nil, p0.children)
	} else p0.children))
end))