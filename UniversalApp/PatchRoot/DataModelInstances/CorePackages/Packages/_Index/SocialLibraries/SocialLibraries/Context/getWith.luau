local roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact

return function(p1)
	-- upvalues: roact (ref)
	return function(p2)
		-- upvalues: roact (copy), p1 (ref)
		assert(type(p2) == "function", "Expect renderCallback to be a function.")
		
		return roact.createElement(p1.Consumer, { render = p2 })
	end
end