local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local constantsModule = require(foundation.Constants)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local sheet = script:FindFirstAncestor("Sheet")
local sheetContextModule = require(sheet.SheetContext)
local sheetTypeModule = require(sheet.SheetType)
local flagsModule = require(foundation.Utility.Flags)
local scrollViewModule = require(foundation.Components.ScrollView)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local devAssertModule = require(foundation.Utility.devAssert)
local isScrollingFrameOverflowingYModule = require(foundation.Utility.isScrollingFrameOverflowingY)
local useComposedRef = reactUtilsModule.useComposedRef

local function _(a)
	return math.max(0, a.AbsoluteCanvasSize.Y - a.AbsoluteWindowSize.Y)
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokensModule (ref), reactModule (ref), sheetContextModule (ref), flagsModule (ref), devAssertModule (ref), isScrollingFrameOverflowingYModule (ref), sheetTypeModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), dashModule (ref), useComposedRef (ref), constantsModule (ref), scrollViewModule (ref)
	local var1
	local var2 = useTokensModule()
	local var3 = reactModule.useContext(sheetContextModule)
	local innerScrollingEnabled = var3.innerScrollingEnabled
	local setInnerScrollY = var3.setInnerScrollY
	local innerScrollingRef = var3.innerScrollingRef
	local actionsHeight = var3.actionsHeight
	local sheetContentHeight = var3.sheetContentHeight
	local setHasActionsDivider = var3.setHasActionsDivider
	local bottomPadding = var3.bottomPadding
	local hasHeader = var3.hasHeader
	local hasFullBleed = var3.hasFullBleed
	local fullBleedHeight = var3.fullBleedHeight
	local sheetType = var3.sheetType
	local testId = var3.testId
	assert(innerScrollingEnabled and (setInnerScrollY and (actionsHeight and (setHasActionsDivider and (bottomPadding and (hasHeader and testId))))), "SheetContent must be used within a Sheet")
	
	if flagsModule.FoundationSheetReversedContent then
		var1 = p1.isReversed == true
		var1 = nil
	else
		var1 = false
	end
	local var4 = if var1 then var3.contentRevealOffset else nil
	
	if flagsModule.FoundationSheetReversedContent then
		devAssertModule(not (var1 and hasFullBleed), "Sheet.Content with isReversed=true is unsupported when used with Sheet.FullBleed")
	end
	if flagsModule.FoundationSheetReversedContent then
		local setIsContentReversed = var3.setIsContentReversed
		reactModule.useLayoutEffect(function()
			-- upvalues: var1 (ref), setIsContentReversed (ref)
			if var1 and setIsContentReversed then
				setIsContentReversed(true)
				
				return function()
					-- upvalues: setIsContentReversed (copy)
					setIsContentReversed(false)
				end
			end
			return nil
		end, { var1, setIsContentReversed })
	end
	local var5, var6 = reactModule.useBinding(false)
	local var7 = if flagsModule.FoundationSheetReversedContent then reactModule.useRef(true) else nil
	local var8 = nil
	local var9 = nil
	
	if flagsModule.FoundationSheetReversedContent then
		local var10, var11 = reactModule.useBinding(0)
		var8 = var10
		var9 = var11
	end
	local var12 = reactModule.useCallback(function(p3)
		-- upvalues: var1 (ref), var7 (ref), setInnerScrollY (ref), isScrollingFrameOverflowingYModule (copy), var9 (write), setHasActionsDivider (ref), var6 (ref)
		if var1 and var7.current then
			p3.CanvasPosition = Vector2.new(0, math.max(0, p3.AbsoluteCanvasSize.Y - p3.AbsoluteWindowSize.Y))
		end
		setInnerScrollY(p3.CanvasPosition.Y)
		local var13 = isScrollingFrameOverflowingYModule(p3, 1)
		
		if var1 then
			var9(p3.AbsoluteWindowSize.Y)
			setHasActionsDivider(math.max(0, p3.AbsoluteCanvasSize.Y - p3.AbsoluteWindowSize.Y) - p3.CanvasPosition.Y > 1)
		else
			setHasActionsDivider(var13)
		end
		var6(var13)
	end, { var1, setHasActionsDivider, setInnerScrollY })
	local var13, var14 = reactModule.useBinding(0)
	local var15 = reactModule.useCallback(function(p3)
		-- upvalues: var14 (ref)
		var14(p3.AbsoluteSize.Y)
	end, {})
	local var16 = if var4 then var4:map(function(p3)
		return UDim2.fromOffset(0, p3)
	end) else nil
	local var17 = if var4 then reactModule.joinBindings({ windowSizeY = var8, revealOffset = var4 }):map(function(p3)
		return UDim2.new(1, 0, 0, math.max(0, p3.windowSizeY - p3.revealOffset))
	end) elseif var1 then var8:map(function(p3)
		return UDim2.new(1, 0, 0, p3)
	end) else nil
	local var18 = sheetType == sheetTypeModule.Bottom
	local var19 = if p1.isContentFullBleed then nil else UDim.new(0, var2.Padding.Small)
	local var20 = p1.Selectable == nil or p1.Selectable
	local var21 = reactModule.createElement(scrollViewModule, {
		ZIndex = 1,
		scrollingFrameRef = useComposedRef(innerScrollingRef, p1.scrollingFrameRef),
		selection = {
			Selectable = if var5 then var5:map(function(p3)
				-- upvalues: var20 (ref)
				return var20 and p3
			end) else nil,
			NextSelectionUp = p1.NextSelectionUp,
			NextSelectionDown = p1.NextSelectionDown,
			NextSelectionLeft = p1.NextSelectionLeft,
			NextSelectionRight = p1.NextSelectionRight
		},
		scroll = {
			ScrollingEnabled = innerScrollingEnabled,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = if sheetContentHeight then var13:map(function(p3)
				return UDim2.new(1, 0, 0, p3)
			end) else UDim2.fromScale(1, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y
		},
		Size = if sheetContentHeight then UDim2.fromScale(1, 1) else nil,
		Position = if var4 then var4:map(function(p3)
			return UDim2.fromOffset(0, -p3)
		end) else nil,
		padding = {
			top = hasHeader:map(function(p3)
				-- upvalues: hasFullBleed (ref), var18 (ref), var2 (ref)
				return if p3 or hasFullBleed then UDim.new(0, 0) else UDim.new(0, if var18 then var2.Padding.Small else var2.Margin.Small)
			end),
			bottom = if var18 then actionsHeight:map(function(p3)
				-- upvalues: bottomPadding (ref), var2 (ref)
				return UDim.new(0, p3 + bottomPadding + var2.Margin.Small)
			end) else UDim.new(0, var2.Padding.Small),
			left = var19,
			right = var19
		},
		ClipsDescendants = if var18 then hasHeader else true,
		onCanvasPositionChanged = function(p3)
			-- upvalues: var1 (ref), var7 (ref), setHasActionsDivider (ref), setInnerScrollY (ref)
			if var1 then
				var7.current = math.max(0, p3.AbsoluteCanvasSize.Y - p3.AbsoluteWindowSize.Y) - p3.CanvasPosition.Y <= 1
				setHasActionsDivider(not var7.current)
			end
			setInnerScrollY(p3.CanvasPosition.Y)
		end,
		onAbsoluteCanvasSizeChanged = var12,
		onAbsoluteWindowSizeChanged = var12,
		testId = `{testId}--content`,
		tag = if var4 then "size-full" else "fill size-full-0 auto-y",
		ref = p2
	}, reactModule.createElement(viewModule, {
		onAbsoluteSizeChanged = var15,
		Position = var16,
		Size = var17,
		tag = {
			["col align-x-center gap-medium size-full-0 auto-y"] = true,
			["padding-x-medium"] = not p1.isContentFullBleed,
			["align-y-bottom"] = var1
		}
	}, {
		FullBleedSpacer = if hasFullBleed and fullBleedHeight then reactModule.createElement(viewModule, {
			Size = fullBleedHeight:map(function(p3)
				return UDim2.new(1, 0, 0, math.max(0, p3))
			end),
			LayoutOrder = constantsModule.MIN_LAYOUT_ORDER,
			testId = `{testId}--content--full-bleed-spacer`
		}) else nil,
		Children = reactModule.createElement(reactModule.Fragment, nil, p1.children),
		ContentInteractionSinkContainer = reactModule.createElement("Folder", nil, {
			ContentInteractionSink = if var3.isVerticalSheetGesture then reactModule.createElement(viewModule, {
				Selectable = false,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				testId = `{testId}--content--interaction-sink`,
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				onActivated = dashModule.noop
			}) else nil
		})
	}))
	
	return if var4 then reactModule.createElement(viewModule, {
		ClipsDescendants = true,
		ZIndex = 1,
		tag = "fill size-full-0",
		testId = `{testId}--content--viewport`
	}, { ScrollView = var21 }) else var21
end))