local RoactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local ContextModule = require(script.Parent.Context)

return function(Callback)
	-- upvalues: RoactModule (copy), ContextModule (copy)
	assert(type(Callback) == "function", "Expect renderCallback to be a function.")
	
	return RoactModule.createElement(ContextModule.Consumer, { render = Callback })
end