local _ = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local UseTurnStepCounterViewModelModule = require(script.Parent.useTurnStepCounterViewModel)

return function(p1)
	-- upvalues: UseTurnStepCounterViewModelModule (copy)
	UseTurnStepCounterViewModelModule(p1)
	
	return nil
end