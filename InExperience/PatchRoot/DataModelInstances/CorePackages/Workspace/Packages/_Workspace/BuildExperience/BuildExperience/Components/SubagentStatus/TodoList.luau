local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local LoadingIndicatorModule = require(script.Parent.LoadingIndicator)
local List = FoundationModule.List
local View = FoundationModule.View
local InputSize = FoundationModule.Enums.InputSize
local SubagentTaskStatus = require(Parent.DataHydration.CreatorAgentChat).SubagentTaskStatus

local function createTrailingIndicator(p1, TestId)
	-- upvalues: SubagentTaskStatus (copy), ReactModule (copy), View (copy), LoadingIndicatorModule (copy)
	return if p1.status == nil or p1.status == SubagentTaskStatus.Pending then nil else ReactModule.createElement(View, { tag = "auto-xy" }, {
		Indicator = ReactModule.createElement(LoadingIndicatorModule, {
			status = p1.status,
			testId = `{TestId}-loading-indicator`
		})
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), List (copy), createTrailingIndicator (copy), InputSize (copy)
	local TestId = p1.testId or "subagent-status-list"
	local Elements = {}
	
	for LayoutOrder, item in p1.items do
		local TestId1 = item.testId or `{TestId}-item-{LayoutOrder}`
		Elements[`Item{LayoutOrder}`] = ReactModule.createElement(List.Item, {
			LayoutOrder = LayoutOrder,
			description = item.description,
			testId = TestId1,
			title = item.title,
			trailing = createTrailingIndicator(item, TestId1)
		})
	end
	return ReactModule.createElement(List.Root, {
		hasDivider = false,
		LayoutOrder = p1.layoutOrder,
		isContained = { isContained = false, hasMargin = false },
		size = InputSize.Medium,
		testId = TestId
	}, Elements)
end)