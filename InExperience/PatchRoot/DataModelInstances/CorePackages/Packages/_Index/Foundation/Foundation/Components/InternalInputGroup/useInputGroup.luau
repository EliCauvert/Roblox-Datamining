local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local InputGroupContextModule = require(script.Parent.InputGroupContext)

return function() --[[ Line: 9 | Named "useInputGroup" ]]
	-- upvalues: ReactModule (copy), InputGroupContextModule (copy)
	return ReactModule.useContext(InputGroupContextModule)
end