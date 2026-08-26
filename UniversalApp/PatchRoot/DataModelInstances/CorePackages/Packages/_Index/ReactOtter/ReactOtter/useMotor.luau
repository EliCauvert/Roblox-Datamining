local parent = script.Parent.Parent
local reactModule = require(parent.React)
local otterModule = require(parent.Otter)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), otterModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	
	if not var1.current then
		local var3 = if typeof(p1) == "number" then otterModule.createSingleMotor(p1) else otterModule.createGroupMotor(p1)
		
		function var3.current(p4)
			-- upvalues: var3 (write)
			var3:setGoal(p4)
		end
		
		var1.current = var3
	end
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p3 (ref), p2 (ref)
		local var4 = nil
		local var5 = nil
		
		if var1.current then
			if p3 then
				var4 = var1.current:onComplete(p3)
			end
			var5 = var1.current:onStep(p2)
		end
		return function()
			-- upvalues: var4 (write), var5 (write)
			if var4 then
				var4()
			end
			if var5 then
				var5()
			end
		end
	end, { p2, p3 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		return function()
			-- upvalues: var1 (copy)
			if var1.current then
				var1.current:destroy()
				var1.current = nil
			end
		end
	end, { var1.current })
	
	return var2.current
end