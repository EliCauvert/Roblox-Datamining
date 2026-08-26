local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(false)
	local var2 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), p1 (ref)
		if not var1.current then
			var1.current = true
			
			return
		elseif not var2.current then
			var2.current = true
		end
		if p1 then
			p1()
		end
	end)
	
	return var2
end