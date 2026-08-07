local roactModule = require(script:FindFirstAncestor("RoactUtils").Parent.Roact)

return function(p0) --[[ line: 6 | named "validateWithRefForwarding" ]]
	-- upvalues: roactModule (ref)
	p0.forwardRef = p0[roactModule.Ref]
	p0[roactModule.Ref] = nil
	
	return p0
end