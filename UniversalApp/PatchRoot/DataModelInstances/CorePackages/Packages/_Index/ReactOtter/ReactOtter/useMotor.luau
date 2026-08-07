local parent = script.Parent.Parent
local reactModule = require(parent.React)
local otterModule = require(parent.Otter)

return function(p0, p1, p2) --[[ line: 13 | named "useMotor" ]]
	-- upvalues: reactModule (ref), otterModule (ref)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	
	if not var2.current then
		local var4 = if typeof(p0) == "number" then otterModule.createSingleMotor(p0) else otterModule.createGroupMotor(p0)
		
		function var3.current(p3) --[[ line: 26 ]]
			-- upvalues: var4 (write)
			var4:setGoal(p3)
		end
		
		var2.current = var4
	end
	reactModule.useEffect(function() --[[ line: 34 ]]
		-- upvalues: var2 (ref), p2 (ref), p1 (ref)
		local var5 = nil
		local var6 = nil
		
		if var2.current then
			if p2 then
				var5 = var2.current:onComplete(p2)
			end
			var6 = var2.current:onStep(p1)
		end
		return function() --[[ line: 43 ]]
			-- upvalues: var5 (write), var6 (write)
			if var5 then
				var5()
			end
			if var6 then
				var6()
			end
		end
	end, { p1, p2 })
	reactModule.useEffect(function() --[[ line: 54 ]]
		-- upvalues: var2 (ref)
		return function() --[[ line: 55 ]]
			-- upvalues: var2 (copy)
			if var2.current then
				var2.current:destroy()
				var2.current = nil
			end
		end
	end, { var2.current })
	
	return var3.current
end