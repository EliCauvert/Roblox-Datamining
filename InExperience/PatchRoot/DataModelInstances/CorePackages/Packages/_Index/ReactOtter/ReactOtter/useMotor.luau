local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local OtterModule = require(Parent.Otter)

return function(p1, p2, p3)
	-- upvalues: ReactModule (copy), OtterModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	
	if not UseRefResult.current then
		local SingleMotor = nil
		SingleMotor = if typeof(p1) == "number" then OtterModule.createSingleMotor(p1) else OtterModule.createGroupMotor(p1)
		
		function UseRefResult1.current(p4)
			-- upvalues: SingleMotor (ref)
			SingleMotor:setGoal(p4)
		end
		
		UseRefResult.current = SingleMotor
	end
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), p3 (copy), p2 (copy)
		local Callback = nil
		local Callback1 = nil
		
		if UseRefResult.current then
			if p3 then
				Callback = UseRefResult.current:onComplete(p3)
			end
			Callback1 = UseRefResult.current:onStep(p2)
		end
		return function()
			-- upvalues: Callback (ref), Callback1 (ref)
			if Callback then
				Callback()
			end
			if Callback1 then
				Callback1()
			end
		end
	end, { p2, p3 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				UseRefResult.current:destroy()
				UseRefResult.current = nil
			end
		end
	end, { UseRefResult.current })
	
	return UseRefResult1.current
end