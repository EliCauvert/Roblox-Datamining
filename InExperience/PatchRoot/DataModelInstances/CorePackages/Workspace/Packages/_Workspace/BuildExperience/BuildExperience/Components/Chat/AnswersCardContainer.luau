local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local AnswersCardViewModule = require(script.Parent.AnswersCardView)
local UseAnswersCardViewModelModule = require(script.Parent.useAnswersCardViewModel)

return function(p1) --[[ Line: 10 | Named "AnswersCardContainer" ]]
	-- upvalues: UseAnswersCardViewModelModule (copy), ReactModule (copy), AnswersCardViewModule (copy)
	return ReactModule.createElement(AnswersCardViewModule, (UseAnswersCardViewModelModule(p1)))
end