local roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact

return function(p0)
	-- upvalues: roact (ref)
	return function(p1)
		-- upvalues: roact (copy), p0 (ref)
		assert(type(p1) == "function", "Expect renderCallback to be a function.")
		
		return roact.createElement(p0.Consumer, { render = p1 })
	end
end