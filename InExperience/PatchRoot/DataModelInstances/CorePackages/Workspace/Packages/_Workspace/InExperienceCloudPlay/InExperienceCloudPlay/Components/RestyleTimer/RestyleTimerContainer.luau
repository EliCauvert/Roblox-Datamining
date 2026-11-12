local ReactModule = require(script:FindFirstAncestor("InExperienceCloudPlay").Parent.React)
local RestyleTimerViewModule = require(script.Parent.RestyleTimerView)
local UseRestyleTimerViewModelModule = require(script.Parent.useRestyleTimerViewModel)

return function(p1)
	-- upvalues: UseRestyleTimerViewModelModule (copy), ReactModule (copy), RestyleTimerViewModule (copy)
	local UseRestyleTimerViewModelModuleResult = UseRestyleTimerViewModelModule(p1)
	
	return if UseRestyleTimerViewModelModuleResult then ReactModule.createElement(RestyleTimerViewModule, UseRestyleTimerViewModelModuleResult) else nil
end