local foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local reactModule = require(foundation.Parent.React)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local constantsModule = require(foundation.Constants)
local sheet = script:FindFirstAncestor("Sheet")
local sheetContextModule = require(sheet.SheetContext)
local sheetTypeModule = require(sheet.SheetType)
local scrollViewModule = require(foundation.Components.ScrollView)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local isScrollingFrameOverflowingYModule = require(foundation.Utility.isScrollingFrameOverflowingY)

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 22 | named "SheetContent" ]]
	-- upvalues: useTokensModule (ref), reactModule (ref), sheetContextModule (ref), isScrollingFrameOverflowingYModule (ref), sheetTypeModule (ref), scrollViewModule (ref), viewModule (ref), constantsModule (ref)
	local var9 = useTokensModule()
	local var10 = reactModule.useContext(sheetContextModule)
	local innerScrollingEnabled = var10.innerScrollingEnabled
	local setInnerScrollY = var10.setInnerScrollY
	local actionsHeight = var10.actionsHeight
	local sheetContentHeight = var10.sheetContentHeight
	local setHasActionsDivider = var10.setHasActionsDivider
	local bottomPadding = var10.bottomPadding
	local hasHeader = var10.hasHeader
	local hasFullBleed = var10.hasFullBleed
	local fullBleedHeight = var10.fullBleedHeight
	local sheetType = var10.sheetType
	local testId = var10.testId
	assert(innerScrollingEnabled and (setInnerScrollY and (actionsHeight and (setHasActionsDivider and (bottomPadding and (hasHeader and testId))))), "SheetContent must be used within a Sheet")
	local var11, var12 = reactModule.useBinding(false)
	local var13 = reactModule.useCallback(function(p2) --[[ line: 50 ]]
		-- upvalues: setInnerScrollY (ref), isScrollingFrameOverflowingYModule (copy), setHasActionsDivider (ref), var12 (ref)
		setInnerScrollY(p2.CanvasPosition.Y)
		local var19 = isScrollingFrameOverflowingYModule(p2, 1)
		setHasActionsDivider(var19)
		var12(var19)
	end, { setHasActionsDivider, setInnerScrollY })
	local var14, var15 = reactModule.useBinding(0)
	local var16 = reactModule.useCallback(function(p3) --[[ line: 60 ]]
		-- upvalues: var15 (ref)
		var15(p3.AbsoluteSize.Y)
	end, {})
	local var17 = sheetType == sheetTypeModule.Bottom
	local var18 = p0.Selectable == nil or p0.Selectable
	
	return reactModule.createElement(scrollViewModule, {
		ZIndex = 1,
		tag = "fill size-full-0 auto-y",
		scrollingFrameRef = p0.scrollingFrameRef,
		selection = {
			Selectable = if var11 then var11:map(function(p4) --[[ line: 68 ]]
				-- upvalues: var18 (ref)
				return var18 and p4
			end) else nil,
			NextSelectionUp = p0.NextSelectionUp,
			NextSelectionDown = p0.NextSelectionDown,
			NextSelectionLeft = p0.NextSelectionLeft,
			NextSelectionRight = p0.NextSelectionRight
		},
		scroll = {
			ScrollingEnabled = innerScrollingEnabled,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = if sheetContentHeight then var14:map(function(p5) --[[ line: 89 ]]
				return UDim2.new(1, 0, 0, p5)
			end) else UDim2.fromScale(1, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y
		},
		Size = if sheetContentHeight then UDim2.fromScale(1, 1) else nil,
		padding = {
			top = hasHeader:map(function(p6) --[[ line: 97 ]]
				-- upvalues: hasFullBleed (ref), var17 (ref), var9 (ref)
				return if p6 or hasFullBleed then UDim.new(0, 0) else UDim.new(0, if var17 then var9.Padding.Small else var9.Margin.Small)
			end),
			bottom = if var17 then actionsHeight:map(function(p7) --[[ line: 103 ]]
				-- upvalues: bottomPadding (ref), var9 (ref)
				return UDim.new(0, p7 + bottomPadding + var9.Margin.Small)
			end) else UDim.new(0, var9.Padding.Small),
			left = UDim.new(0, var9.Padding.Small),
			right = UDim.new(0, var9.Padding.Small)
		},
		ClipsDescendants = if var17 then hasHeader else true,
		onCanvasPositionChanged = function(p8) --[[ line: 111 ]]
			-- upvalues: setInnerScrollY (ref)
			setInnerScrollY(p8.CanvasPosition.Y)
		end,
		onAbsoluteCanvasSizeChanged = var13,
		onAbsoluteWindowSizeChanged = var13,
		testId = `{testId}--content`,
		ref = p1
	}, reactModule.createElement(viewModule, {
		tag = "col align-x-center gap-medium size-full-0 auto-y padding-x-medium",
		onAbsoluteSizeChanged = var16
	}, {
		FullBleedSpacer = if hasFullBleed and fullBleedHeight then reactModule.createElement(viewModule, {
			Size = fullBleedHeight:map(function(p9) --[[ line: 126 ]]
				return UDim2.new(1, 0, 0, math.max(0, p9))
			end),
			LayoutOrder = constantsModule.MIN_LAYOUT_ORDER,
			testId = `{testId}--content--full-bleed-spacer`
		}) else nil,
		Children = reactModule.createElement(reactModule.Fragment, nil, p0.children)
	}))
end))