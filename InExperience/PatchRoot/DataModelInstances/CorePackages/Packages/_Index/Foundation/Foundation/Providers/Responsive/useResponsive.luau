local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local ResponsiveContextModule = require(script.Parent.ResponsiveContext)

return function() --[[ Line: 9 | Named "useResponsive" ]]
	-- upvalues: ReactModule (copy), ResponsiveContextModule (copy)
	return ReactModule.useContext(ResponsiveContextModule)
end