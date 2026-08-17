local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local inputGroupContextModule = require(script.Parent.InputGroupContext)

return function() --[[ line: 9 | named "useInputGroup" ]]
	-- upvalues: reactModule (ref), inputGroupContextModule (ref)
	return reactModule.useContext(inputGroupContextModule)
end