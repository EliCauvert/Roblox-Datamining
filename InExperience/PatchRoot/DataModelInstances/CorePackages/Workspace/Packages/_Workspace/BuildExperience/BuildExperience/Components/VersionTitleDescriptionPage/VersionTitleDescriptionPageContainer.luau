local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local VersionTitleDescriptionPageViewModule = require(script.Parent.VersionTitleDescriptionPageView)
local UseVersionTitleDescriptionPageViewModelModule = require(script.Parent.useVersionTitleDescriptionPageViewModel)

return function(p1)
	-- upvalues: UseVersionTitleDescriptionPageViewModelModule (copy), ReactModule (copy), VersionTitleDescriptionPageViewModule (copy)
	return ReactModule.createElement(VersionTitleDescriptionPageViewModule, (UseVersionTitleDescriptionPageViewModelModule(p1)))
end