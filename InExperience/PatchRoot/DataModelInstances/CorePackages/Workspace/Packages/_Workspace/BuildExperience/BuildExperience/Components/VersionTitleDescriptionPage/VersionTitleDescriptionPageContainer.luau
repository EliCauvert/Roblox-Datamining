local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local versionTitleDescriptionPageViewModule = require(script.Parent.VersionTitleDescriptionPageView)
local useVersionTitleDescriptionPageViewModelModule = require(script.Parent.useVersionTitleDescriptionPageViewModel)

return function(p0)
	-- upvalues: useVersionTitleDescriptionPageViewModelModule (ref), reactModule (ref), versionTitleDescriptionPageViewModule (ref)
	return reactModule.createElement(versionTitleDescriptionPageViewModule, useVersionTitleDescriptionPageViewModelModule(p0))
end