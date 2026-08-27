local breakpoint = require(script:FindFirstAncestor("BuildExperience").Parent.Foundation).Enums.Breakpoint

return function(p1)
	-- upvalues: breakpoint (ref)
	return if p1 == breakpoint.XSmall then 1 else 2
end