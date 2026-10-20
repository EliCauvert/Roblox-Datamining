local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local InputGroupContextModule = require(script.Parent.InputGroupContext)

return function()
	-- upvalues: ReactModule (copy), InputGroupContextModule (copy)
	return ReactModule.useContext(InputGroupContextModule)
end