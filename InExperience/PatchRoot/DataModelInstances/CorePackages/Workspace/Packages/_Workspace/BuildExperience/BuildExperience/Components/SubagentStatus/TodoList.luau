local parent = script:FindFirstAncestor("BuildExperience").Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local loadingIndicatorModule = require(script.Parent.LoadingIndicator)
local list = foundationModule.List
local view = foundationModule.View
local inputSize = foundationModule.Enums.InputSize
local subagentTaskStatus = creatorAgentChatModule.SubagentTaskStatus

local function createTrailingIndicator(p1, p2)
	-- upvalues: subagentTaskStatus (ref), reactModule (ref), view (ref), loadingIndicatorModule (ref)
	return if p1.status == nil or p1.status == subagentTaskStatus.Pending then nil else reactModule.createElement(view, { tag = "auto-xy" }, {
		Indicator = reactModule.createElement(loadingIndicatorModule, { status = p1.status, testId = `{p2}-loading-indicator` })
	})
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), list (ref), createTrailingIndicator (ref), inputSize (ref)
	local testId = p1.testId or "subagent-status-list"
	local t = {}
	
	for i, v in p1.items do
		local testId_1 = v.testId or `{testId}-item-{i}`
		t[`Item{i}`] = reactModule.createElement(list.Item, {
			LayoutOrder = i,
			description = v.description,
			testId = testId_1,
			title = v.title,
			trailing = createTrailingIndicator(v, testId_1)
		})
	end
	return reactModule.createElement(list.Root, {
		hasDivider = false,
		LayoutOrder = p1.layoutOrder,
		isContained = { isContained = false, hasMargin = false },
		size = inputSize.Medium,
		testId = testId
	}, t)
end)