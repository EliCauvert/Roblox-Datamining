local reactModule = require(script:FindFirstAncestor("MomentsCreation").Parent.React)
local generatedTextFeedbackViewModule = require(script.Parent.GeneratedTextFeedbackView)
local useGeneratedTextFeedbackViewModelModule = require(script.Parent.useGeneratedTextFeedbackViewModel)

return function(p1)
	-- upvalues: useGeneratedTextFeedbackViewModelModule (ref), reactModule (ref), generatedTextFeedbackViewModule (ref)
	return reactModule.createElement(generatedTextFeedbackViewModule, useGeneratedTextFeedbackViewModelModule(p1))
end