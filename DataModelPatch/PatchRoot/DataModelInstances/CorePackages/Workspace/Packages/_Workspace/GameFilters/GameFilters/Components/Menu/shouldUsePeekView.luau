local ResponsiveModule = require(script:FindFirstAncestor("GameFilters").Parent.Responsive)
local UseBreakpointXOrSmallerFunction = ResponsiveModule.useBreakpointXOrSmaller

return function()
	-- upvalues: UseBreakpointXOrSmallerFunction (copy), ResponsiveModule (copy)
	return UseBreakpointXOrSmallerFunction(ResponsiveModule.Keys.Small)
end