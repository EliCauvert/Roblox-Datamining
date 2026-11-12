local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local AnimatedChipGroupViewModule = require(script.Parent.AnimatedChipGroupView)
local UseAnimatedChipGroupViewModelModule = require(script.Parent.useAnimatedChipGroupViewModel)

return function(p1)
	-- upvalues: UseAnimatedChipGroupViewModelModule (copy), ReactModule (copy), AnimatedChipGroupViewModule (copy)
	return ReactModule.createElement(AnimatedChipGroupViewModule, (UseAnimatedChipGroupViewModelModule(p1)))
end