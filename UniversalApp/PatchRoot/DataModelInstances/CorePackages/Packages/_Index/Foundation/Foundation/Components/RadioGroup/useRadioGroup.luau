local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local radioGroupContextModule = require(script.Parent.RadioGroupContext)

return function() --[[ line: 15 ]]
	-- upvalues: reactModule (ref), radioGroupContextModule (ref)
	return reactModule.useContext(radioGroupContextModule)
end