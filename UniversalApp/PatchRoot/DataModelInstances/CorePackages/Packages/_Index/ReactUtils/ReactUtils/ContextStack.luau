local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local children = p1.children
	
	for i = #p1.providers, 1, -1 do
		children = reactModule.cloneElement(p1.providers[i], nil, children)
	end
	return children
end