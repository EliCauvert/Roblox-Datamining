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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokensModule (ref), reactModule (ref), sheetContextModule (ref), isScrollingFrameOverflowingYModule (ref), sheetTypeModule (ref), scrollViewModule (ref), viewModule (ref), constantsModule (ref)
	local var1 = useTokensModule()
	local var2 = reactModule.useContext(sheetContextModule)
	local innerScrollingEnabled = var2.innerScrollingEnabled
	local setInnerScrollY = var2.setInnerScrollY
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
	local var5 = reactModule.useCallback(function(p3)
		-- upvalues: setInnerScrollY (ref), isScrollingFrameOverflowingYModule (copy), setHasActionsDivider (ref), var4 (ref)
		setInnerScrollY(p3.CanvasPosition.Y)
		local var6 = isScrollingFrameOverflowingYModule(p3, 1)
		setHasActionsDivider(var6)
		var4(var6)
	end, { setHasActionsDivider, setInnerScrollY })
	local var6, var7 = reactModule.useBinding(0)
	local var8 = reactModule.useCallback(function(p3)
		-- upvalues: var7 (ref)
		var7(p3.AbsoluteSize.Y)
	end, {})
	local var9 = sheetType == sheetTypeModule.Bottom
	local var10 = p1.Selectable == nil or p1.Selectable
	
	return reactModule.createElement(scrollViewModule, {
		ZIndex = 1,
		tag = "fill size-full-0 auto-y",
		scrollingFrameRef = p1.scrollingFrameRef,
		selection = {
			Selectable = if var3 then var3:map(function(p3)
				-- upvalues: var10 (ref)
				return var10 and p3
			end) else nil,
			NextSelectionUp = p1.NextSelectionUp,
			NextSelectionDown = p1.NextSelectionDown,
			NextSelectionLeft = p1.NextSelectionLeft,
			NextSelectionRight = p1.NextSelectionRight
		},
		scroll = {
			ScrollingEnabled = innerScrollingEnabled,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = if sheetContentHeight then var6:map(function(p3)
				return UDim2.new(1, 0, 0, p3)
			end) else UDim2.fromScale(1, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y
		},
		Size = if sheetContentHeight then UDim2.fromScale(1, 1) else nil,
		padding = {
			top = hasHeader:map(function(p3)
				-- upvalues: hasFullBleed (ref), var9 (ref), var1 (ref)
				return if p3 or hasFullBleed then UDim.new(0, 0) else UDim.new(0, if var9 then var1.Padding.Small else var1.Margin.Small)
			end),
			bottom = if var9 then actionsHeight:map(function(p3)
				-- upvalues: bottomPadding (ref), var1 (ref)
				return UDim.new(0, p3 + bottomPadding + var1.Margin.Small)
			end) else UDim.new(0, var1.Padding.Small),
			left = UDim.new(0, var1.Padding.Small),
			right = UDim.new(0, var1.Padding.Small)
		},
		ClipsDescendants = if var9 then hasHeader else true,
		onCanvasPositionChanged = function(p3)
			-- upvalues: setInnerScrollY (ref)
			setInnerScrollY(p3.CanvasPosition.Y)
		end,
		onAbsoluteCanvasSizeChanged = var5,
		onAbsoluteWindowSizeChanged = var5,
		testId = `{testId}--content`,
		ref = p2
	}, reactModule.createElement(viewModule, {
		tag = "col align-x-center gap-medium size-full-0 auto-y padding-x-medium",
		onAbsoluteSizeChanged = var8
	}, {
		FullBleedSpacer = if hasFullBleed and fullBleedHeight then reactModule.createElement(viewModule, {
			Size = fullBleedHeight:map(function(p3)
				return UDim2.new(1, 0, 0, math.max(0, p3))
			end),
			LayoutOrder = constantsModule.MIN_LAYOUT_ORDER,
			testId = `{testId}--content--full-bleed-spacer`
		}) else nil,
		Children = reactModule.createElement(reactModule.Fragment, nil, p1.children)
	}))
end))