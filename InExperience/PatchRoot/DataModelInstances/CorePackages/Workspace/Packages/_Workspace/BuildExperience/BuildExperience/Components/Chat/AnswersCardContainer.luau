local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local answersCardViewModule = require(script.Parent.AnswersCardView)
local useAnswersCardViewModelModule = require(script.Parent.useAnswersCardViewModel)

return function(p1)
	-- upvalues: useAnswersCardViewModelModule (ref), reactModule (ref), answersCardViewModule (ref)
	return reactModule.createElement(answersCardViewModule, useAnswersCardViewModelModule(p1))
end