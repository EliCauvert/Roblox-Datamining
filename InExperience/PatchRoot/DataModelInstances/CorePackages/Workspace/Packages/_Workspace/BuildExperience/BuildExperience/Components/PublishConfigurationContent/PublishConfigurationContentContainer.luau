local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local publishConfigurationContentViewModule = require(script.Parent.PublishConfigurationContentView)
local usePublishConfigurationContentViewModelModule = require(script.Parent.usePublishConfigurationContentViewModel)

return function(p1)
	-- upvalues: usePublishConfigurationContentViewModelModule (ref), reactModule (ref), publishConfigurationContentViewModule (ref)
	return reactModule.createElement(publishConfigurationContentViewModule, usePublishConfigurationContentViewModelModule(p1))
end