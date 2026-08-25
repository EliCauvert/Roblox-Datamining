local reactModule = require(script:FindFirstAncestor("MomentsCreationFlow").Parent.React)

return function(p0, p1)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref), p0 (ref)
		if p1 and not var1.current then
			p0()
			var1.current = true
		end
	end, { p1 })
end