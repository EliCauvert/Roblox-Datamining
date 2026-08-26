local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref)
		p1()
	end, {})
end