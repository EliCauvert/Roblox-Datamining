local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local radioGroupContextModule = require(script.Parent.RadioGroupContext)

return function()
	-- upvalues: reactModule (ref), radioGroupContextModule (ref)
	return reactModule.useContext(radioGroupContextModule)
end