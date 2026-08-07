-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:06 2026 Pacific Standard Time.

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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 37 | named "DirectionalPagination" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), paginationVariantModule (ref), reactModule (ref), usePaginationNavModule (ref), paginationUtilsModule (ref), chipModule (ref), paginationSizeModule (ref), chipSizeModule (ref), chipVariantModule (ref), viewModule (ref), textModule (ref)
	local var16
	local var13 = withDefaultsModule(p0, t)
	local size = var13.size
	local count = var13.count
	local var14 = count ~= nil and var13.hasFirstLastButtons == true
	local var15 = var13.variant == paginationVariantModule.SinglePage
	
	if var13.hasPreviousPage == nil then
		var16 = var13.page <= 1
	else
		var16 = var13.hasPreviousPage ~= true
		var16 = nil
	end
	local var17
	if count ~= nil then
		local _ = count <= var13.page
	elseif var13.hasNextPage == nil then
		var17 = true
	else
		var17 = var13.hasNextPage ~= true
		var17 = nil
	end
	local var18, var19 = reactModule.useState(nil)
	local var20 = usePaginationNavModule(var13, {
		hasFirstLastButtons = var14,
		currentPage = var13.page,
		disabledState = {
			isBackDisabled = var16,
			isFirstDisabled = var16,
			isForwardDisabled = var17,
			isLastDisabled = var17
		}
	}, var19)
	reactModule.useImperativeHandle(p1, function() --[[ line: 64 ]]
		-- upvalues: var18 (ref)
		return var18
	end, { var18 })
	
	return var20.createLayout(reactModule.useMemo(function() --[[ line: 68 ]]
		-- upvalues: var15 (ref), var13 (ref), paginationUtilsModule (copy), reactModule (copy), chipModule (copy), size (ref), paginationSizeModule (copy), chipSizeModule (copy), chipVariantModule (copy), viewModule (copy), textModule (copy)
		if not var15 then
			return nil
		end
		local var21 = tostring(var13.page)
		
		return if paginationUtilsModule.needsWidePageSlot(var13.page) then reactModule.createElement(chipModule, {
			LayoutOrder = 2,
			isChecked = false,
			isDisabled = true,
			onActivated = function() --[[ line: 80 ]] end,
			size = if size == paginationSizeModule.Small then chipSizeModule.Small else chipSizeModule.Medium,
			testId = `{var13.testId}--page-label`,
			text = var21,
			variant = chipVariantModule.Utility
		}) else reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = paginationUtilsModule.getCircularSlotTag(size),
			testId = `{var13.testId}--page-label`
		}, {
			Text = reactModule.createElement(textModule, {
				LayoutOrder = 1,
				Text = var21,
				tag = paginationUtilsModule.getPageLabelTag(size)
			})
		})
	end, { var15, var13.page, size, var13.testId }))
end))