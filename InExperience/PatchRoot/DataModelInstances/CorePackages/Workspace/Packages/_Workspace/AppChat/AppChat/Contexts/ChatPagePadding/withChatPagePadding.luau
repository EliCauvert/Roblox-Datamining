local roactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local contextModule = require(script.Parent.Context)

return function(p0) --[[ line: 13 ]]
	-- upvalues: roactModule (ref), contextModule (ref)
	assert(type(p0) == "function", "Expect renderCallback to be a function.")
	
	return roactModule.createElement(contextModule.Consumer, { render = p0 })
end