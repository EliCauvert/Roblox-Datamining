local ResponsiveModule = require(script:FindFirstAncestor("AccountUpgrade").Parent.Responsive)

return function() --[[ Line: 8 | Named "useMobilePage" ]]
	-- upvalues: ResponsiveModule (copy)
	return (ResponsiveModule.useBreakpointXOrSmaller(ResponsiveModule.Keys.Small))
end