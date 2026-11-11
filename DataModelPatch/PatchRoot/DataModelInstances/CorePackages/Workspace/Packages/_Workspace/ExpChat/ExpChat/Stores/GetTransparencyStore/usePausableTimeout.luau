local ReactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

return function(p1, p2, p3)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(0)
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), p1 (copy), UseRefResult (copy), p3 (copy)
		if p2 <= 0 or not p1 then
			return nil
		else
			local ClockTime = os.clock()
			local DelayedThread = task.delay(math.max(0, p2 - UseRefResult.current), p3)
			
			return function()
				-- upvalues: UseRefResult (upval), ClockTime (copy), DelayedThread (copy)
				UseRefResult.current += os.clock() - ClockTime
				pcall(task.cancel, DelayedThread)
			end
		end
	end, { p1, p2, p3 })
end