local ReactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(Delay, p1, Callback)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(0)
	
	local function handleAction()
		-- upvalues: p1 (copy), UseRefResult1 (copy), UseRefResult (copy), Delay (copy), Callback (copy)
		local ClockTime = os.clock()
		
		if p1 ~= nil and UseRefResult1.current ~= nil and ClockTime - UseRefResult1.current < p1 then return end
		UseRefResult1.current = ClockTime
		local Current = UseRefResult.current
		
		if Current ~= nil then
			task.cancel(Current)
		end
		UseRefResult.current = task.delay(Delay, function()
			-- upvalues: Callback (upval)
			Callback()
		end)
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			local Current = UseRefResult.current
			
			if Current ~= nil then
				task.cancel(Current)
			end
		end
	end, { UseRefResult })
	
	return handleAction
end