local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local chipModule = require(foundation.Components.Chip)
local textModule = require(foundation.Components.Text)
local viewModule = require(foundation.Components.View)
local chipSizeModule = require(foundation.Enums.ChipSize)
local chipVariantModule = require(foundation.Enums.ChipVariant)
local paginationSizeModule = require(foundation.Enums.PaginationSize)
local paginationVariantModule = require(foundation.Enums.PaginationVariant)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local _ = require(script.Parent.MultiPagePagination)
local paginationUtilsModule = require(script.Parent.Parent.paginationUtils)
local usePaginationNavModule = require(script.Parent.Parent.usePaginationNav)
local t = {
	testId = "--foundation-pagination",
	size = paginationSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), paginationVariantModule (ref), reactModule (ref), usePaginationNavModule (ref), paginationUtilsModule (ref), chipModule (ref), paginationSizeModule (ref), chipSizeModule (ref), chipVariantModule (ref), viewModule (ref), textModule (ref)
	local var1
	local var2 = withDefaultsModule(p1, t)
	local size = var2.size
	local count = var2.count
	local var3 = count ~= nil and var2.hasFirstLastButtons == true
	local var4 = var2.variant == paginationVariantModule.SinglePage
	
	if var2.hasPreviousPage == nil then
		var1 = var2.page <= 1
	else
		var1 = var2.hasPreviousPage ~= true
		var1 = nil
	end
	local var5
	if count ~= nil then
		local _ = count <= var2.page
	elseif var2.hasNextPage == nil then
		var5 = true
	else
		var5 = var2.hasNextPage ~= true
		var5 = nil
	end
	local var6, var7 = reactModule.useState(nil)
	local var8 = usePaginationNavModule(var2, {
		hasFirstLastButtons = var3,
		currentPage = var2.page,
		disabledState = {
			isBackDisabled = var1,
			isFirstDisabled = var1,
			isForwardDisabled = var5,
			isLastDisabled = var5
		}
	}, var7)
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var6 (ref)
		return var6
	end, { var6 })
	
	return var8.createLayout(reactModule.useMemo(function()
		-- upvalues: var4 (ref), var2 (ref), paginationUtilsModule (copy), reactModule (copy), chipModule (copy), size (ref), paginationSizeModule (copy), chipSizeModule (copy), chipVariantModule (copy), viewModule (copy), textModule (copy)
		if not var4 then
			return nil
		end
		local var9 = tostring(var2.page)
		
		return if paginationUtilsModule.needsWidePageSlot(var2.page) then reactModule.createElement(chipModule, {
			LayoutOrder = 2,
			isChecked = false,
			isDisabled = true,
			onActivated = function() end,
			size = if size == paginationSizeModule.Small then chipSizeModule.Small else chipSizeModule.Medium,
			testId = `{var2.testId}--page-label`,
			text = var9,
			variant = chipVariantModule.Utility
		}) else reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = paginationUtilsModule.getCircularSlotTag(size),
			testId = `{var2.testId}--page-label`
		}, {
			Text = reactModule.createElement(textModule, {
				LayoutOrder = 1,
				Text = var9,
				tag = paginationUtilsModule.getPageLabelTag(size)
			})
		})
	end, { var4, var2.page, size, var2.testId }))
end))