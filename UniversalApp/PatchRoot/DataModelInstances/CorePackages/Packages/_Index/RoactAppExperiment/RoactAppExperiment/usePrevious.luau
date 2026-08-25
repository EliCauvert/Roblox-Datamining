local reactModule = require(script:FindFirstAncestor("RoactAppExperiment").Parent.React)

return function(p0)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p0 (ref)
		var1.current = p0
	end)
	
	return var1.current
end