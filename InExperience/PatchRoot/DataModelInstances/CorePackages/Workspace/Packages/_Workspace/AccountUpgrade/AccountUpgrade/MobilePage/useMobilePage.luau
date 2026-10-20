local ResponsiveModule = require(script:FindFirstAncestor("AccountUpgrade").Parent.Responsive)

return function()
	-- upvalues: ResponsiveModule (copy)
	return (ResponsiveModule.useBreakpointXOrSmaller(ResponsiveModule.Keys.Small))
end