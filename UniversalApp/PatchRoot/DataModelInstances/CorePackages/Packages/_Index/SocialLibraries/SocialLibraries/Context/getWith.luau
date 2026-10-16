local Roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact

return function(p1) --[[ Line: 5 ]]
	-- upvalues: Roact (copy)
	return function(Callback) --[[ Line: 6 ]]
		-- upvalues: Roact (upval), p1 (copy)
		assert(type(Callback) == "function", "Expect renderCallback to be a function.")
		
		return Roact.createElement(p1.Consumer, { render = Callback })
	end
end