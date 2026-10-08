local reactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	return reactModule.createElement(reactModule.Fragment, nil, p1.children)
end