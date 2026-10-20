local ReactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	local Children = p1.children
	
	for i = #p1.providers, 1, -1 do
		Children = ReactModule.cloneElement(p1.providers[i], nil, Children)
	end
	return Children
end