local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local AnswerFormViewModule = require(script.Parent.AnswerFormView)
local UseAnswerFormViewModelModule = require(script.Parent.useAnswerFormViewModel)

return function(p1)
	-- upvalues: UseAnswerFormViewModelModule (copy), ReactModule (copy), AnswerFormViewModule (copy)
	local UseAnswerFormViewModelModuleResult = UseAnswerFormViewModelModule(p1)
	
	return if UseAnswerFormViewModelModuleResult == nil then nil else ReactModule.createElement(AnswerFormViewModule, UseAnswerFormViewModelModuleResult)
end