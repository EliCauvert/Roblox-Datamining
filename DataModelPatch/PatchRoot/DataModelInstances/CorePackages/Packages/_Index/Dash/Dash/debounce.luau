local AssignModule = require(script.Parent.assign)

return function(Callback, Delay, p1)
	-- upvalues: AssignModule (copy)
	local AssignModuleResult = AssignModule({ leading = false, trailing = true }, p1)
	local Count = 0
	local DelayedThread = nil
	local Flag = false
	local v1 = if AssignModuleResult.trailing then function(Count1, p2, ...)
		-- upvalues: Count (ref), Flag (ref), Callback (copy)
		if Count == Count1 then
			Flag = false
			
			if not p2 then
				Callback(...)
			end
		end
	end elseif AssignModuleResult.leading then function(Count1)
		-- upvalues: Count (ref), Flag (ref)
		if Count == Count1 then
			Flag = false
		end
	end else function() end
	
	return function(...)
		-- upvalues: Count (ref), AssignModuleResult (copy), Flag (ref), DelayedThread (ref), Callback (copy), Delay (copy), v1 (ref)
		Count += 1
		local Count1: number = Count
		local NoFlag: boolean = AssignModuleResult.leading and not Flag
		
		if DelayedThread then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
		if NoFlag then
			Flag = true
			Callback(...)
		end
		DelayedThread = task.delay(Delay, v1, Count1, NoFlag, ...)
	end
end