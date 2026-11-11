local Breakpoint = require(script:FindFirstAncestor("AppComposition").Parent.Foundation).Enums.Breakpoint
local config = {
	[Breakpoint.XSmall] = 360,
	[Breakpoint.Small] = 600,
	[Breakpoint.Medium] = 1140,
	[Breakpoint.Large] = 1520,
	[Breakpoint.XLarge] = 1920,
	[Breakpoint.XXLarge] = 1e999
}
local list = {
	Breakpoint.XSmall, Breakpoint.Small, Breakpoint.Medium, Breakpoint.Large,
	Breakpoint.XLarge, Breakpoint.XXLarge
}

return function(p1)
	-- upvalues: list (copy), config (copy), Breakpoint (copy)
	for _, value in list do
		if p1 <= (config[value] or 0) then
			return value
		end
	end
	return Breakpoint.XXLarge
end