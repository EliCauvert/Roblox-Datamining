local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local StepActivityRowModule = require(script.Parent.StepActivityRow)
local _ = require(script.Parent.useTurnStepListViewModel)
local View = FoundationModule.View

return function(Frame)
	-- upvalues: ReactModule (copy), StepActivityRowModule (copy), View (copy)
	if #Frame.rows == 0 then
		return nil
	end
	local Elements = {}
	
	for LayoutOrder, row in Frame.rows do
		Elements[row.key] = ReactModule.createElement(StepActivityRowModule, {
			LayoutOrder = LayoutOrder,
			index = row.index,
			title = row.title,
			body = row.body,
			markdown = row.markdown,
			answers = row.answers,
			isRunning = row.isRunning,
			isFailed = row.isFailed,
			isLast = row.isLast,
			isExpanded = row.isExpanded,
			onToggle = row.onToggle
		})
	end
	return ReactModule.createElement(View, {
		tag = "col gap-xsmall size-full-0 auto-y padding-left-large",
		testId = "TurnStepList",
		LayoutOrder = Frame.LayoutOrder
	}, Elements)
end