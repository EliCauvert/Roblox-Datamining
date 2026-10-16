local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local RadioGroupContextModule = require(script.Parent.RadioGroupContext)

return function() --[[ Line: 15 ]]
	-- upvalues: ReactModule (copy), RadioGroupContextModule (copy)
	return ReactModule.useContext(RadioGroupContextModule)
end