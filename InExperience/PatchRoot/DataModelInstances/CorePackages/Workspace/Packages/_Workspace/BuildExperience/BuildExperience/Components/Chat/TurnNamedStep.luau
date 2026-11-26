local _ = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local UseTurnNamedStepViewModelModule = require(script.Parent.useTurnNamedStepViewModel)

return function(p1)
	-- upvalues: UseTurnNamedStepViewModelModule (copy)
	UseTurnNamedStepViewModelModule(p1)
	
	return nil
end