local responsiveModule = require(script:FindFirstAncestor("GameFilters").Parent.Responsive)
local useBreakpointXOrSmaller = responsiveModule.useBreakpointXOrSmaller

return function() --[[ line: 7 | named "shouldUsePeekView" ]]
	-- upvalues: useBreakpointXOrSmaller (ref), responsiveModule (ref)
	return useBreakpointXOrSmaller(responsiveModule.Keys.Small)
end