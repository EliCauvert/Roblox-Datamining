local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseChipVariantsModule = require(Foundation.Components.Chip.useChipVariants)
local ChipSizeModule = require(Foundation.Enums.ChipSize)
local ChipVariantModule = require(Foundation.Enums.ChipVariant)
local PaginationSizeModule = require(Foundation.Enums.PaginationSize)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local EllipsisModule = require(script.Parent.Parent.Nav.Ellipsis)
local PageNumberSlotModule = require(script.Parent.Parent.Nav.PageNumberSlot)
local PaginationSlotsUtilsModule = require(script.Parent.Parent.paginationSlotsUtils)
local PaginationUtilsModule = require(script.Parent.Parent.paginationUtils)
local UsePaginationAnimatedHighlightModule = require(script.Parent.Parent.usePaginationAnimatedHighlight)
local UsePaginationNavModule = require(script.Parent.Parent.usePaginationNav)
local config = {
	hasFirstLastButtons = false,
	testId = "--foundation-pagination",
	size = PaginationSizeModule.Medium
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2) --[[ Line: 44 | Named "MultiPagePagination" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), PaginationSlotsUtilsModule (copy), UsePaginationNavModule (copy), UsePaginationAnimatedHighlightModule (copy), PaginationSizeModule (copy), ChipSizeModule (copy), UseChipVariantsModule (copy), ChipVariantModule (copy), EllipsisModule (copy), PageNumberSlotModule (copy), ViewModule (copy), PaginationUtilsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local Size = WithDefaultsModuleResult.size
	local UseTokensModuleResult = UseTokensModule()
	local IsPageBelow = WithDefaultsModuleResult.page <= 1
	local IsCountBelow = WithDefaultsModuleResult.count <= WithDefaultsModuleResult.page
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 52 ]]
		-- upvalues: PaginationSlotsUtilsModule (upval), WithDefaultsModuleResult (copy)
		return PaginationSlotsUtilsModule.getVisiblePageSlots(WithDefaultsModuleResult.page, WithDefaultsModuleResult.count)
	end, {
		WithDefaultsModuleResult.page,
		WithDefaultsModuleResult.count
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UsePaginationNavModuleResult = UsePaginationNavModule(WithDefaultsModuleResult, {
		hasFirstLastButtons = WithDefaultsModuleResult.hasFirstLastButtons,
		currentPage = WithDefaultsModuleResult.page,
		pageSlots = UseMemoResult,
		disabledState = {
			isBackDisabled = IsPageBelow,
			isFirstDisabled = IsPageBelow,
			isForwardDisabled = IsCountBelow,
			isLastDisabled = IsCountBelow
		}
	}, UseStateResult2)
	ReactModule.useImperativeHandle(p2, function() --[[ Line: 70 ]]
		-- upvalues: UseStateResult (copy)
		return UseStateResult
	end, { UseStateResult })
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 76 ]]
		-- upvalues: UseMemoResult (copy), PaginationSlotsUtilsModule (upval), UsePaginationNavModuleResult (copy)
		local Refs = {}
		
		for _, value in UseMemoResult do
			if value ~= "ellipsis" then
				local PageSlotId = PaginationSlotsUtilsModule.getPageSlotId(value)
				Refs[PageSlotId] = UsePaginationNavModuleResult.selection.getSlotBindings(PageSlotId).ref
			end
		end
		return Refs
	end, { UseMemoResult, UsePaginationNavModuleResult.selection })
	local PageSlotId = PaginationSlotsUtilsModule.getPageSlotId(WithDefaultsModuleResult.page)
	local UsePaginationAnimatedHighlightModuleResult = UsePaginationAnimatedHighlightModule(PageSlotId, UseRefResult, UseMemoResult1, Size, UseMemoResult)
	local UseChipVariantsModuleResult = UseChipVariantsModule(UseTokensModuleResult, if Size == PaginationSizeModule.Small then ChipSizeModule.Small else ChipSizeModule.Medium, ChipVariantModule.Utility, true, false, false)
	
	return UsePaginationNavModuleResult.createLayout(ReactModule.createElement(ViewModule, {
		LayoutOrder = 2,
		tag = "auto-xy",
		testId = `{WithDefaultsModuleResult.testId}--pages`,
		ref = UseRefResult
	}, {
		ActivePageHighlight = if PaginationUtilsModule.needsWidePageSlot(WithDefaultsModuleResult.page) then nil else ReactModule.createElement(ViewModule, {
			Active = false,
			tag = "radius-circle clip",
			ZIndex = 1,
			backgroundStyle = UseChipVariantsModuleResult.chip.backgroundStyle,
			Size = ReactModule.joinBindings({
				UsePaginationAnimatedHighlightModuleResult.highlightWidth,
				UsePaginationAnimatedHighlightModuleResult.activeItemHeight
			}):map(function(Entry): UDim2 --[[ Line: 158 ]]
				return UDim2.fromOffset(Entry[1], Entry[2])
			end),
			Position = UsePaginationAnimatedHighlightModuleResult.highlightPosition:map(function(XOffset): UDim2 --[[ Line: 161 ]]
				return UDim2.fromOffset(XOffset, 0)
			end),
			Visible = UsePaginationAnimatedHighlightModuleResult.isVisible,
			selection = { Selectable = false },
			testId = `{WithDefaultsModuleResult.testId}--active-page-highlight`
		}),
		PagesRow = ReactModule.createElement(ViewModule, {
			tag = "row gap-xsmall auto-xy",
			LayoutOrder = 1,
			ZIndex = 2,
			onAbsoluteSizeChanged = ReactModule.useCallback(function() --[[ Line: 138 ]]
				-- upvalues: UseMemoResult1 (copy), PageSlotId (copy), UseRefResult (copy), UsePaginationAnimatedHighlightModuleResult (copy)
				local UseMemoResultEntry = UseMemoResult1[PageSlotId]
				
				if UseMemoResultEntry and UseMemoResultEntry.current and UseRefResult.current then
					UsePaginationAnimatedHighlightModuleResult.updateHighlight(UseMemoResultEntry, true)
				end
			end, {
				PageSlotId,
				UseMemoResult1,
				UsePaginationAnimatedHighlightModuleResult.updateHighlight
			})
		}, (ReactModule.useMemo(function() --[[ Line: 94 ]]
			-- upvalues: UseMemoResult (copy), ReactModule (upval), EllipsisModule (upval), Size (copy), WithDefaultsModuleResult (copy), PaginationSlotsUtilsModule (upval), UsePaginationNavModuleResult (copy), PageNumberSlotModule (upval)
			local Elements = {}
			
			for LayoutOrder, Page in UseMemoResult do
				if Page == "ellipsis" then
					Elements[if LayoutOrder == 2 then "ellipsis-leading" else "ellipsis-trailing"] = ReactModule.createElement(EllipsisModule, {
						slotSize = Size,
						LayoutOrder = LayoutOrder,
						testId = `{WithDefaultsModuleResult.testId}--ellipsis-{LayoutOrder}`
					})
				else
					local PageSlotId = PaginationSlotsUtilsModule.getPageSlotId(Page)
					local SlotBindings = UsePaginationNavModuleResult.selection.getSlotBindings(PageSlotId)
					Elements[`Page-{Page}`] = ReactModule.createElement(PageNumberSlotModule, {
						slotSize = Size,
						isChecked = Page == WithDefaultsModuleResult.page,
						LayoutOrder = LayoutOrder,
						onPageActivated = WithDefaultsModuleResult.onActivated,
						page = Page,
						testId = `{WithDefaultsModuleResult.testId}--page-{Page}`,
						ref = UsePaginationNavModuleResult.selection.getSlotRef(PageSlotId),
						Selectable = SlotBindings.Selectable,
						NextSelectionLeft = SlotBindings.NextSelectionLeft,
						NextSelectionRight = SlotBindings.NextSelectionRight,
						NextSelectionUp = SlotBindings.NextSelectionUp,
						NextSelectionDown = SlotBindings.NextSelectionDown
					})
				end
			end
			return Elements
		end, {
			UseMemoResult, WithDefaultsModuleResult.page, Size,
			WithDefaultsModuleResult.testId, WithDefaultsModuleResult.onActivated,
			UsePaginationNavModuleResult.selection
		})))
	}), nil)
end))