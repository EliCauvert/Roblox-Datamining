local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local ConstantsModule = require(Foundation.Constants)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local Sheet = script:FindFirstAncestor("Sheet")
local SheetContextModule = require(Sheet.SheetContext)
local SheetTypeModule = require(Sheet.SheetType)
local FlagsModule = require(Foundation.Utility.Flags)
local ScrollViewModule = require(Foundation.Components.ScrollView)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local DevAssertModule = require(Foundation.Utility.devAssert)
local IsScrollingFrameOverflowingYModule = require(Foundation.Utility.isScrollingFrameOverflowingY)
local UseComposedRefFunction = require(Parent.ReactUtils).useComposedRef

local function _(ScrollFrame): number
	return (math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y))
end

return ReactModule.memo(ReactModule.forwardRef(function(Gui, Ref)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), SheetContextModule (copy), FlagsModule (copy), DevAssertModule (copy), IsScrollingFrameOverflowingYModule (copy), SheetTypeModule (copy), ViewModule (copy), StateLayerAffordanceModule (copy), DashModule (copy), UseComposedRefFunction (copy), ConstantsModule (copy), ScrollViewModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UseContextResult = ReactModule.useContext(SheetContextModule)
	local InnerScrollingEnabled = UseContextResult.innerScrollingEnabled
	local SetInnerScrollYFunction = UseContextResult.setInnerScrollY
	local InnerScrollingRef = UseContextResult.innerScrollingRef
	local ActionsHeight = UseContextResult.actionsHeight
	local SheetContentHeight = UseContextResult.sheetContentHeight
	local SetHasActionsDividerFunction = UseContextResult.setHasActionsDivider
	local BottomPadding = UseContextResult.bottomPadding
	local HasHeader = UseContextResult.hasHeader
	local HasFullBleed = UseContextResult.hasFullBleed
	local FullBleedHeight = UseContextResult.fullBleedHeight
	local SheetType = UseContextResult.sheetType
	local TestId = UseContextResult.testId
	assert(InnerScrollingEnabled and (SetInnerScrollYFunction and (ActionsHeight and (SetHasActionsDividerFunction and (BottomPadding and (HasHeader and TestId))))), "SheetContent must be used within a Sheet")
	local IsIsReversed: boolean = if FlagsModule.FoundationSheetReversedContent then Gui.isReversed == true else false
	local ContentRevealOffset = if IsIsReversed then UseContextResult.contentRevealOffset else nil
	
	if FlagsModule.FoundationSheetReversedContent then
		DevAssertModule(not (IsIsReversed and HasFullBleed), "Sheet.Content with isReversed=true is unsupported when used with Sheet.FullBleed")
	end
	if FlagsModule.FoundationSheetReversedContent then
		local SetIsContentReversedFunction = UseContextResult.setIsContentReversed
		ReactModule.useLayoutEffect(function()
			-- upvalues: IsIsReversed (copy), SetIsContentReversedFunction (copy)
			if IsIsReversed and SetIsContentReversedFunction then
				SetIsContentReversedFunction(true)
				
				return function()
					-- upvalues: SetIsContentReversedFunction (upval)
					SetIsContentReversedFunction(false)
				end
			else
				return nil
			end
		end, { IsIsReversed, SetIsContentReversedFunction })
	end
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local UseRefResult = if FlagsModule.FoundationSheetReversedContent then ReactModule.useRef(true) else nil
	local WindowSizeY = nil
	local Callback = nil
	
	if FlagsModule.FoundationSheetReversedContent then
		WindowSizeY, Callback = ReactModule.useBinding(0)
	end
	local UseResult = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: IsIsReversed (copy), UseRefResult (copy), SetInnerScrollYFunction (copy), IsScrollingFrameOverflowingYModule (upval), Callback (ref), SetHasActionsDividerFunction (copy), UseBindingResult2 (copy)
		if IsIsReversed and UseRefResult.current then
			ScrollFrame.CanvasPosition = Vector2.new(0, (math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y)))
		end
		SetInnerScrollYFunction(ScrollFrame.CanvasPosition.Y)
		local IsScrollingFrameOverflowingYModule1 = IsScrollingFrameOverflowingYModule(ScrollFrame, 1)
		
		if IsIsReversed then
			Callback(ScrollFrame.AbsoluteWindowSize.Y)
			SetHasActionsDividerFunction(math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y) - ScrollFrame.CanvasPosition.Y > 1)
		else
			SetHasActionsDividerFunction(IsScrollingFrameOverflowingYModule1)
		end
		UseBindingResult2(IsScrollingFrameOverflowingYModule1)
	end, {
		IsIsReversed,
		SetHasActionsDividerFunction,
		SetInnerScrollYFunction
	})
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local IsSheetTypeMatch = SheetType == SheetTypeModule.Bottom
	local _UDim = if Gui.isContentFullBleed then nil else UDim.new(0, UseTokensModuleResult.Padding.Small)
	local NoSelectable = Gui.Selectable == nil or Gui.Selectable
	local Element = ReactModule.createElement(ScrollViewModule, {
		ZIndex = 1,
		scrollingFrameRef = UseComposedRefFunction(InnerScrollingRef, Gui.scrollingFrameRef),
		selection = {
			Selectable = if UseBindingResult then UseBindingResult:map(function(p1)
				-- upvalues: NoSelectable (copy)
				return NoSelectable and p1
			end) else nil,
			NextSelectionUp = Gui.NextSelectionUp,
			NextSelectionDown = Gui.NextSelectionDown,
			NextSelectionLeft = Gui.NextSelectionLeft,
			NextSelectionRight = Gui.NextSelectionRight
		},
		scroll = {
			ScrollingEnabled = InnerScrollingEnabled,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = if SheetContentHeight then UseBindingResult1:map(function(YOffset): UDim2
				return UDim2.new(1, 0, 0, YOffset)
			end) else UDim2.fromScale(1, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y
		},
		Size = if SheetContentHeight then UDim2.fromScale(1, 1) else nil,
		Position = if ContentRevealOffset then ContentRevealOffset:map(function(p1): UDim2
			return UDim2.fromOffset(0, -p1)
		end) else nil,
		padding = {
			top = HasHeader:map(function(p1): UDim
				-- upvalues: HasFullBleed (copy), IsSheetTypeMatch (copy), UseTokensModuleResult (copy)
				return if p1 or HasFullBleed then UDim.new(0, 0) else UDim.new(0, if IsSheetTypeMatch then UseTokensModuleResult.Padding.Small else UseTokensModuleResult.Margin.Small)
			end),
			bottom = if IsSheetTypeMatch then ActionsHeight:map(function(p1): UDim
				-- upvalues: BottomPadding (copy), UseTokensModuleResult (copy)
				return UDim.new(0, p1 + BottomPadding + UseTokensModuleResult.Margin.Small)
			end) else UDim.new(0, UseTokensModuleResult.Padding.Small),
			left = _UDim,
			right = _UDim
		},
		ClipsDescendants = not IsSheetTypeMatch or HasHeader,
		onCanvasPositionChanged = function(ScrollFrame)
			-- upvalues: IsIsReversed (copy), UseRefResult (copy), SetHasActionsDividerFunction (copy), SetInnerScrollYFunction (copy)
			if IsIsReversed then
				UseRefResult.current = math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y) - ScrollFrame.CanvasPosition.Y <= 1
				SetHasActionsDividerFunction(not UseRefResult.current)
			end
			SetInnerScrollYFunction(ScrollFrame.CanvasPosition.Y)
		end,
		onAbsoluteCanvasSizeChanged = UseResult,
		onAbsoluteWindowSizeChanged = UseResult,
		testId = `{TestId}--content`,
		tag = if ContentRevealOffset then "size-full" else "fill size-full-0 auto-y",
		ref = Ref
	}, (ReactModule.createElement(ViewModule, {
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
			-- upvalues: UseBindingResult2_1 (copy)
			UseBindingResult2_1(Frame.AbsoluteSize.Y)
		end, {}),
		Position = if ContentRevealOffset then ContentRevealOffset:map(function(YOffset): UDim2
			return UDim2.fromOffset(0, YOffset)
		end) else nil,
		Size = if ContentRevealOffset then ReactModule.joinBindings({
			windowSizeY = WindowSizeY,
			revealOffset = ContentRevealOffset
		}):map(function(p1): UDim2
			return UDim2.new(1, 0, 0, (math.max(0, p1.windowSizeY - p1.revealOffset)))
		end) elseif IsIsReversed then WindowSizeY:map(function(YOffset): UDim2
			return UDim2.new(1, 0, 0, YOffset)
		end) else nil,
		tag = {
			["col align-x-center gap-medium size-full-0 auto-y"] = true,
			["padding-x-medium"] = not Gui.isContentFullBleed,
			["align-y-bottom"] = IsIsReversed
		}
	}, {
		FullBleedSpacer = if HasFullBleed and FullBleedHeight then ReactModule.createElement(ViewModule, {
			Size = FullBleedHeight:map(function(p1: number): UDim2
				return UDim2.new(1, 0, 0, (math.max(0, p1)))
			end),
			LayoutOrder = ConstantsModule.MIN_LAYOUT_ORDER,
			testId = `{TestId}--content--full-bleed-spacer`
		}) else nil,
		Children = ReactModule.createElement(ReactModule.Fragment, nil, Gui.children),
		ContentInteractionSinkContainer = ReactModule.createElement("Folder", nil, {
			ContentInteractionSink = if UseContextResult.isVerticalSheetGesture then ReactModule.createElement(ViewModule, {
				Selectable = false,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				testId = `{TestId}--content--interaction-sink`,
				stateLayer = { affordance = StateLayerAffordanceModule.None },
				onActivated = DashModule.noop
			}) else nil
		})
	})))
	
	return if ContentRevealOffset then ReactModule.createElement(ViewModule, {
		ClipsDescendants = true,
		ZIndex = 1,
		tag = "fill size-full-0",
		testId = `{TestId}--content--viewport`
	}, { ScrollView = Element }) else Element
end))