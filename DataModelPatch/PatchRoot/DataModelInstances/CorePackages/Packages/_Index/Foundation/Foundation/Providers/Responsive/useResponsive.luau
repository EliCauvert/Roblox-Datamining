local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local ResponsiveContextModule = require(script.Parent.ResponsiveContext)

return function()
	-- upvalues: ReactModule (copy), ResponsiveContextModule (copy)
	return ReactModule.useContext(ResponsiveContextModule)
end