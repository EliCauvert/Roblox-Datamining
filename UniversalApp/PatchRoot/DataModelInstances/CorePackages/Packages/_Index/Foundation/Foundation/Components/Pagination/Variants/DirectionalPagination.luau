local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ChipModule = require(Foundation.Components.Chip)
local TextModule = require(Foundation.Components.Text)
local ViewModule = require(Foundation.Components.View)
local ChipSizeModule = require(Foundation.Enums.ChipSize)
local ChipVariantModule = require(Foundation.Enums.ChipVariant)
local PaginationSizeModule = require(Foundation.Enums.PaginationSize)
local PaginationVariantModule = require(Foundation.Enums.PaginationVariant)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(script.Parent.MultiPagePagination)
local PaginationUtilsModule = require(script.Parent.Parent.paginationUtils)
local UsePaginationNavModule = require(script.Parent.Parent.usePaginationNav)
local config = {
	testId = "--foundation-pagination",
	size = PaginationSizeModule.Medium
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), PaginationVariantModule (copy), ReactModule (copy), UsePaginationNavModule (copy), PaginationUtilsModule (copy), ChipModule (copy), PaginationSizeModule (copy), ChipSizeModule (copy), ChipVariantModule (copy), ViewModule (copy), TextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local Size = WithDefaultsModuleResult.size
	local Count = WithDefaultsModuleResult.count
	local IsHasFirstLastButtons: boolean = Count ~= nil and WithDefaultsModuleResult.hasFirstLastButtons == true
	local IsVariantMatch = WithDefaultsModuleResult.variant == PaginationVariantModule.SinglePage
	local IsPageBelow: boolean = if WithDefaultsModuleResult.hasPreviousPage == nil then WithDefaultsModuleResult.page <= 1 else WithDefaultsModuleResult.hasPreviousPage ~= true
	local NoHasNextPage: boolean = if Count == nil then WithDefaultsModuleResult.hasNextPage == nil or WithDefaultsModuleResult.hasNextPage ~= true else Count <= WithDefaultsModuleResult.page
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UsePaginationNavModuleResult = UsePaginationNavModule(WithDefaultsModuleResult, {
		hasFirstLastButtons = IsHasFirstLastButtons,
		currentPage = WithDefaultsModuleResult.page,
		disabledState = {
			isBackDisabled = IsPageBelow,
			isFirstDisabled = IsPageBelow,
			isForwardDisabled = NoHasNextPage,
			isLastDisabled = NoHasNextPage
		}
	}, UseStateResult2)
	ReactModule.useImperativeHandle(p2, function()
		-- upvalues: UseStateResult (copy)
		return UseStateResult
	end, { UseStateResult })
	
	return UsePaginationNavModuleResult.createLayout((ReactModule.useMemo(function()
		-- upvalues: IsVariantMatch (copy), WithDefaultsModuleResult (copy), PaginationUtilsModule (upval), ReactModule (upval), ChipModule (upval), Size (copy), PaginationSizeModule (upval), ChipSizeModule (upval), ChipVariantModule (upval), ViewModule (upval), TextModule (upval)
		if IsVariantMatch then
			local Text = tostring(WithDefaultsModuleResult.page)
			
			return if PaginationUtilsModule.needsWidePageSlot(WithDefaultsModuleResult.page) then ReactModule.createElement(ChipModule, {
				LayoutOrder = 2,
				isChecked = false,
				isDisabled = true,
				onActivated = function() end,
				size = if Size == PaginationSizeModule.Small then ChipSizeModule.Small else ChipSizeModule.Medium,
				testId = `{WithDefaultsModuleResult.testId}--page-label`,
				text = Text,
				variant = ChipVariantModule.Utility
			}) else ReactModule.createElement(ViewModule, {
				LayoutOrder = 2,
				tag = PaginationUtilsModule.getCircularSlotTag(Size),
				testId = `{WithDefaultsModuleResult.testId}--page-label`
			}, {
				Text = ReactModule.createElement(TextModule, {
					LayoutOrder = 1,
					Text = Text,
					tag = PaginationUtilsModule.getPageLabelTag(Size)
				})
			})
		else
			return nil
		end
	end, {
		IsVariantMatch,
		WithDefaultsModuleResult.page,
		Size,
		WithDefaultsModuleResult.testId
	})))
end))