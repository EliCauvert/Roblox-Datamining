local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local optionSelectorModule = require(script.Parent.OptionSelector)
local view = foundationModule.View

return function(p0) --[[ line: 27 | named "AnswerStack" ]]
	-- upvalues: reactModule (ref), optionSelectorModule (ref), view (ref)
	local onOptionSelected = p0.onOptionSelected
	local t = {}
	
	for i, v in p0.options do
		if p0.selectedOptionId == nil or v.id == p0.selectedOptionId then
			t[v.id] = reactModule.createElement(optionSelectorModule, {
				LayoutOrder = i,
				title = v.title,
				description = v.description,
				isSelected = v.id == p0.selectedOptionId,
				testId = `AnswerStack.Option.{v.id}`,
				onActivated = function() --[[ line: 42 ]]
					-- upvalues: onOptionSelected (ref), v (ref)
					onOptionSelected(v)
				end
			})
		end
	end
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y padding-top-small",
		LayoutOrder = p0.LayoutOrder,
		testId = p0.testId or "AnswerStack"
	}, t)
end