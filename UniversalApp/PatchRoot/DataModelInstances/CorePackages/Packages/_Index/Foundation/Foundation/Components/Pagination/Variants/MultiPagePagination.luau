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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), paginationSlotsUtilsModule (ref), usePaginationNavModule (ref), usePaginationAnimatedHighlightModule (ref), paginationSizeModule (ref), chipSizeModule (ref), useChipVariantsModule (ref), chipVariantModule (ref), ellipsisModule (ref), pageNumberSlotModule (ref), viewModule (ref), paginationUtilsModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local size = var1.size
	local var2 = useTokensModule()
	local var3 = var1.page <= 1
	local var4 = var1.count <= var1.page
	local var5 = reactModule.useMemo(function()
		-- upvalues: paginationSlotsUtilsModule (copy), var1 (ref)
		return paginationSlotsUtilsModule.getVisiblePageSlots(var1.page, var1.count)
	end, { var1.page, var1.count })
	local var6, var7 = reactModule.useState(nil)
	local var8 = usePaginationNavModule(var1, {
		hasFirstLastButtons = var1.hasFirstLastButtons,
		currentPage = var1.page,
		pageSlots = var5,
		disabledState = {
			isBackDisabled = var3,
			isFirstDisabled = var3,
			isForwardDisabled = var4,
			isLastDisabled = var4
		}
	}, var7)
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var6 (ref)
		return var6
	end, { var6 })
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), paginationSlotsUtilsModule (copy), var8 (ref)
		local t = {}
		
		for i, v in var5 do
			if v ~= "ellipsis" then
				local pageSlotId = paginationSlotsUtilsModule.getPageSlotId(v)
				t[pageSlotId] = var8.selection.getSlotBindings(pageSlotId).ref
			end
		end
		return t
	end, { var5, var8.selection })
	local pageSlotId = paginationSlotsUtilsModule.getPageSlotId(var1.page)
	local var11 = usePaginationAnimatedHighlightModule(pageSlotId, var9, var10, size, var5)
	
	return var8.createLayout(reactModule.createElement(viewModule, {
		LayoutOrder = 2,
		tag = "auto-xy",
		testId = `{var11.testId}--pages`,
		ref = var9
	}, {
		ActivePageHighlight = if not paginationUtilsModule.needsWidePageSlot(var11.page) then reactModule.createElement(viewModule, {
			Active = false,
			tag = "radius-circle clip",
			ZIndex = 1,
			backgroundStyle = useChipVariantsModule(var2, if size == paginationSizeModule.Small then chipSizeModule.Small else chipSizeModule.Medium, chipVariantModule.Utility, true, false, false).chip.backgroundStyle,
			Size = reactModule.joinBindings({ var11.highlightWidth, var11.activeItemHeight }):map(function(p3)
				return UDim2.fromOffset(p3[1], p3[2])
			end),
			Position = var11.highlightPosition:map(function(p3)
				return UDim2.fromOffset(p3, 0)
			end),
			Visible = var11.isVisible,
			selection = { Selectable = false },
			testId = `{var11.testId}--active-page-highlight`
		}) else nil,
		PagesRow = reactModule.createElement(viewModule, {
			tag = "row gap-xsmall auto-xy",
			LayoutOrder = 1,
			ZIndex = 2,
			onAbsoluteSizeChanged = reactModule.useCallback(function()
				-- upvalues: var10 (ref), pageSlotId (ref), var9 (ref), var11 (ref)
				local var12 = var10[pageSlotId]
				
				if var12 and var12.current and var9.current then
					var12.updateHighlight(var12, true)
				end
			end, { pageSlotId, var10, var11.updateHighlight })
		}, reactModule.useMemo(function()
			-- upvalues: var5 (ref), reactModule (copy), ellipsisModule (copy), size (ref), var11 (ref), paginationSlotsUtilsModule (copy), var8 (ref), pageNumberSlotModule (copy)
			local t = {}
			
			for i, v in var5 do
				if v == "ellipsis" then
					t[if i == 2 then "ellipsis-leading" else "ellipsis-trailing"] = reactModule.createElement(ellipsisModule, {
						slotSize = size,
						LayoutOrder = i,
						testId = `{var11.testId}--ellipsis-{i}`
					})
				else
					local pageSlotId = paginationSlotsUtilsModule.getPageSlotId(v)
					local slotBindings = var8.selection.getSlotBindings(pageSlotId)
					t[`Page-{v}`] = reactModule.createElement(pageNumberSlotModule, {
						slotSize = size,
						isChecked = v == var11.page,
						LayoutOrder = i,
						onPageActivated = var11.onActivated,
						page = v,
						testId = `{var11.testId}--page-{v}`,
						ref = var8.selection.getSlotRef(pageSlotId),
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
			var5, var11.page, size, var11.testId, var11.onActivated, var8.selection
		}))
	}), nil)
end))