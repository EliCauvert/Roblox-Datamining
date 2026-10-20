local RoactModule = require(script:FindFirstAncestor("RoactUtils").Parent.Roact)

return function(p1)
	-- upvalues: RoactModule (copy)
	p1.forwardRef = p1[RoactModule.Ref]
	p1[RoactModule.Ref] = nil
	
	return p1
end