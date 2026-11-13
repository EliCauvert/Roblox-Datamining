local TimeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local ConstantsModule = require(TimeToInteractiveTracker.Milestones.constants)
local _ = require(TimeToInteractiveTracker.Stores.types)

return function(p1): boolean
	-- upvalues: ConstantsModule (copy)
	if p1 == nil or p1.milestones == nil then
		return false
	end
	for _, milestone in p1.milestones do
		if milestone.name == ConstantsModule.NavigationCommitted then
			return true
		end
	end
	return false
end