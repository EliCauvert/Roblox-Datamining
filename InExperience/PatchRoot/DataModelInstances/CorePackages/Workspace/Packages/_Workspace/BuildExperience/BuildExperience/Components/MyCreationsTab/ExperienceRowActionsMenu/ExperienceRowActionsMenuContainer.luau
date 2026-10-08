local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local experienceRowActionsMenuViewModule = require(script.Parent.ExperienceRowActionsMenuView)
local useExperienceRowActionsMenuViewModelModule = require(script.Parent.useExperienceRowActionsMenuViewModel)

return function(p1)
	-- upvalues: useExperienceRowActionsMenuViewModelModule (ref), reactModule (ref), experienceRowActionsMenuViewModule (ref)
	return reactModule.createElement(experienceRowActionsMenuViewModule, useExperienceRowActionsMenuViewModelModule(p1))
end