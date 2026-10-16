local ResponsiveModule = require(script:FindFirstAncestor("GameFilters").Parent.Responsive)
local UseBreakpointXOrSmallerFunction = ResponsiveModule.useBreakpointXOrSmaller

return function() --[[ Line: 7 | Named "shouldUsePeekView" ]]
	-- upvalues: UseBreakpointXOrSmallerFunction (copy), ResponsiveModule (copy)
	return UseBreakpointXOrSmallerFunction(ResponsiveModule.Keys.Small)
end