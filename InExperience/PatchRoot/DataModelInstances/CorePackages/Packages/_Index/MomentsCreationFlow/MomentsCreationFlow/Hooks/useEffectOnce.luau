local reactModule = require(script:FindFirstAncestor("MomentsCreationFlow").Parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), var1 (ref), p1 (ref)
		if p2 and not var1.current then
			p1()
			var1.current = true
		end
	end, { p2 })
end