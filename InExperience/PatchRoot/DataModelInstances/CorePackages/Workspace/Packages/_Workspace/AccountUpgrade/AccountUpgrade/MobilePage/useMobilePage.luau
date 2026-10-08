local responsiveModule = require(script:FindFirstAncestor("AccountUpgrade").Parent.Responsive)

return function()
	-- upvalues: responsiveModule (ref)
	return responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small)
end