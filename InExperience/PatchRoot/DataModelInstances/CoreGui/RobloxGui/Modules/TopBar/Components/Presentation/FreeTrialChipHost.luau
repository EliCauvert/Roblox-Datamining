local ReactModule = require(game:GetService("CorePackages").Packages.React)
local FreeTrialChipHostViewModule = require(script.Parent.FreeTrialChipHostView)
local UseFreeTrialChipHostViewModelModule = require(script.Parent.useFreeTrialChipHostViewModel)

return function(p1)
	-- upvalues: UseFreeTrialChipHostViewModelModule (copy), ReactModule (copy), FreeTrialChipHostViewModule (copy)
	local UseFreeTrialChipHostViewModelModuleResult = UseFreeTrialChipHostViewModelModule(p1)
	
	return if UseFreeTrialChipHostViewModelModuleResult == nil then nil else ReactModule.createElement(FreeTrialChipHostViewModule, UseFreeTrialChipHostViewModelModuleResult)
end