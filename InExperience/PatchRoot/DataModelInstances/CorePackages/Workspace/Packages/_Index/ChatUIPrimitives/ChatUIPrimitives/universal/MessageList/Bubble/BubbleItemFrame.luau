local ReactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)

return function(p1) --[[ Line: 11 | Named "BubbleItemFrame" ]]
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
end