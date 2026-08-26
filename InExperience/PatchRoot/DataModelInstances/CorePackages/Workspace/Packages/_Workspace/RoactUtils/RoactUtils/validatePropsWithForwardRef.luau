local roactModule = require(script:FindFirstAncestor("RoactUtils").Parent.Roact)

return function(p1)
	-- upvalues: roactModule (ref)
	p1.forwardRef = p1[roactModule.Ref]
	p1[roactModule.Ref] = nil
	
	return p1
end