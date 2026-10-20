local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Progress = FoundationModule.Progress
local ProgressShape = FoundationModule.Enums.ProgressShape
local UsePageNavigationFunction = require(NotApprovedPage.Contexts.PageNavigationContext).usePageNavigation

return ReactModule.memo(function()
	-- upvalues: UsePageNavigationFunction (copy), ReactModule (copy), Progress (copy), ProgressShape (copy)
	local Progress1: number = UsePageNavigationFunction().getProgress()
	
	return Progress1 > 0 and ReactModule.createElement(Progress, {
		testId = "header-progress-bar",
		value = Progress1,
		shape = ProgressShape.Bar
	}) or nil
end)