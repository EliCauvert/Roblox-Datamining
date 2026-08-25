local breakpoint = require(script:FindFirstAncestor("BuildExperience").Parent.Foundation).Enums.Breakpoint

return function(p0)
	-- upvalues: breakpoint (ref)
	return if p0 == breakpoint.XSmall then 1 else 2
end