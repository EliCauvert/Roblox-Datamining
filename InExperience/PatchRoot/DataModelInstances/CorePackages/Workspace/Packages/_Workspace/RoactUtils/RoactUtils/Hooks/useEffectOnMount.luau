local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function(p0)
	-- upvalues: reactModule (ref)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref)
		p0()
	end, {})
end