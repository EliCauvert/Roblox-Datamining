local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local answerFormViewModule = require(script.Parent.AnswerFormView)
local useAnswerFormViewModelModule = require(script.Parent.useAnswerFormViewModel)

return function(p1)
	-- upvalues: useAnswerFormViewModelModule (ref), reactModule (ref), answerFormViewModule (ref)
	local var1 = useAnswerFormViewModelModule(p1)
	
	return if var1 == nil then nil else reactModule.createElement(answerFormViewModule, var1)
end