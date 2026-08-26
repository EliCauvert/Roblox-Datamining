local parent = script:FindFirstAncestor("BuildExperience").Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local icon = foundationModule.Icon
local progress = foundationModule.Progress
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local progressShape = foundationModule.Enums.ProgressShape
local progressSize = foundationModule.Enums.ProgressSize
local subagentTaskStatus = creatorAgentChatModule.SubagentTaskStatus

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), subagentTaskStatus (ref), view (ref), progress (ref), progressShape (ref), progressSize (ref), icon (ref), iconName (ref), iconSize (ref)
	local var1 = reactModule.useBinding(0)
	local testId = p1.testId or "subagent-status-loading-indicator"
	local layoutOrder = p1.layoutOrder
	
	return if p1.status == subagentTaskStatus.InProgress then reactModule.createElement(view, {
		tag = "auto-xy clip",
		LayoutOrder = layoutOrder,
		GroupTransparency = var1
	}, {
		Progress = reactModule.createElement(progress, {
			shape = progressShape.Circle,
			size = progressSize.Small,
			testId = `{testId}-loading`
		})
	}) elseif p1.status == subagentTaskStatus.Done then reactModule.createElement(icon, {
		tag = "auto-xy content-system-success",
		LayoutOrder = layoutOrder,
		name = iconName.CircleCheck,
		size = iconSize.Small,
		testId = `{testId}-check-icon`
	}) elseif p1.status == subagentTaskStatus.Deleted then reactModule.createElement(icon, {
		tag = "auto-xy content-emphasis",
		LayoutOrder = layoutOrder,
		name = iconName.CircleSlash,
		size = iconSize.Small,
		testId = `{testId}-deleted-icon`
	}) elseif p1.status == subagentTaskStatus.Error then reactModule.createElement(icon, {
		tag = "auto-xy content-system-alert",
		LayoutOrder = layoutOrder,
		name = iconName.TriangleExclamation,
		size = iconSize.Small,
		testId = `{testId}-error-icon`
	}) else nil
end)