local AssignModule = require(script.Parent.assign)

return function(Callback, p1: number, p2)
	-- upvalues: AssignModule (copy)
	local AssignModuleResult = AssignModule({ leading = true, trailing = true }, p2)
	local Largest = math.max(0, p1)
	local Leading = AssignModuleResult.leading
	local Trailing = AssignModuleResult.trailing
	local ClockTime = -1e999
	local DelayedThread = nil
	local t = {}
	
	local function _()
		-- upvalues: DelayedThread (ref)
		if DelayedThread then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
	end
	
	local function invoke()
		-- upvalues: ClockTime (ref), DelayedThread (ref), Callback (copy), t (ref)
		ClockTime = os.clock()
		DelayedThread = nil
		Callback(table.unpack(t))
	end
	
	return function(...)
		-- upvalues: t (ref), ClockTime (ref), Leading (copy), Largest (copy), DelayedThread (ref), Callback (copy), Trailing (copy), invoke (copy)
		local ClockTime1 = os.clock()
		t = { ... }
		
		if Leading and Largest <= ClockTime1 - ClockTime then
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
			ClockTime = os.clock()
			DelayedThread = nil
			Callback(table.unpack(t))
			
			return
		else
			if Trailing and not DelayedThread then
				local LargestDelta = Largest - (ClockTime1 - (ClockTime == -1e999 and ClockTime1 or ClockTime))
				
				if LargestDelta < 0 then
					LargestDelta = 0
				end
				DelayedThread = task.delay(LargestDelta, invoke)
			end
		end
	end
end