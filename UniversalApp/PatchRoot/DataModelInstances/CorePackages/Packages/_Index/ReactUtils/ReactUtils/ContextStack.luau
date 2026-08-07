local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p0) --[[ line: 12 | named "ContextStack" ]]
	-- upvalues: reactModule (ref)
	local children = p0.children
	
	for i = #p0.providers, 1, -1 do
		children = reactModule.cloneElement(p0.providers[i], nil, children)
	end
	return children
end