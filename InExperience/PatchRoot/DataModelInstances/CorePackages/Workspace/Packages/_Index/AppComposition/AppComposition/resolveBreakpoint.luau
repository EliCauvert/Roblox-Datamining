local breakpoint = require(script:FindFirstAncestor("AppComposition").Parent.Foundation).Enums.Breakpoint
local t = {
	[breakpoint.XSmall] = 360,
	[breakpoint.Small] = 600,
	[breakpoint.Medium] = 1140,
	[breakpoint.Large] = 1520,
	[breakpoint.XLarge] = 1920,
	[breakpoint.XXLarge] = 1e999
}
local list = {
	breakpoint.XSmall, breakpoint.Small, breakpoint.Medium, breakpoint.Large,
	breakpoint.XLarge, breakpoint.XXLarge
}

return function(p0) --[[ line: 26 | named "resolveBreakpoint" ]]
	-- upvalues: list (ref), t (ref), breakpoint (ref)
	for i, v in list do
		if p0 <= (t[v] or 0) then
			return v
		end
	end
	return breakpoint.XXLarge
end