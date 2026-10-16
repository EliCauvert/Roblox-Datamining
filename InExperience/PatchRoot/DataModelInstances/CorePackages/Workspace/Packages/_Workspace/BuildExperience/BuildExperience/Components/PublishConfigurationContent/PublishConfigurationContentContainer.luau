local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local PublishConfigurationContentViewModule = require(script.Parent.PublishConfigurationContentView)
local UsePublishConfigurationContentViewModelModule = require(script.Parent.usePublishConfigurationContentViewModel)

return function(p1) --[[ Line: 11 | Named "PublishConfigurationContentContainer" ]]
	-- upvalues: UsePublishConfigurationContentViewModelModule (copy), ReactModule (copy), PublishConfigurationContentViewModule (copy)
	return ReactModule.createElement(PublishConfigurationContentViewModule, (UsePublishConfigurationContentViewModelModule(p1)))
end