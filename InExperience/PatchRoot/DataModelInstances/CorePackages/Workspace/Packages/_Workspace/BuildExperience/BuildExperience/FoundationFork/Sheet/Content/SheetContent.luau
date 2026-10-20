local Foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local ReactModule = require(Foundation.Parent.React)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local ConstantsModule = require(Foundation.Constants)
local Sheet = script:FindFirstAncestor("Sheet")
local SheetContextModule = require(Sheet.SheetContext)
local SheetTypeModule = require(Sheet.SheetType)
local ScrollViewModule = require(Foundation.Components.ScrollView)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local IsScrollingFrameOverflowingYModule = require(Foundation.Utility.isScrollingFrameOverflowingY)

return ReactModule.memo(ReactModule.forwardRef(function(Gui, Ref)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), SheetContextModule (copy), IsScrollingFrameOverflowingYModule (copy), SheetTypeModule (copy), ScrollViewModule (copy), ViewModule (copy), ConstantsModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UseContextResult = ReactModule.useContext(SheetContextModule)
	local InnerScrollingEnabled = UseContextResult.innerScrollingEnabled
	local SetInnerScrollYFunction = UseContextResult.setInnerScrollY
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
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local UseResult = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: SetInnerScrollYFunction (copy), IsScrollingFrameOverflowingYModule (upval), SetHasActionsDividerFunction (copy), UseBindingResult2 (copy)
		SetInnerScrollYFunction(ScrollFrame.CanvasPosition.Y)
		local IsScrollingFrameOverflowingYModule1 = IsScrollingFrameOverflowingYModule(ScrollFrame, 1)
		SetHasActionsDividerFunction(IsScrollingFrameOverflowingYModule1)
		UseBindingResult2(IsScrollingFrameOverflowingYModule1)
	end, { SetHasActionsDividerFunction, SetInnerScrollYFunction })
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local IsSheetTypeMatch = SheetType == SheetTypeModule.Bottom
	local NoSelectable = Gui.Selectable == nil or Gui.Selectable
	
	return ReactModule.createElement(ScrollViewModule, {
		ZIndex = 1,
		tag = "fill size-full-0 auto-y",
		scrollingFrameRef = Gui.scrollingFrameRef,
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
		padding = {
			top = HasHeader:map(function(p1): UDim
				-- upvalues: HasFullBleed (copy), IsSheetTypeMatch (copy), UseTokensModuleResult (copy)
				return if p1 or HasFullBleed then UDim.new(0, 0) else UDim.new(0, if IsSheetTypeMatch then UseTokensModuleResult.Padding.Small else UseTokensModuleResult.Margin.Small)
			end),
			bottom = if IsSheetTypeMatch then ActionsHeight:map(function(p1): UDim
				-- upvalues: BottomPadding (copy), UseTokensModuleResult (copy)
				return UDim.new(0, p1 + BottomPadding + UseTokensModuleResult.Margin.Small)
			end) else UDim.new(0, UseTokensModuleResult.Padding.Small),
			left = UDim.new(0, UseTokensModuleResult.Padding.Small),
			right = UDim.new(0, UseTokensModuleResult.Padding.Small)
		},
		ClipsDescendants = not IsSheetTypeMatch or HasHeader,
		onCanvasPositionChanged = function(ScrollFrame)
			-- upvalues: SetInnerScrollYFunction (copy)
			SetInnerScrollYFunction(ScrollFrame.CanvasPosition.Y)
		end,
		onAbsoluteCanvasSizeChanged = UseResult,
		onAbsoluteWindowSizeChanged = UseResult,
		testId = `{TestId}--content`,
		ref = Ref
	}, ReactModule.createElement(ViewModule, {
		tag = "col align-x-center gap-medium size-full-0 auto-y padding-x-medium",
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
			-- upvalues: UseBindingResult2_1 (copy)
			UseBindingResult2_1(Frame.AbsoluteSize.Y)
		end, {})
	}, {
		FullBleedSpacer = if HasFullBleed and FullBleedHeight then ReactModule.createElement(ViewModule, {
			Size = FullBleedHeight:map(function(p1: number): UDim2
				return UDim2.new(1, 0, 0, (math.max(0, p1)))
			end),
			LayoutOrder = ConstantsModule.MIN_LAYOUT_ORDER,
			testId = `{TestId}--content--full-bleed-spacer`
		}) else nil,
		Children = ReactModule.createElement(ReactModule.Fragment, nil, Gui.children)
	}))
end))