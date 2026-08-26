local roactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local contextModule = require(script.Parent.Context)

return function(p1)
	-- upvalues: roactModule (ref), contextModule (ref)
	assert(type(p1) == "function", "Expect renderCallback to be a function.")
	
	return roactModule.createElement(contextModule.Consumer, { render = p1 })
end