local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local Progress = FoundationModule.Progress
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local ProgressShape = FoundationModule.Enums.ProgressShape
local ProgressSize = FoundationModule.Enums.ProgressSize
local SubagentTaskStatus = require(Parent.DataHydration.CreatorAgentChat).SubagentTaskStatus

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), SubagentTaskStatus (copy), View (copy), Progress (copy), ProgressShape (copy), ProgressSize (copy), Icon (copy), IconName (copy), IconSize (copy)
	local UseBindingResult = ReactModule.useBinding(0)
	local TestId = p1.testId or "subagent-status-loading-indicator"
	local LayoutOrder = p1.layoutOrder
	
	return if p1.status == SubagentTaskStatus.InProgress then ReactModule.createElement(View, {
		tag = "auto-xy clip",
		LayoutOrder = LayoutOrder,
		GroupTransparency = UseBindingResult
	}, {
		Progress = ReactModule.createElement(Progress, {
			shape = ProgressShape.Circle,
			size = ProgressSize.Small,
			testId = `{TestId}-loading`
		})
	}) elseif p1.status == SubagentTaskStatus.Done then ReactModule.createElement(Icon, {
		tag = "auto-xy content-system-success",
		LayoutOrder = LayoutOrder,
		name = IconName.CircleCheck,
		size = IconSize.Small,
		testId = `{TestId}-check-icon`
	}) elseif p1.status == SubagentTaskStatus.Deleted then ReactModule.createElement(Icon, {
		tag = "auto-xy content-emphasis",
		LayoutOrder = LayoutOrder,
		name = IconName.CircleSlash,
		size = IconSize.Small,
		testId = `{TestId}-deleted-icon`
	}) elseif p1.status == SubagentTaskStatus.Error then ReactModule.createElement(Icon, {
		tag = "auto-xy content-system-alert",
		LayoutOrder = LayoutOrder,
		name = IconName.TriangleExclamation,
		size = IconSize.Small,
		testId = `{TestId}-error-icon`
	}) else nil
end)