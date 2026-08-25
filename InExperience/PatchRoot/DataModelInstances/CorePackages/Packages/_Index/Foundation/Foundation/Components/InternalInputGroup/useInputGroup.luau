local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local inputGroupContextModule = require(script.Parent.InputGroupContext)

return function()
	-- upvalues: reactModule (ref), inputGroupContextModule (ref)
	return reactModule.useContext(inputGroupContextModule)
end