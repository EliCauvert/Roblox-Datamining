local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useChipVariantsModule = require(foundation.Components.Chip.useChipVariants)
local chipSizeModule = require(foundation.Enums.ChipSize)
local chipVariantModule = require(foundation.Enums.ChipVariant)
local paginationSizeModule = require(foundation.Enums.PaginationSize)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local ellipsisModule = require(script.Parent.Parent.Nav.Ellipsis)
local pageNumberSlotModule = require(script.Parent.Parent.Nav.PageNumberSlot)
local paginationSlotsUtilsModule = require(script.Parent.Parent.paginationSlotsUtils)
local paginationUtilsModule = require(script.Parent.Parent.paginationUtils)
local usePaginationAnimatedHighlightModule = require(script.Parent.Parent.usePaginationAnimatedHighlight)
local usePaginationNavModule = require(script.Parent.Parent.usePaginationNav)
local t = {
	hasFirstLastButtons = false,
	testId = "--foundation-pagination",
	size = paginationSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), paginationSlotsUtilsModule (ref), usePaginationNavModule (ref), usePaginationAnimatedHighlightModule (ref), paginationSizeModule (ref), chipSizeModule (ref), useChipVariantsModule (ref), chipVariantModule (ref), ellipsisModule (ref), pageNumberSlotModule (ref), viewModule (ref), paginationUtilsModule (ref)
	local var16 = withDefaultsModule(p0, t)
	local size = var16.size
	local var17 = useTokensModule()
	local var18 = var16.page <= 1
	local var19 = var16.count <= var16.page
	local var20 = reactModule.useMemo(function()
		-- upvalues: paginationSlotsUtilsModule (copy), var16 (ref)
		return paginationSlotsUtilsModule.getVisiblePageSlots(var16.page, var16.count)
	end, { var16.page, var16.count })
	local var21, var22 = reactModule.useState(nil)
	local var23 = usePaginationNavModule(var16, {
		hasFirstLastButtons = var16.hasFirstLastButtons,
		currentPage = var16.page,
		pageSlots = var20,
		disabledState = {
			isBackDisabled = var18,
			isFirstDisabled = var18,
			isForwardDisabled = var19,
			isLastDisabled = var19
		}
	}, var22)
	reactModule.useImperativeHandle(p1, function()
		-- upvalues: var21 (ref)
		return var21
	end, { var21 })
	local var24 = reactModule.useRef(nil)
	local var25 = reactModule.useMemo(function()
		-- upvalues: var20 (ref), paginationSlotsUtilsModule (copy), var23 (ref)
		local t = {}
		
		for i, v in var20 do
			if v ~= "ellipsis" then
				local pageSlotId = paginationSlotsUtilsModule.getPageSlotId(v)
				t[pageSlotId] = var23.selection.getSlotBindings(pageSlotId).ref
			end
		end
		return t
	end, { var20, var23.selection })
	local pageSlotId = paginationSlotsUtilsModule.getPageSlotId(var16.page)
	local var27 = usePaginationAnimatedHighlightModule(pageSlotId, var24, var25, size, var20)
	
	return var23.createLayout(reactModule.createElement(viewModule, {
		LayoutOrder = 2,
		tag = "auto-xy",
		testId = `{var16.testId}--pages`,
		ref = var24
	}, {
		ActivePageHighlight = if not paginationUtilsModule.needsWidePageSlot(var16.page) then reactModule.createElement(viewModule, {
			Active = false,
			tag = "radius-circle clip",
			ZIndex = 1,
			backgroundStyle = useChipVariantsModule(var17, if size == paginationSizeModule.Small then chipSizeModule.Small else chipSizeModule.Medium, chipVariantModule.Utility, true, false, false).chip.backgroundStyle,
			Size = reactModule.joinBindings({ var27.highlightWidth, var27.activeItemHeight }):map(function(p2)
				return UDim2.fromOffset(p2[1], p2[2])
			end),
			Position = var27.highlightPosition:map(function(p3)
				return UDim2.fromOffset(p3, 0)
			end),
			Visible = var27.isVisible,
			selection = { Selectable = false },
			testId = `{var16.testId}--active-page-highlight`
		}) else nil,
		PagesRow = reactModule.createElement(viewModule, {
			tag = "row gap-xsmall auto-xy",
			LayoutOrder = 1,
			ZIndex = 2,
			onAbsoluteSizeChanged = reactModule.useCallback(function()
				-- upvalues: var25 (ref), pageSlotId (ref), var24 (ref), var27 (ref)
				local var30 = var25[pageSlotId]
				
				if var30 and var30.current and var24.current then
					var27.updateHighlight(var30, true)
				end
			end, { pageSlotId, var25, var27.updateHighlight })
		}, reactModule.useMemo(function()
			-- upvalues: var20 (ref), reactModule (copy), ellipsisModule (copy), size (ref), var16 (ref), paginationSlotsUtilsModule (copy), var23 (ref), pageNumberSlotModule (copy)
			local t = {}
			
			for i, v in var20 do
				if v == "ellipsis" then
					t[if i == 2 then "ellipsis-leading" else "ellipsis-trailing"] = reactModule.createElement(ellipsisModule, {
						slotSize = size,
						LayoutOrder = i,
						testId = `{var16.testId}--ellipsis-{i}`
					})
				else
					local pageSlotId = paginationSlotsUtilsModule.getPageSlotId(v)
					local slotBindings = var23.selection.getSlotBindings(pageSlotId)
					t[`Page-{v}`] = reactModule.createElement(pageNumberSlotModule, {
						slotSize = size,
						isChecked = v == var16.page,
						LayoutOrder = i,
						onPageActivated = var16.onActivated,
						page = v,
						testId = `{var16.testId}--page-{v}`,
						ref = var23.selection.getSlotRef(pageSlotId),
						Selectable = slotBindings.Selectable,
						NextSelectionLeft = slotBindings.NextSelectionLeft,
						NextSelectionRight = slotBindings.NextSelectionRight,
						NextSelectionUp = slotBindings.NextSelectionUp,
						NextSelectionDown = slotBindings.NextSelectionDown
					})
				end
			end
			return t
		end, {
			var20, var16.page, size, var16.testId, var16.onActivated, var23.selection
		}))
	}), nil)
end))