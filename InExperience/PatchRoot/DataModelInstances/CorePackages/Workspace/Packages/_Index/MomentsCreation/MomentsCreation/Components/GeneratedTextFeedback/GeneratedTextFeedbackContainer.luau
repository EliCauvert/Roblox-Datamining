local ReactModule = require(script:FindFirstAncestor("MomentsCreation").Parent.React)
local GeneratedTextFeedbackViewModule = require(script.Parent.GeneratedTextFeedbackView)
local UseGeneratedTextFeedbackViewModelModule = require(script.Parent.useGeneratedTextFeedbackViewModel)

return function(p1)
	-- upvalues: UseGeneratedTextFeedbackViewModelModule (copy), ReactModule (copy), GeneratedTextFeedbackViewModule (copy)
	return ReactModule.createElement(GeneratedTextFeedbackViewModule, (UseGeneratedTextFeedbackViewModelModule(p1)))
end