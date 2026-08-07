local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function(p0) --[[ line: 10 ]]
	-- upvalues: reactModule (ref)
	reactModule.useEffect(function() --[[ line: 11 ]]
		-- upvalues: p0 (ref)
		p0()
	end, {})
end